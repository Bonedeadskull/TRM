ActiveAdmin.register Athlete,  { :sort_order => :last_name_asc } do
  menu priority: 4, label: "Athletes"
  permit_params :first_name, :last_name, :dob, :grade, :address, :phone ,:sport, :id
  active_admin_import

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

   index do
     selectable_column
     column :last_name
     column :first_name
     column :grade
     column :sport
     actions
   end

   show do
     attributes_table :first_name, :last_name, :dob, :grade, :address, :phone, :sport
     panel "Quick Actions" do
      div class: 'dash_buttons' do
        if(Injury.where(:athlete_id => athlete.id, :active =>  true).exists?)
          link_to('New Treatment', new_admin_treatment_path(:treatment => { :athlete_id => athlete.id, :treatment_location => Injury.where(:athlete_id => athlete.id, :active =>  true).order("date desc").first.injury_location }),{ class:"btn-athlete"})
        else
          link_to('New Treatment', new_admin_treatment_path(:treatment => { :athlete_id => athlete.id}),{ class:"btn-athlete"})

        end
      end
      div class: 'dash_buttons' do
        link_to('New Injury', new_admin_injury_path(:injury => { :athlete_id => athlete.id}),{ class:"btn-athlete"})
      end
     end
     panel "Treatments" do
       table_for athlete.treatments.order("time desc") do |treatment|
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
   filter :grade_cont, label: 'Grade', :as => :select, :collection => ['9','10','11','12']
   filter :sport, label: 'Sport', :as => :select, :collection => ['Football', 'Soccer','Swimming','Tennis','Baseball','Basketball','Softball', 'Wrestling', 'Lacrosse', 'Track', 'Cross Country', 'Volleyball']

   form do |f|
     f.inputs "Treatment Details" do
       f.input :first_name, :required => true
       f.input :last_name, :required => true
       f.input :dob, :as => :datepicker
       f.input :grade, :as => :select, :collection => ['9','10','11','12']
       f.input :phone
       f.input :address
       f.input :sport, :as => :tags, :collection => ['Football', 'Soccer','Swimming','Tennis','Baseball','Basketball','Softball', 'Wrestling', 'Lacrosse', 'Track', 'Cross Country', 'Volleyball']
     end
     f.actions
   end

  end
