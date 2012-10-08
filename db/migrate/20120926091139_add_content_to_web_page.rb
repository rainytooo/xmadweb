class AddContentToWebPage < ActiveRecord::Migration
  def change
    add_column :web_pages, :content, :string

  end
end
