class CreateVideoFiles < ActiveRecord::Migration
  def up
    create_table :video_files do |t|
      t.string :name, :default => '', :null => false
      t.string :ext, :default => '', :null => false
      t.string :format, :default => '', :null => false
      t.datetime :modified_at
      t.datetime :accessed_at
      t.integer :access_count, :default => 0, :null => false
    end
  end

  def down
    drop_table :video_files
  end
end
