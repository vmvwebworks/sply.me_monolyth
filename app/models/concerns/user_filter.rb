module UserFilter
  extend ActiveSupport::Concern
  included do
    scope :starts_with, -> (query) { where("name like ? OR email like ?", "#{query}%","#{query}%")}
    scope :online, -> { where(online: true)}
  end
  def outcomming_payments
    Payment.outcomming_payments(id)
  end
  def incomming_payments
    Payment.incomming_payments(id)
  end
  def appear
    update(online: true)
    #ActionCable.server.broadcast "AppearanceChannel", {event: 'appear', user_id: self.id, room: self.current_room}
  end
  def disappear
    update(online: false)
  end
end
