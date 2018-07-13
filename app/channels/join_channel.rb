class JoinChannel < ApplicationCable::Channel
  def subscribed
    unless current_user.join_list
      current_user.create_join_list
    end
    stream_for current_user
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
    joinlistArr = []
    joinlists = JoinList.joins(:user)
    joinlists.each do |joinlist|
      joiningusers = []
      joinlist.joinings.each do |joining|
        joiningusers << {'user' => joining.user}
      end
      joinlistArr << {'list' => joinlist, 'user' => joinlist.user, 'joinings' => joiningusers}
    end
    puts "dame los joinings de la joinlist del current_user"
    puts current_user.join_list.joinings
    JoinChannel.broadcast_to(
      current_user,
      joinLists: joinlistArr,
      current_user_id: current_user.id
    )
  end
end
