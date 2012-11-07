class CreateVideoFiles < ActiveRecord::Migration
  def up
    create_table :video_files do |t|
      t.string :name, :null => false, :default => ''
      t.string :ext, :null => false, :default => ''
      t.string :format, :null => false, :default => ''
      t.datetime :modified_at
      t.datetime :accessed_at
      t.integer :access_count, :null => false, :default => 0
    end
  end

  def down
    drop_table :video_files
  end
end
