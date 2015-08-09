class Page < ActiveRecord::Base
  # Background Color 
  attr_accessor :background_color
  has_settings :base
  before_save -> {
    settings(:base).background_color = background_color
  }

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  
  validates :name, presence: true, uniqueness: true

  belongs_to :album
end
