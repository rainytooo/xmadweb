class CreateWebPages < ActiveRecord::Migration
  def change
    create_table :web_pages do |t|
      t.string :domain
      t.integer :categroy

      t.timestamps
    end
  end
end
