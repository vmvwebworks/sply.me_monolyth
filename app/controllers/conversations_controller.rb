class ConversationsController < ApplicationController
  before_action :authenticate_user!
  require "opentok"

  def index
    redirect_to root_path
  end
  def show
    @conversation = Conversation.find(params[:id])
    unless @conversation.users.ids.include? current_user.id
      redirect_to root_path
    end
  end
  def create
    opentok = OpenTok::OpenTok.new ENV['TOKBOX_API_KEY'], ENV['TOKBOX_API_SECRET']
    session = opentok.create_session
    session_id = session.session_id
    current_user.conversations.create(session_id: session_id)
    redirect_to root_path
  end
end
