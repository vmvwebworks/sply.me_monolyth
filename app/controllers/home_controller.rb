class HomeController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  def index
    smart_listing_create :users, User.all, partial: "shared/users_listing", page_sizes: [1]

  end
end
