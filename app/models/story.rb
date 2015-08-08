class Story < ActiveRecord::Base
  belongs_to :member
  validates :body, presence: true, length: { minimum: 10, maximum: 255 }
end
