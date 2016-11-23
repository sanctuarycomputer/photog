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

  validates :name, presence: true, uniqueness: true
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  acts_as_taggable
  acts_as_list
  has_many :images, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  def visible_images
    self.images.select { |i| i.visible? }
  end

  has_attached_file :file, {
    styles: {
      thumb: {
        geometry: '200x',
        processor_options: {
          compression: {
            png: false,
            jpeg: '-copy none -optimize -progressive'
          }
        }
      },
      medium: {
        geometry: '800x',
        processor_options: {
          compression: {
            png: false,
            jpeg: '-copy none -optimize -progressive'
          }
        }
      },
      full: {
        geometry: '1200x',
        processor_options: {
          compression: {
            png: false,
            jpeg: '-copy none -optimize -progressive'
          }
        }
      },
    },
    processors: [:thumbnail, :compression],
    default_url: "/images/missing.jpg",
    convert_options: {
      thumb: '-quality 80',
      medium: '-quality 60',
      full: '-quality 80'
    }
  }

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  validates :file, dimensions: { width: 1200 }

  has_one :page

  def cover_image
    if file.present? || images.empty?
      file
    else
      images.first.file
    end
  end

end
