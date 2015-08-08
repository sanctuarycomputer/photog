class Album < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true, uniqueness: true

  acts_as_taggable
  acts_as_list
  has_many :images, -> { order(position: :asc) }

  has_attached_file :file, :styles => { 
    :medium => "300x300>", 
    :thumb => "x300>" 
  }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :file
end
