class SearchsController < ApplicationController
  def search
    # @model = params["model"]
    # @method = params["method"]
    # @content = params["content"]
    # @records = search_for(@model, @content, @method)
    @results = @q.result.includes(:user)
  end

  private

#   def search_for(model, content, method)
#     if model == "user"
#       if method == "perfect"
#         User.where(name: content)
#       else
#         User.where("name LIKE ?", "%"+content+"%")
#       end
#     elsif model == "item"
#       if method == "perfect"
#         Item.where(name: content)
#       else
#         Item.where("name LIKE ?", "%"+content+"%")
#       end
#     end
  def set_q
    @q = Post.ransack(params[:q]
  end
end