ActiveAdmin.register Location do
menu if: proc{ current_trainer.admin? }
permit_params :location
config.clear_sidebar_sections!


form do |f|
  f.inputs "Location Details" do
    f.input :location, :required => true
  end
  f.actions
end

end
