ActiveAdmin.register Action,  { :sort_order => :action_asc } do
menu parent: "Customize", if: proc{ current_trainer.admin? }
permit_params :action
config.clear_sidebar_sections!

show do
  attributes_table :action
end

index do
  selectable_column
  column :action
  actions
end

form do |f|
  f.inputs "Action Details" do
    f.input :action, :required => true
  end
  f.actions
end

end
