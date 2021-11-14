class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :uid
      t.text :title
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
