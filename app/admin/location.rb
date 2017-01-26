ActiveAdmin.register Location do
menu parent: "Customize", if: proc{ current_trainer.admin? }
permit_params :location
config.clear_sidebar_sections!

show do
  attributes_table :location
end

index do
  selectable_column
  column :location
  actions
end

form do |f|
  f.inputs "Location Details" do
    f.input :location, :required => true
  end
  f.actions
end

end
