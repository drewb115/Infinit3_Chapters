# app/helpers/tax_helper.rb
module TaxHelper
  def calculate_tax(price, province)
    tax_rate = case province.downcase
               when "alberta"
                 0.05
               when "british columbia"
                 0.07
               when "manitoba", "ontario", "saskatchewan"
                 0.13
               when "quebec"
                 0.14975
               # Add more cases for other provinces as needed
               else
                 0
               end

    (price * tax_rate).round(2)
  end
end
