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
    if params[:min_price].present? && params[:max_price].present? && params[:tags].present?
      search_by_tag_and_price(params)
    elsif params[:min_price].present? && params[:max_price].present?
      search_by_price(params)
    elsif params[:tags].present?
      search_by_tags(params)
    else
      @books = Book.all
    end

    render 'index'
  end

  def search_by_tag_and_price(params)
    tag_filter = []
    @books = []

    price_filter = Book.where("price >= ? AND price<= ?", params[:min_price], params[:max_price])

    params[:tags].each do |tag|
      book_tag_id = Tag.find_by(name: tag).id
      book_tags = BookTag.where(tag_id: book_tag_id)
      book_tags.each do |b_tag|
        @books << b_tag.book
      end
    end
    @books = price_filter | tag_filter
  end

  def search_by_price(params)
    @books = Book.where("price >= ? AND price<= ?", params[:min_price], params[:max_price])
  end

  def search_by_tags(params)
    books = []
    params[:tags].each do |tag|
      book_tag_id = Tag.find_by(name: tag).id
      book_tags = BookTag.where(tag_id: book_tag_id)
      book_tags.each do |b_tag|
        books << b_tag.book
      end
    end
    @books = books.uniq
  end

  private
    def book_params
      params.require(:book).permit(:uid, :title, :author_id, :description, :avatar, :price)
    end

    def set_tag
      @tags = Tag.all
    end
end
