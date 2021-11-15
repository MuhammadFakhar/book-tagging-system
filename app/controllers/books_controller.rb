class BooksController < ApplicationController
  before_action :set_tag, only: [:search, :index]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "Book created successfully"
      redirect_to books_path
    else
      flash[:alert] = "Book not created check error and try again"
      render 'new'
    end
  end

  def search
    min_price = params[:min_price].present? ? params[:min_price] : 0
    max_price = params[:max_price].present? ? params[:max_price] : 1000
    tags = params[:tags].present? ? params[:tags] : Tag.all.pluck(:id)

    @books = Book.custom_filtering(min_price, max_price, tags)

    render 'index'
  end

  private
    def book_params
      params.require(:book).permit(:uid, :title, :author_id, :description, :avatar, :price)
    end

    def set_tag
      @tags = Tag.all
    end
end
