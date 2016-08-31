ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do


     columns do
       column do
         panel "Injuries ending soon" do
          table_for Injury.order('end_date asc').each do |injury|
              column(:first_name)
              column(:last_name)
              column(:end_date)    {|injury| link_to(injury.end_date, admin_injury_path(injury)) }
            end
          end
         end
       end


  end # END CONTENT
end
