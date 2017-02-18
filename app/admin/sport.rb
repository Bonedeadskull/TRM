ActiveAdmin.register Sport,  { :sort_order => :name_asc } do
menu parent: "Customize", if: proc{ current_trainer.admin? }
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
  f.inputs "Sport" do
    f.input :name
  end
  f.actions
end

end
