ActiveAdmin.register Taction, as: "Action" do
menu parent: "Customize", label: "Actions", if: proc{ current_trainer.admin? }
config.sort_order = 'name_asc'
permit_params :name
config.clear_sidebar_sections!

show do
  attributes_table :name
end

index do
  selectable_column
  column :name
  actions
end

form do |f|
  f.inputs "Action Details" do
    f.input :name
  end
  f.actions
end


end
