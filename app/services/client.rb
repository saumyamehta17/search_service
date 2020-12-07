class Client
  SERVICE1 = "http://www.omdbapi.com/?apikey=#{ENV['API_KEY']}"
  # can add more Service as a fall back of Service1

  def self.call(query)
    HTTParty.get(SERVICE1.concat(query))
  end
end