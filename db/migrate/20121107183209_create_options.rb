class CreateOptions < ActiveRecord::Migration
  def up
    create_table :options do |t|
      t.string :name, :null => false
      t.string :value, :null => false, :default => ''
      t.string :option_type, :null => false
      t.boolean :disabled, :null => false, :default => false
      t.integer :parent_id
    end
  end

  def down
    drop_table :options
  end
end
