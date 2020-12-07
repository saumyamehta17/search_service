class SearchesController < ApplicationController

  def index
    response = InformationFinder.call(params)
    flash.clear
    unless response[:success]
      flash[:notice] = "Search for your favourite Play! Nothing to show now."
    else
      @result = response[:data]
    end
  end
end