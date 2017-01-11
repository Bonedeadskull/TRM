ActiveAdmin.register Treatment,  { :sort_order => :date_desc }  do
  permit_params :athlete_id, :trainer_id, :treatment_location, :comment, :date, :time
  active_admin_import
  menu priority: 2, label: "Treatments"

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
      injury.athlete.last_name + ", " + injury.athlete.first_name
    end
    column :date
    column :treatment_location
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
      row :comment
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
  filter :treatment_location, :as => :select, :collection => ['Abdomen','Ankle','Arm','Back','Finger','Groin','Head','Hip','Knee','Shin','Shoulder','Thigh','Toe','Wrist','Other']
  filter :trainer, label: 'Trainer'


  form do |f|
     f.inputs "Treatment Details" do
       f.input :athlete, :as => :tags, :collection => Athlete.all.sort_by(&:last_name),
       f.input :trainer, :collection => Hash[Trainer.all.map{|t| [t.last_name + ', ' + t.first_name,t.id]}]
       f.input :treatment_location, :collection => ['Abdomen','Ankle','Arm','Back','Finger','Groin','Head','Hip','Knee','Shin','Shoulder','Thigh','Toe','Wrist','Other'], include_blank: true
       f.input :comment, label: 'Comments'
       f.input :date, as: :datepicker, :input_html => { :value => Date.today}
       f.input :time, :input_html => { :value => Time.now.strftime("%I:%M %p")}
     end
     f.actions
   end

end
