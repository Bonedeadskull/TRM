ActiveAdmin.register Treatment,  { :sort_order => :date_desc }  do
  permit_params :athlete_id, :trainer_id, :treatment_location, :comment, :date, :time
  menu priority: 2, label: "Treatments"

  index do
    selectable_column
    column :athlete
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

  filter :athlete, label: 'Name'
  filter :date, label: 'Treatment Date'
  filter :treatment_location, :as => :select, :collection => ['Abdomen','Ankle','Arm','Back','Finger','Groin','Head','Hip','Knee','Shin','Shoulder','Thigh','Toe','Wrist']
  filter :trainer, label: 'Trainer'


  form do |f|
     f.inputs "Treatment Details" do
       f.input :athlete
       f.input :trainer, :collection => Trainer.pluck(:first_name, :id)
       f.input :treatment_location, :collection => ['Abdomen','Ankle','Arm','Back','Finger','Groin','Head','Hip','Knee','Shin','Shoulder','Thigh','Toe','Wrist'], include_blank: false
       f.input :comment, label: 'Comments'
       f.input :date, as: :datepicker, :input_html => { :value => Date.today}
       f.input :time, :input_html => { :value => Time.now.strftime("%I:%M %p")}
     end
     f.actions
   end

end
