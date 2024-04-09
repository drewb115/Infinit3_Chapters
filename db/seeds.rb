# db/seeds.rb

require 'httparty'

# Creating about page

page_content = PageContent.find_or_create_by(title: 'About')
page_content.update(content: 'This is the initial About page content.')


# Create an admin user if it doesn't exist
AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end if Rails.env.development?

# Seed books from an external API
response = HTTParty.get("https://openlibrary.org/search.json?title=the+lord+of+the+rings")

if response.success?
  books_data = response.parsed_response["docs"]

  # Limit the number of books to seed
  books_data.first(20).each do |book_data|
    title = book_data['title']
    author = book_data['author_name']&.first # Assuming you want the first author
    # Omit the isbn since it's not part of your schema
    # Add additional fields as necessary

    next unless title && author # Skip if any essential details are missing

    Book.find_or_create_by!(title: title) do |book|
      book.author = author
      # Set other book attributes here if needed, such as description, genre, etc.
      # book.description = book_data['description']
      # book.genre = book_data['genre'] # Ensure your Book model has a 'genre' field
      # ... additional fields
    end
  end
else
  puts "Error fetching books: #{response.code} - #{response.message}"
end

puts 'Seeding of admin user and books complete.'
