module UserFilter
  extend ActiveSupport::Concern
  included do
    scope :starts_with, -> (query) { where("name like ? OR email like ?", "#{query}%","#{query}%")}
  end
  def outcomming_payments
    Payment.outcomming_payments(id)
  end
  def incomming_payments
    Payment.incomming_payments(id)
  end
end
