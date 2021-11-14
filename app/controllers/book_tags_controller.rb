class BookTagsController < ApplicationController
  before_action :set_tags, :set_books, only: [:new]

  def new
    @book_tag = BookTag.new
  end

  def create
    tagging_service = TaggingService.new(params)

    if tagging_service.call
      flash[:success] = 'Taggs have been created successfully'
    else
      flash[:alert] = tagging_service.errors.first.first
    end
    redirect_to books_path
  end

  private
    def set_tags
      @tags = Tag.all
    end

    def set_books
      @books = Book.all
    end
end
