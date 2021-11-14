class CreateBookTags < ActiveRecord::Migration[5.2]
  def change
    create_table :book_tags do |t|
      t.belongs_to :book
      t.belongs_to :tag

      t.timestamps
    end
  end
end
