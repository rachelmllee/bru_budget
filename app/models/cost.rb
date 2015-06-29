class Cost < ActiveRecord::Base
  belongs_to :user
  validates :item, :cost, presence: true
end
