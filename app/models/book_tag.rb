class BookTag < ApplicationRecord
  belongs_to :book
  belongs_to :tag

  validates_uniqueness_of :book_id, :scope => :tag_id
end
