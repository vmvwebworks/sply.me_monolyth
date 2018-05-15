class Subscription < ApplicationRecord
  belongs_to :user
  def is_finished?
    Time.now > period_end
  end
  def self.check_states
    subscriptions = Subscription.all
    subscriptions.each do |subscription|
      if subscription.is_finished?
        subscription.destroy
      end
    end
  end
end
