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
  has_one :child_image
  acts_as_list scope: :album
  acts_as_taggable

  attr_accessor :child_image_file
  attr_accessor :delete_child_image
  before_validation { setup_child_image(self.child_image_file, self.delete_child_image) }

  def setup_child_image(file, delete='0')
    if delete == '1'
      self.child_image.destroy if self.child_image
    elsif file
      if self.child_image
        child_image.update_attribute(file: file) 
      else
        ChildImage.create({
          file: file,
          image: self
        })
      end
    end
  end
end
