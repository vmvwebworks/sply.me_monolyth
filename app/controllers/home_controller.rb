class HomeController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  def index
    @users = User.all
    @users = User.starts_with(params[:query]) if params[:query]
    smart_listing_create :users, @users, partial: "shared/users_listing", page_sizes: [4]
  end
end
