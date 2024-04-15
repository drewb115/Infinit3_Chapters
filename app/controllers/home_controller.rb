class HomeController < ApplicationController
  def index
    @books = Book.order(created_at: :desc)
    @genres = Book.select(:genre).distinct.pluck(:genre)
    @statuses = Book.select(:status).distinct.pluck(:status)

    # Filter by search query if present
    if params[:q].present? && params[:category].present?
      category = params[:category]
      query = "%#{params[:q]}%"
      @books = @books.where("LOWER(#{category}) LIKE LOWER(?)", query)
    end

    # Filter by genre if present
    if params[:genre].present?
      @books = @books.where('LOWER(genre) = ?', params[:genre].downcase)
    end

    # Filter by status if present
    if params[:status].present?
      @books = @books.where('LOWER(status) = ?', params[:status].downcase)
    end

    @books = @books.page(params[:page]).per(10) # Adjust the number per page as desired
  end
end
