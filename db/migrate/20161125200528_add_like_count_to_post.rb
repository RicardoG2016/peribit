class AddLikeCountToPost < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :likees_count, :integer, :default => 0
  end
end
