class CreateOptions < ActiveRecord::Migration
  def up
    create_table :options do |t|
      t.string :name, :default => '', :null => false
      t.string :value, :default => '', :null => false
      t.integer :parent_id
      t.string :option_type, :default => '', :null => false
      t.boolean :disabled, :default => false, :null => false
    end
  end

  def down
    drop_table :options
  end
end
