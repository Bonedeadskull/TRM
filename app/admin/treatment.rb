ActiveAdmin.register Treatment do
  permit_params :athlete_id, :trainer_id, :treatment_location, :comment, :date, :time, cures_attributes: [:id, :name, :treatment_id, :taction_id, :_destroy]
  active_admin_import
  menu priority: 2, label: "Treatments"

  csv do
    column(:athlete_id) do |injury|
      begin
        injury.athlete.last_name + ", " + injury.athlete.first_name
      rescue
        "Athlete Not Found"
      end
    end
   column :treatment_location
   column :cures do |treatment|
     treatment.cures.map { |a| a.taction }.join(", ").html_safe
   end
   column(:trainer_id) do |injury|
     begin
       injury.trainer.last_name + ", " + injury.trainer.first_name
     rescue
       "Trainer Not Found"
     end
   end
   column :date
   column :time
   column :comment
  end

  action_item :only => :index do
    link_to "Hide Filters", '#', :onclick => 'toggleFilters()',  :id => 'filter_button'
  end

  member_action :clone, method: :get do
    @treatment = resource.clone!

    #redirect_to edit_admin_treatment_path( @treatment )
    redirect_to collection_url
  end

  action_item :only => :show do
    link_to("Duplicate", clone_admin_treatment_path(id: treatment.id))
  end

  actions :all
  controller do
    def action_methods
      if current_trainer.admin?
        super - ['']
      else
        super - ['destroy']
      end
    end
  end


  controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end

  index do
    selectable_column
    column :athlete_id, :sortable => 'athletes.last_name' do |injury|
      begin
        link_to(injury.athlete.last_name + ", " + injury.athlete.first_name, admin_treatment_path(injury))
      rescue
        "Athlete Not Found"
      end
    end
    column 'Location', :treatment_location
    column 'Actions', :taction do |treatment|
      treatment.tactions.map { |a| a.name }.join(", ").html_safe
    end
    column :date
    column :time, :sortable => 'id'
    column :comment
    column 'Trainer' do |treatment|
      begin
      link_to(treatment.trainer.first_name + ' ' + treatment.trainer.last_name, admin_trainer_path(treatment.trainer))
      rescue
        "Trainer Not Found"
      end
    end
    actions
  end

  show do
    attributes_table do
      row :athlete
      row :trainer do
        link_to(treatment.trainer.first_name + ' ' + treatment.trainer.last_name, admin_trainer_path(treatment.trainer))
      end
      row :treatment_location
      row "Actions", :taction do |treatment|
        treatment.tactions.map { |a| a.name }.join(", ").html_safe
      end
      row :date
      row :time
    end
  end

  controller do
    def scoped_collection
      end_of_association_chain.includes(:athlete)
    end
  end

  filter :athlete, label: 'Name'
  filter :date, label: 'Treatment Date'
  filter :treatment_location, :as => :select, :collection => ->{Location.all.order("location ASC").map(&:location)}
  filter :tactions, label: 'Actions', :as => :select, :collection => Taction.order("name ASC").all
  filter :trainer, label: 'Trainer'


  form do |f|
     f.inputs "Treatment Details" do
       f.input :athlete, :collection => Athlete.all.sort_by(&:last_name), :required => true
       f.input :trainer, :collection => Hash[Trainer.all.map{|t| [t.last_name + ', ' + t.first_name,t.id]}], :required => true
       f.input :treatment_location, :collection => Location.all.order("location ASC").map { |a| a.location }
       f.has_many :cures, :heading => 'Actions', :allow_destroy => true do |a|
        a.input :taction, :label => 'Action', :collection => Taction.all.order("name ASC")
        end
       f.input :comment, label: 'Trainer Comments'
       if f.object.new_record?
         f.input :date, as: :datepicker, datepicker_options: {dateFormat: 'mm/dd/yy', changeYear: true},  :input_html => { :value => Date.today.strftime("%m/%d/%Y")}, :required => true
         f.input :time, :input_html => { :value => Time.now.strftime("%I:%M %p")}, :required => true
       else
         f.input :date, as: :datepicker, datepicker_options: {dateFormat: 'mm/dd/yy', changeYear: true}, :required => true
         f.input :time, :required => true
       end
     end
     f.actions
   end

end
