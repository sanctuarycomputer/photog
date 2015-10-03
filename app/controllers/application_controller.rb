class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def autocomplete_tags
    @tags = ActsAsTaggableOn::Tag.
      where("name LIKE ?", "#{params[:q]}%").
      order(:name)
    respond_to do |format|
      format.json { render :json => @tags.collect{|t| {:id => t.name, :name => t.name }}}
    end
  end

  def order_images_in_tag
    tag = ActsAsTaggableOn::Tag.find params[:tag_id]
    
    if tag
      tag_order = TagOrder.where(tag: tag).first_or_create do |tag_order|
        tag_order.tag = tag 
      end

      tag_order.image_ids = params[:order]
      tag_order.save
    end 

    respond_to do |format|
      format.json { render json: "success" }
    end
  end
end
