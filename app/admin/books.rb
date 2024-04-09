ActiveAdmin.register Book do
  permit_params :title, :author, :description, :price, :stock_quantity, :image, :genre, :status

  # Custom filter for books with attached images
  filter :with_attached_image, as: :boolean, label: 'Has Attached Image'

  form do |f|
    f.inputs 'Book Details' do
      f.input :title
      f.input :author
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :genre, as: :select, collection: %w[Fiction Non-Fiction Mystery Thriller Fantasy Romance], include_blank: 'Select Genre'
      f.input :status, as: :select, collection: ['On Sale', 'Recently Added', 'Limited Edition','Available','Out of Stock'], include_blank: 'Select Status'
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :description
    column :price
    column :stock_quantity
    column :genre
    column :status
    actions
  end

  show do
    attributes_table do
      row :title
      row :author
      row :description
      row :price
      row :stock_quantity
      row :genre
      row :status
      row :image do |book|
        if book.image.attached?
          image_tag book.image, size: '100x100'
        else
          'No image attached'
        end
      end
    end

    panel 'Book Prices' do
      table_for book.book_prices do
        column 'Price' do |price|
          "#{price.price} from #{price.start_date} to #{price.end_date}"
        end
      end
    end
  end
end
