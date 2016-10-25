ActiveAdmin.register Injury do
  menu priority: 3, label: "Injuries"
  config.sort_order = ""
  permit_params :first_name, :last_name, :status, :injury_location, :date, :active, :comment, :athlete_id, :injury_id

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

  index do
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
    attributes_table :id, :athlete, :injury_location, :active, :status, :date, :comment
    active_admin_comments
  end

  form do |f|
     f.inputs "Injury Details" do
       f.input :athlete
       f.input :injury_location, :collection => ['Abdomen','Ankle','Arm','Back','Finger','Groin','Head','Hip','Knee','Shin','Shoulder','Thigh','Toe','Wrist'], include_blank: false
       f.input :active, :as => :boolean, label: 'Injury Active', :input_html => { :checked => 'true'}
       f.input :status, label: 'Player Status', :as => :select, :collection => ['Hold', 'Limit', 'Full'], include_blank: false
       f.input :date, as: :datepicker, :input_html => { :value => Date.today}
       f.input :comment, label: 'Message to Coach'
     end
     f.actions
   end
end
