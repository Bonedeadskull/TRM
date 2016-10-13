ActiveAdmin.register Athlete do
  menu priority: 3, label: "Athletes"
   permit_params :first_name, :last_name, :sport

   index do
     selectable_column
     column :first_name
     column :last_name
     column :sport
     actions
   end

   filter :first_name_cont, label: 'First Name'
   filter :last_name_cont, label: 'Last Name'
   filter :sport, label: 'Sport', :as => :select, :collection => ['Football', 'Soccer', 'Lacross', 'Track', 'Cross Country']

   form do |f|
     f.inputs "Treatment Details" do
       f.input :first_name, :required => true
       f.input :last_name, :required => true
       f.input :sport, :as => :select, :collection => ['Football', 'Soccer', 'Lacross', 'Track', 'Cross Country']
     end
     f.actions
   end

  end
