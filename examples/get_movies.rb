require 'net/http'
require 'json'
#Net::HTTP.get_response(URI('https://jsonmock.hackerrank.com/api/movies/search/?Title=spiderman'));

def build_movies_url(titles, page = 1)
  uri = URI("https://jsonmock.hackerrank.com/api/movies/search/")
  uri.query = URI.encode_www_form(Title: titles, page: page)
  uri
end

def fetch_movies_page(titles, page = 1)
  uri = build_movies_url(titles, page)
  response = Net::HTTP.get_response(uri)
  raise "Http request #{uri.to_s} returned #{response.code} => #{response.message}" unless response.is_a?(Net::HTTPSuccess)
  JSON.parse(response.body)
end

titles_from_page = {}
page = 1
loop do
  response = fetch_movies_page('spiderman', page)
  total_pages = response['total_pages']
  page_titles = response.fetch('data').map { |movie| movie.fetch('Title') }
  titles_from_page[page] = page_titles
  break if page >= total_pages
  page += 1
end
titles_from_page.values.flatten.sort_by { |title| title.downcase }


# uri = build_movies_url(['spiderman'])
# response = Net::HTTP.get_response(uri)
# raise "Http request #{uri.to_s} returned #{response.code} => #{response.message}" unless response.is_a?(Net::HTTPSuccess)
# json_response = JSON.parse(response.body)