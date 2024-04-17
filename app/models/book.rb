# app/models/book.rb
class Book < ApplicationRecord
  has_one_attached :image
  has_many :book_prices
  has_many :order_items  # Update association name to order_items

  # Define ransackable attributes to whitelist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["id", "author", "created_at", "description", "genre", "price", "stock_quantity", "title", "updated_at"]
  end

  # Define ransackable associations to whitelist searchable associations
  def self.ransackable_associations(auth_object = nil)
    %w[book_prices]
  end

  # Define a scope to filter books with attached images
  def self.with_attached_image
    joins(:image_attachment).where.not(active_storage_attachments: { id: nil })
  end

  # Whitelist the custom scope for Ransack
  def self.ransackable_scopes(auth_object = nil)
    %w[with_attached_image]
  end

  # Index action to filter books by status
  def self.index(params)
    books = Book.all

    # Filter by status if selected
    if params[:status].present?
      books = books.where(status: params[:status])
    end

    books
  end
end