module ActsAsTaggableOn
  Tag.class_eval do
    acts_as_list
  end
end
