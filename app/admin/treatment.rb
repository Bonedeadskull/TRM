ActiveAdmin.register Treatment,  { :sort_order => :date_desc }  do
  permit_params :athlete_id, :trainer_id, :treatment_location, :comment, :date, :time, cures_attributes: [:id, :name, :treatment_id, :action_id, :_destroy]
  active_admin_import
  menu priority: 2, label: "Treatments"

  csv do
   column(:athlete_id) { |treatment| treatment.athlete.last_name }
   column(:athlete_id) { |treatment| treatment.athlete.first_name }
   column :treatment_location
   column :action do |treatment|
       treatment.actions.map { |a| a.name }.join(", ").html_safe
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

    redirect_to edit_admin_treatment_path( @treatment )
    #redirect_to collection_url
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
      link_to(injury.athlete.last_name + ", " + injury.athlete.first_name, admin_treatment_path(injury))
    end
    column 'Location', :treatment_location
    column :action do |treatment|
      treatment.actions.map { |a| a.name }.join(", ").html_safe
    end
    column :date
    column :time
    column :comment
    column 'Trainer' do |treatment|
      link_to(treatment.trainer.first_name + ' ' + treatment.trainer.last_name, admin_trainer_path(treatment.trainer))
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
      row :action do |treatment|
        treatment.actions.map { |a| a.name }.join(", ").html_safe
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
  filter :treatment_location, :as => :select, :collection => Location.order("location ASC").all
  filter :actions, :as => :select, :collection => Action.order("name ASC").all
  filter :trainer, label: 'Trainer'


  form do |f|
     f.inputs "Treatment Details" do
       f.input :athlete, :collection => Athlete.all.sort_by(&:last_name)
       f.input :trainer, :collection => Hash[Trainer.all.map{|t| [t.last_name + ', ' + t.first_name,t.id]}]
       f.input :treatment_location, :collection => Location.all.order("location ASC").map { |a| a.location }
       f.has_many :cures, :allow_destroy => true do |a|
        a.input :action, :collection => Action.all.order("name ASC")
        end
       f.input :comment, label: 'Trainer Comments'
       f.input :date, as: :datepicker, :input_html => { :value => Date.today}
       f.input :time, :input_html => { :value => Time.now.strftime("%I:%M %p")}
     end
     f.actions
   end

end
