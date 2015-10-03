class Image < ActiveRecord::Base
  scope :visible, -> {
    where(visible: true)
  }

  default_scope {
    order('position asc') 
  }

  has_attached_file :file, :styles => { 
    :thumb => "100x",
    :full => "1200x" 
  }, :default_url => "/images/missing.jpg"

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :file
  
  belongs_to :album
  has_one :child_image
  acts_as_list scope: :album, top_of_list: '0'
  acts_as_taggable

  attr_accessor :child_image_file
  attr_accessor :child_image_tag_list
  attr_accessor :delete_child_image

  def setup_child_image(file, delete='0', tag_list='')
    if delete == '1'
      self.child_image.destroy if self.child_image
    else
      if self.child_image
        child_image.update_attribute(file: file) if file
        child_image.tag_list = tag_list
        child_image.save
      else
        if file
          child_image = ChildImage.create({
            file: file,
            image: self
          })
          child_image.tag_list = tag_list
          child_image.save
        end
      end
    end
  end
end
