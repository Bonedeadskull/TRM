ActiveAdmin.register Injury do
   menu priority: 3, label: "Injuries"
   config.sort_order = "athletes.last_name asc"
   active_admin_import
   permit_params :first_name, :last_name, :status, :injury_location, :date, :active, :comment, :athlete_id, :injury_id

   controller do
       def index
         respond_to do |format|
           format.html { super }
           format.csv  { super }
           format.xml  { super }
           format.json { super }

           format.pdf do
             @injuries = Injury.where(:active => true).joins(:athlete).order("last_name asc")
             render pdf: 'injury', layout: 'pdf', template: 'admin/injuries/index_pdf.html.erb'
           end
         end
       end
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

   controller do
     before_filter only: :index do
       if params[:commit].blank? && params[:q].blank?
         extra_params = {"q" => {"active_eq" => "true"}}
         params.merge! extra_params
       end
     end
   end
   batch_action :Mark_Inactive do |ids|
     Injury.find(ids).each do |injury|
       injury.active = false
       injury.save
    end
    redirect_to collection_path, alert: "The injuries have been marked Inactive"
  end
  batch_action :Mark_Active do |ids|
    Injury.find(ids).each do |injury|
      injury.active = true
      injury.save
    end
    redirect_to collection_path, alert: "The injuries have been marked Active"
  end

  index download_links: [:csv, :xml, :json] do
      selectable_column
      column :athlete_id, :sortable => 'athletes.last_name' do |injury|
        injury.athlete.last_name + ", " + injury.athlete.first_name
      end
      column :injury_location
      column :status
      column :date
      column :active
      actions
    end

    controller do
      def scoped_collection
        end_of_association_chain.includes(:athlete).order('athletes.last_name asc')
      end
    end

  filter :athlete
  filter :date, label: 'Injury Date'
  filter :status, label: 'Player Status', :as => :select, :collection => ['Hold', 'Limit', 'Full']
  filter :active
  filter :injury_location, :as => :select, :collection => ['Abdomen','Ankle','Arm','Back','Finger','Groin','Head','Hip','Knee','Shin','Shoulder','Thigh','Toe','Wrist']

  show do
    attributes_table :athlete, :injury_location, :active, :status, :date, :comment
    columns do
      column do
        panel "Quick Actions" do
         div class: 'dash_buttons' do
           link_to('New Treatment', new_admin_treatment_path(:treatment => { :athlete_id => injury.athlete_id, :treatment_location => injury.injury_location}),{ class:"btn-athlete"})
         end
        end
       end
     end
    active_admin_comments
  end

  form do |f|
     f.inputs "Injury Details" do
       f.input :athlete, :collection => Athlete.all.sort_by(&:last_name), hint: link_to('Create Athlete', new_admin_athlete_path)
       f.input :injury_location, :collection => ['Abdomen','Ankle','Arm','Back','Finger','Groin','Head','Hip','Knee','Shin','Shoulder','Thigh','Toe','Wrist'], include_blank: true
       f.input :active, :as => :boolean, label: 'Injury Active', :input_html => { :checked => 'true'}
       f.input :status, label: 'Player Status', :as => :select, :collection => ['Hold', 'Limit', 'Full'], include_blank: false
       f.input :date, as: :datepicker, :input_html => { :value => Date.today}
       f.input :comment, label: 'Message to Coach'
     end
     f.actions
   end
end
