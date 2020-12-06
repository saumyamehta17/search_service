class SearchesController < ApplicationController

  def index
    response = InformationFinder.call(params)
    unless response[:success]
      flash[:notice] = "Something went wrong, try again after some time."
    else
      @result = response[:data]
    end
  end
end