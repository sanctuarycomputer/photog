class Image < ActiveRecord::Base
  has_attached_file :file, :styles => { 
    :medium => "300x300>", 
    :thumb => "x300>" 
  }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :file

  belongs_to :album
  acts_as_list scope: :album
  acts_as_taggable
end
