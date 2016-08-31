ActiveAdmin.register Trainer do
  permit_params :first_name, :last_name, :username, :email, :admin, :password, :password_confirmation

  actions :all
  controller do
    def action_methods
      if current_trainer.admin?
        super
      else
        super - ['destroy', 'new', 'create', 'edit']
      end
    end
  end

  index do
    selectable_column
    column :first_name
    column :last_name
    actions
  end

  filter :first_name_cont, label: 'First Name'
  filter :last_name_cont, label: 'Last Name'

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :username, label: 'Login Username'
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin, as: :boolean, checked_value: true, unchecked_value: false
    end
    f.actions
  end

end
