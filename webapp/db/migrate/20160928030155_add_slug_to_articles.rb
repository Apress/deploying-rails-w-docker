class AddSlugToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :slug, :string
  end
end
