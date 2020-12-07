class InformationFinder

  def self.call(input)
    new(input).call
  end

  def initialize(input)
    @title = input[:title]
    @year = input[:year]
  end

  def call
    response = Client.call(query)
    parsed_response = JSON.parse(response.body)
    begin
      ClientResponse.new(parsed_response).process
    rescue
      return { success: false }
    end
    { success: true, data: searches(parsed_response["Search"]) }
  end

  private

  attr_reader :title, :year

  def query
    get_title + get_year
  end

  def get_title
    title ? "&s=#{title}" : ''
  end

  def get_year
     year ? "&y=#{year}" : ''
  end

  def searches(array_of_search)
    array_of_search.map{|s| SearchRepresenter.new(s)}
  end
end

class ClientResponse

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def process
    if data["Response"] == "False"
      raise StandardError.new(data["Error"])
    end
  end
end