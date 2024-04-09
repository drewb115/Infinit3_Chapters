# app/admin/page_contents.rb

ActiveAdmin.register PageContent do
  permit_params :title, :content

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :text
    end
    f.actions
  end

  # Customizing sidebar menu
  sidebar "Navigation" do
    ul do
      li link_to("About", about_path)
    end
  end
end
