class TaggingService
  def initialize(params)
    @book_ids = params[:book_ids]
    @tag_id = params[:book_tag][:tag_id]
  end

  def call
    @book_ids.each do |book_id|
      BookTag.create(book_id: book_id, tag_id: @tag_id)
    end
  end
end
