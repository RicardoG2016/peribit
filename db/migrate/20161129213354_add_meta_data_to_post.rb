class AddMetaDataToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :post, :string
    add_column :posts, :og_description, :string
    add_column :posts, :link, :string
    add_column :posts, :og_title, :string
  end
end
