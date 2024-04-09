# app/admin/users.rb
ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :address, :province

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :address
    column :province
    actions
  end

  filter :email
  filter :name
  filter :address
  filter :province

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :address
      f.input :province
    end
    f.actions
  end
end