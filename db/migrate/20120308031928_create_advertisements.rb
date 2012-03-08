class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :domain, :length => 128
      t.string :pagename, :length => 128
      t.string :seqnum, :length => 128
      t.string :tagname, :length => 128
      t.string :display_type, :length => 128
      t.string :beizhu, :length => 256

      t.timestamps
    end
  end
end
