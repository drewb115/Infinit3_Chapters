class PagesController < ApplicationController
  def show
    # Fetch both 'about' and 'contact' page contents
    @about_page = Page.find_by(page_type: 'about')
    @contact_page = Page.find_by(page_type: 'contact')

    # If either page is missing, redirect to the home page with an alert
    if @about_page.nil? || @contact_page.nil?
      flash[:alert] = "One or more pages could not be found."
      redirect_to root_path
    end
  end
end
