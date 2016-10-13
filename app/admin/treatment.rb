ActiveAdmin.register Treatment do
  permit_params :athlete_id, :trainer_id, :treatment_location, :comment, :date, :time


  form do |f|
     f.inputs "Treatment Details" do
       f.input :athlete
       f.input :trainer
       f.input :treatment_location, :collection => ['Header', 'Neck', 'Shoulder', 'Back'], include_blank: false
       f.input :comment, label: 'Comments'
       f.input :date, as: :datepicker, :input_html => { :value => Date.today}
       f.input :time, :input_html => { :value => Time.now.strftime("%I:%M %p")}
     end
     f.actions
   end

end
