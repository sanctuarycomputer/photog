class TagOrder < ActiveRecord::Base
  belongs_to :tag, class_name: 'ActsAsTaggableOn::Tag'
  serialize :image_ids, Array
end
