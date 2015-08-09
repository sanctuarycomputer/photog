class Album < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true, uniqueness: true

  acts_as_taggable
  acts_as_list
  has_many :images, -> { order(position: :asc) }

  has_attached_file :file, :styles => { 
    :thumb => "x300>" 
  }, :default_url => "/images/missing.jpg"

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  has_one :page

  def cover_image
    if file.exists? || images.empty?
      file
    else
      images.first.file
    end
  end

end
