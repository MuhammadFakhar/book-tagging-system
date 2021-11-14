class TagsController < ApplicationController
  def index
    @tag = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag created successfully"
      redirect_to books_path
    else
      flash[:alert] = "Tag not created check error and try again"
      render 'new'
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
