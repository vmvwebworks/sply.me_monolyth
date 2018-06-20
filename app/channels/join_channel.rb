class JoinChannel < ApplicationCable::Channel
  def subscribed
    if current_user.join_list.nil?
      current_user.create_join_list
    end
    #stream_from "join_channel"
  end

  def unsubscribed
    current_user.join_list.joins.destroy_all
    current_user.join_list.destroy
    # Any cleanup needed when channel is unsubscribed
  end
  def join(data)
    joinlist = JoinList.find(data['list_id'])
    current_user.create_joining(join_list_id: joinlist.id)
  end
end
