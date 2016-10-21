ActiveAdmin.register Athlete do
  menu priority: 4, label: "Athletes"
   permit_params :first_name, :last_name, :sport

   index do
     selectable_column
     column :first_name
     column :last_name
     column :sport
     actions
   end

   show do
     attributes_table :first_name, :last_name, :sport
     panel "Injuries" do
       table_for athlete.injuries do
         column :date
         column :injury_location
         column :status
         column :comment
         column do |injury|
            link_to('View', admin_injury_path(injury))
         end
       end
     end
     panel "Treatments" do
       table_for athlete.treatments do
         column :date
         column :treatment_location
         column :comment
         column 'Trainer' do |treatment|
           treatment.trainer.first_name + ' ' + treatment.trainer.last_name
         end
         column do |treatment|
            link_to('View', admin_treatment_path(treatment))
         end
       end
     end
     active_admin_comments
   end

   filter :first_name_cont, label: 'First Name'
   filter :last_name_cont, label: 'Last Name'
   filter :sport, label: 'Sport', :as => :select, :collection => ['Football', 'Soccer','Swimming','Tennis','Baseball','Basketball','Softball', 'Wrestling', 'Lacrosse', 'Track', 'Cross Country', 'Volleyball']

   form do |f|
     f.inputs "Treatment Details" do
       f.input :first_name, :required => true
       f.input :last_name, :required => true
       f.input :sport, :as => :tags, :collection => ['Football', 'Soccer','Swimming','Tennis','Baseball','Basketball','Softball', 'Wrestling', 'Lacrosse', 'Track', 'Cross Country', 'Volleyball']
     end
     f.actions
   end

  end
