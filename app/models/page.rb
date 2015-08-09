class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  
  validates :name, presence: true, uniqueness: true

  belongs_to :album
end
