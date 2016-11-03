ActiveAdmin.register Athlete do
  menu priority: 4, label: "Athletes"
  permit_params :first_name, :last_name, :sport, :id
  active_admin_import

   index do
     selectable_column
     column :first_name
     column :last_name
     column :sport
     actions
   end

   show do
     attributes_table :first_name, :last_name, :sport
     panel "Quick Actions" do
      div class: 'dash_buttons' do
        link_to('New Treatment', new_admin_treatment_path(:treatment => { :athlete_id => athlete.id}),{ class:"btn-athlete"})
      end
      div class: 'dash_buttons' do
        link_to('New Injury', new_admin_injury_path(:injury => { :athlete_id => athlete.id}),{ class:"btn-athlete"})
      end
     end
     panel "Treatments" do
       table_for athlete.treatments.order("date desc") do |treatment|
         column :date
         column('View') do |treatment|
            link_to('View', admin_treatment_path(treatment))
         end
         column :treatment_location
         column :comment
         column 'Trainer' do |treatment|
           treatment.trainer.first_name + ' ' + treatment.trainer.last_name
         end
       end
     end
     panel "Injuries" do
       table_for athlete.injuries.order("date desc") do |injury|
         column(:date)
         column('View') do |injury|
            link_to('View', admin_injury_path(injury))
         end
         column :injury_location
         column :status
         column :comment
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
