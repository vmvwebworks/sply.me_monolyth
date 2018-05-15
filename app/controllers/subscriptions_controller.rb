class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def create
    current_user.create_subscription
  end
end
