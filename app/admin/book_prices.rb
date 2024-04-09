ActiveAdmin.register BookPrice do
  permit_params :book_id, :price, :start_date, :end_date
end
