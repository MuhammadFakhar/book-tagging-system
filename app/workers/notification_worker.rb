class NotificationWorker
  def self.most_tagged_books_notifier
    books = Book.all
    h = Hash.new
    books.each do |book|
      book_tags_count = book.book_tags.count
      h[book.id] = book_tags_count
    end
    values = h.sort_by {|k,v| v}.reverse
    values.first(3)
    params = {
      most_tagged_name: Book.find_by(id: values.first.first).title,
      most_tagged_count: values.first.second,
      second_most_tagged_name: Book.find_by(id: values.second.first).title,
      second_most_tagged_count: values.second.second,
      third_most_tagged_name: Book.find_by(id: values.third.first).title,
      third_most_tagged_count: values.third.second,
    }

    TaggingMailer.send_most_tagged_books(params).deliver
  end
end
