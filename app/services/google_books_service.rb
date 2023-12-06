class GoogleBooksService
  def book_info(isbn)
    get_url("/books/v1/volumes?q=isbn:#{isbn}")
  end

  private
  def conn 
    Faraday.new(url: 'https://www.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_BOOKS_API_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end