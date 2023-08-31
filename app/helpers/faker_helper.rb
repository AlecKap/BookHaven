module FakerHelper
  include HTTParty

  def self.random_image_url(width, height)
    response = get("https://picsum.photos/#{width}/#{height}")
    response.request.last_uri.to_s
  end
end