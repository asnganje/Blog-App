class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :post, foreign_key: { to_table: :posts}
      t.references :author, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
