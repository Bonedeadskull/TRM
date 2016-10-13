ActiveAdmin.register Injury, as: "Treatment" do
  belongs_to :athlete
  menu priority: 2, label: "Treatments"
  permit_params :first_name, :last_name, :status, :injury_location, :date, :time, :message, :therapy, :sport, :athlete

  index do
    selectable_column
    column :first_name
    column :last_name
    column :sport
    column :status
    column :injury_location
    column :date
    actions
  end

  filter :first_name_cont, label: 'First Name'
  filter :last_name_cont, label: 'Last Name'
  filter :sport, label: 'Sport', :as => :select, :collection => ['Football', 'Soccer', 'Lacross', 'Track', 'Cross Country']
  filter :status, label: 'Player Status', :as => :select, :collection => ['Full', 'None', 'Partial']
  filter :date, label: 'Treatment Date'
  filter :injury_location, :as => :select, :collection => ['Header', 'Neck', 'Shoulder', 'Back']

  form do |f|
    f.inputs "Treatment Details" do
      f.input :first_name, :required => true
      f.input :last_name, :required => true
      f.input :sport, :as => :select, :collection => ['Football', 'Soccer', 'Lacross', 'Track', 'Cross Country']
      f.input :injury_location, :collection => ['Header', 'Neck', 'Shoulder', 'Back']
      f.input :status, label: 'Player Status', :as => :select, :collection => ['Full', 'None', 'Partial'], :required => true
      f.input :therapy, label: 'Therapy Performed'
      f.input :message, label: 'Message to Coach'
      f.input :date, as: :datepicker, :input_html => { :value => Date.today}
      f.input :time, :input_html => { :value => Time.now.strftime("%I:%M %p")}
    end
    f.actions
  end

end
