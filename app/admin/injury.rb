ActiveAdmin.register Injury do
  menu priority: 3, label: "Injuries"
  permit_params :first_name, :last_name, :status, :injury_location, :date, :active, :comment, :athlete_id

  batch_action :Mark_Active do |ids|
    Injury.find(ids).each do |injury|
      injury.active='true'
    end
    redirect_to collection_path, alert: "The injuries have been marked active"
  end

  index do
      selectable_column
      column :athlete
      column :injury_location
      column :status
      column :date
      column :active
      actions
    end

  filter :athlete
  filter :date, label: 'Injury Date'
  filter :status, label: 'Player Status', :as => :select, :collection => ['Full', 'None', 'Partial']
  filter :injury_location, :as => :select, :collection => ['Header', 'Neck', 'Shoulder', 'Back']

  show do
    attributes_table :athlete, :injury_location, :active, :status, :date, :comment
    active_admin_comments
  end

  form do |f|
     f.inputs "Injury Details" do
       f.input :athlete
       f.input :injury_location, :collection => ['Header', 'Neck', 'Shoulder', 'Back'], include_blank: false
       f.input :active, :as => :boolean, label: 'Injury Active'
       f.input :status, label: 'Player Status', :as => :select, :collection => ['Full', 'Partial', 'None'], include_blank: false
       f.input :date, as: :datepicker, :input_html => { :value => Date.today}
       f.input :comment, label: 'Message to Coach'
     end
     f.actions
   end
end
