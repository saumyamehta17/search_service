class SearchRepresenter

  attr_reader :title, :year, :poster

  def initialize(args)
    @title = args['Title']
    @year = args['Year']
    @poster = args['Poster']
  end
end