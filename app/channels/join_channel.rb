class JoinChannel < ApplicationCable::Channel
  def subscribed
    unless current_user.join_list
      current_user.create_join_list
    end
    stream_from "join_channel"
    render_all
  end

  def unsubscribed
    if current_user.join_list.joinings
      current_user.join_list.joinings.destroy_all
    end
    current_user.join_list.destroy
    # Any cleanup needed when channel is unsubscribed
  end

  def join(data)
    joinlist = JoinList.find(data['list_id'])
    unless current_user.joining
      puts "esta creando"
      current_user.create_joining(join_list_id: joinlist.id)
    else
      puts "esta actualizando"
      current_user.joining.update(join_list_id: joinlist.id)
    end
    render_all
  end
  def render_all
    puts "render_all method, building for json response"
    joinlistArr = []
    joinlists = JoinList.joins(:user)
    joinlists.each do |joinlist|
      joiningusers = []
      joinlist.joinings.each do |joining|
        joiningusers << {'user' => joining.user}
      end
      puts "dame debajo lo que hay en joiningusers"
      puts joiningusers
      joinlistArr << {'list' => joinlist, 'user' => joinlist.user, 'joinings' => joiningusers}
    end
    ActionCable.server.broadcast "join_channel", {joinLists: joinlistArr}
  end
end
