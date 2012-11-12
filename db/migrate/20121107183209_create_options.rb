class CreateOptions < ActiveRecord::Migration
  def up
    create_table :options do |t|
      t.string :key, :null => false
      t.string :name, :null => false, :default => ''
      t.string :value, :null => false, :default => ''
      t.string :option_type, :null => false, :default => 'string'
      t.string :help, :null => false, :default => ''
      t.string :description
      t.string :default, :null => false, :default => ''
      t.boolean :disabled, :null => false, :default => false
      t.integer :parent_id
    end
  end

  def down
    drop_table :options
  end
end
