ActiveAdmin.register Injury do
  permit_params :first_name, :last_name, :injury_type, :start_date, :end_date

  index do
    selectable_column
    column :first_name
    column :last_name
    column :injury_type
    column :end_date
    actions
  end

  filter :first_name_cont, label: 'First Name'
  filter :last_name_cont, label: 'Last Name'
  filter :start_date, label: 'Injury Start'
  filter :end_date, label: 'Injury End'

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :injury_type, :collection => ['Sprain', 'Concussion', 'AIDS']
      f.input :start_date, as: :datepicker, :input_html => { :value => Date.today}
      f.input :end_date, as: :datepicker
    end
    f.actions
  end

end
