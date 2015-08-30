class Image < ActiveRecord::Base
  scope :visible, -> {
    where(visible: true)
  }

  has_attached_file :file, :styles => { 
    :thumb => "x300>" 
  }, :default_url => "/images/missing.jpg"

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :file

  belongs_to :album
  acts_as_list scope: :album
  acts_as_taggable
end
