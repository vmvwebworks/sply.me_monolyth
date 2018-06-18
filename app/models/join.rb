class Join < ApplicationRecord
  belongs_to :join_list
  belongs_to :user
end
