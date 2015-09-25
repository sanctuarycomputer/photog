class Album < ActiveRecord::Base
  scope :published, -> { where(published: true).order('position asc') }

  attr_accessor :delete_cover_image
  before_validation { self.file.clear if self.delete_cover_image == '1' }

  # Background Color 
  attr_accessor :background_color
  has_settings :base
  before_save -> {
    settings(:base).background_color = background_color
  }

  extend FriendlyId
  friendly_id :build_slug, use: [:slugged, :finders]

  def build_slug
    [
      :name,
      "untitled-#{Time.now}"
    ]
  end

  acts_as_taggable
  acts_as_list
  has_many :images, -> { order(position: :asc) }
  accepts_nested_attributes_for :images, allow_destroy: true

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
