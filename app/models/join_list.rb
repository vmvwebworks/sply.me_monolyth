class JoinList < ApplicationRecord
  belongs_to :user
  has_many :joinings
end
