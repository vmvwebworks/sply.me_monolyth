module UserFilter
  extend ActiveSupport::Concern
  included do
    scope :starts_with, -> (query) { where("name like ? OR email like ?", "#{query}%","#{query}%")}
  end
end
