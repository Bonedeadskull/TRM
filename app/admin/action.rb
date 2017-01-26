ActiveAdmin.register Action do
menu if: proc{ current_user.admin? }
permit_params :action
config.clear_sidebar_sections!


form do |f|
  f.inputs "Action Details" do
    f.input :action, :required => true
  end
  f.actions
end


end


end
