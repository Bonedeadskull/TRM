ActiveAdmin.register Action do
permit_params :name, :action_id
menu parent: "Customize", if: proc{ current_trainer.admin? }

form do |f|
  f.inputs "Action Name" do
    f.input :name
  end
  f.actions
end

end
