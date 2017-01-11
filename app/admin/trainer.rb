ActiveAdmin.register Trainer do
  menu priority: 5, label: "Trainers"
  permit_params :first_name, :last_name, :username, :email, :admin, :password, :password_confirmation

  actions :all
  controller do
    def action_methods
      if current_trainer.admin?
        super - ['view']
      else
        super - ['destroy', 'new', 'create', 'edit']
      end
    end
  end

  controller do
      def create
        super do |format|
          redirect_to collection_url and return if resource.valid?
        end
      end

      def update
        super do |format|
          redirect_to collection_url and return if resource.valid?
        end
      end
    end
    
  index do
    selectable_column
    column :first_name
    column :last_name
    actions
  end

  show do
    attributes_table :first_name, :last_name, :email, :admin, :last_sign_in_at
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
