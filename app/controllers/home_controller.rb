class HomeController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  def index
    @join_listings = JoinList.all
    @join_listings = @join_listings.filtered(params[:query]) if params[:query]
  end
end
