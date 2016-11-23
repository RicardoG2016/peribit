class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.datetime :delete_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
