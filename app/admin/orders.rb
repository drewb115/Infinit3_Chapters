ActiveAdmin.register Order do

  permit_params :user_id, :status, :total_price

  form do |f|
    f.inputs "Order Details" do
      f.input :user_id
      f.input :status, as: :select, collection: ['pending', 'paid', 'shipped']
      f.input :total_price
    end
    f.actions
  end

end
