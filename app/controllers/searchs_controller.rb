class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model, @content, @method)
    # @search = Item.ransack(params[:q])
    # @items = @search.result
  end

  private

  def search_for(model, content, method)
    if model == "user"
      if method == "perfect"
        User.where(name: content)
      else
        User.where("name LIKE ?", "%"+content+"%")
      end
    elsif model == "item"
      if method == "perfect"
        Item.where(name: content)
      else
        Item.where("name LIKE ?", "%"+content+"%")
      end
    end

end