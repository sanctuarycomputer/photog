module ActsAsTaggableOn
  Tag.class_eval do
    acts_as_list

    def ordered_images
      unordered_images = Image.tagged_with(self)
      tag_order        = TagOrder.where(tag: self).first
      ordered_images   = []

      if tag_order && tag_order.image_ids.present?
        ordered_ids = tag_order.image_ids.map(&:to_i).compact

        ordered_ids << 99
        
        ordered_ids.each do |id|
          begin
            image = unordered_images.find id 
            ordered_images << image 
          rescue ActiveRecord::RecordNotFound
          end
        end
        
        # Add non-ordered Images to the end
        not_included_in_order_images = unordered_images - ordered_images
        ordered_images = ordered_images + not_included_in_order_images
        
        # Update the Tag Order Image IDS
        tag_order.image_ids = ordered_images.map(&:id)
        tag_order.save 

        ordered_images
      else
        unordered_images
      end

    end

  end
end
