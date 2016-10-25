ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

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
              column(:athlete)
              column(:status)
              column('Injury Location') {|injury| link_to(injury.injury_location, new_admin_treatment_path) }
              column(:date)
              column('Sport') { |injury| injury.athlete.sport }
              column()             {|injury| link_to('View', admin_injury_path(injury)) }
            end
          end
         end
       end


  end # END CONTENT
end
