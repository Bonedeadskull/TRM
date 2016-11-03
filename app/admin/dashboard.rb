ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title: proc{ I18n.t("active_admin.dashboard") } do

    controller do
      def scoped_collection
        end_of_association_chain.includes(:athlete).order('athletes.last_name asc')
      end
    end

     columns do
       column do
         panel "Quick Actions" do
          div class: 'dash_buttons' do
            button_to('New Treatment', new_admin_treatment_path, :method => :get, :id => 'new-injury-btn')
          end
          div class: 'dash_buttons' do
            button_to('New Injury', new_admin_injury_path, :method => :get, :id => 'new-injury-btn')
          end
         end
        end
      end

     columns do
       column do
         panel "Injured Athletes" do
          table_for Injury.where(:active =>  true).order("date desc").each do |injury|
            column :athlete_id, :sortable => 'athletes.last_name' do |injury|
              link_to(injury.athlete.last_name + ", " + injury.athlete.first_name, admin_athlete_path(injury.athlete))
            end
            column(:status)
            column('Injury Location') do |injury|
              injury.injury_location
            end
            column()                  {|injury| link_to('Treat', new_admin_treatment_path(:treatment => { :athlete_id => injury.athlete, :treatment_location => injury.injury_location})) }
            column(:date)
            column('Sport')           {|injury| injury.athlete.sport }
            column()                  {|injury| link_to('View', admin_injury_path(injury)) }
          end
        end
       end
      end


  end
end
