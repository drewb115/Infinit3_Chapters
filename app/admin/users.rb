ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :address, :province

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :address
    column :province
    column :encrypted_password do |user|
      user.encrypted_password
    end
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
      f.input :province, as: :select, collection: ["Alberta", "British Columbia", "Manitoba", "New Brunswick", "Newfoundland and Labrador", "Nova Scotia", "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan"]
    end
    f.actions
  end
end
