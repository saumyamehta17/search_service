class Client
  SERVICE1 = 'http://www.omdbapi.com/?apikey=4387c9d4'
  # can add more Service as a fall back of Service1

  def self.call(query)
    HTTParty.get(SERVICE1.concat(query))
  end
end