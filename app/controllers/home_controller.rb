class HomeController < ApplicationController
  def index
    @books = Book.order(created_at: :desc).page(params[:page])

    # Filter by search query if present
    if params[:q].present? && params[:category].present?
      category = params[:category]
      query = "%#{params[:q]}%"
      @books = @books.where("LOWER(#{category}) LIKE LOWER(?)", query)
    end

    # Filter by status if present
    if params[:status].present? && params[:status] != ''
      @books = @books.where('LOWER(status) = ?', params[:status].downcase)
    end

    @books = @books.page(params[:page]).per(10) # Adjust the number per page as desired
  end
end
