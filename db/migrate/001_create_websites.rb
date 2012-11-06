class CreateWebsites < ActiveRecord::Migration
  def up
    create_table :websites do |t|
      t.string :name, :default => '', :null => false
      t.string :url, :default => '', :null => false
      t.boolean :disabled, :default => false, :null => false
      t.text :code, :default => '', :null => false
    end
  end

  def down
    drop_table :websites
  end
end
