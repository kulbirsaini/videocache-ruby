class CreateWebsites < ActiveRecord::Migration
  def up
    create_table :websites do |t|
      t.string :key, :null => false
      t.string :name, :null => false
      t.string :url, :null => false, :default => ''
      t.boolean :disabled, :null => false, :default => false
      t.text :code, :null => false, :default => ''
    end
  end

  def down
    drop_table :websites
  end
end
