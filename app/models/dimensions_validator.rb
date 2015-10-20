class DimensionsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.send("#{attribute}?".to_sym) && value.queued_for_write[:original].present?
      dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
      width = options[:width]

      record.errors[attribute] << "Width must be at least #{width}px" unless dimensions.width >= width
    end
  end
end
