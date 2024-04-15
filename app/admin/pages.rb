# app/admin/pages.rb
ActiveAdmin.register Page do
  permit_params :title, :content, :page_type

  index do
    selectable_column
    id_column
    column :title
    column :page_type
    actions
  end

  filter :title
  filter :page_type

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :text
      f.input :page_type, as: :select, collection: ['contact', 'about'], include_blank: false
    end
    f.actions
  end
end
