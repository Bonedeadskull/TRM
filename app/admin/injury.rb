ActiveAdmin.register Injury do
  menu priority: 3, label: "Injuries"
  permit_params :first_name, :last_name, :status, :injury_location, :date, :comment, :sport, :athlete_id

  index do
      selectable_column
      column :athlete
      column :injury_location
      column :status
      column :date
      actions
    end

  filter :athlete
  filter :date, label: 'Treatment Date'
  filter :status, label: 'Player Status', :as => :select, :collection => ['Full', 'None', 'Partial']
  filter :injury_location, :as => :select, :collection => ['Header', 'Neck', 'Shoulder', 'Back']

  form do |f|
     f.inputs "Injury Details" do
       f.input :athlete
       f.input :injury_location, :collection => ['Header', 'Neck', 'Shoulder', 'Back'], include_blank: false
       f.input :status, label: 'Player Status', :as => :select, :collection => ['Full', 'Partial', 'None'], include_blank: false
       f.input :comment, label: 'Message to Coach'
       f.input :date, as: :datepicker, :input_html => { :value => Date.today}
     end
     f.actions
   end
end
