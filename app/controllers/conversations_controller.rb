class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to root_path
  end
  def show
    @conversation = Conversation.find(params[:id])
    unless @conversation.users.ids.include? current_user.id
      redirect_to root_path
    end
  end
end
