ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

     columns do
       column do
         panel "Quick Actions" do
          div do
            button_to('New Treatment', new_admin_treatment_path, :method => :get, :id => 'new-injury-btn')
            end
          end
        end
      end

     columns do
       column do
         panel "" do
          table_for Injury.order('date desc').each do |injury|
              column(:first_name)
              column(:last_name)
              column(:date)
              column()             {|injury| link_to('View', admin_treatment_path(injury)) }
            end
          end
         end
       end


  end # END CONTENT
end
