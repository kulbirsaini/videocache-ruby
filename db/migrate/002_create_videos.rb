class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.integer :website_id, :null => false
      t.string :video_id, :null => false
      t.integer :start_time
      t.integer :end_time
      t.integer :start_byte
      t.integer :end_byte
      t.string :alternate_id, :null => false, :default => ''
      t.string :format, :null => false, :default => ''
      t.string :ext, :null => false, :default => ''
    end
  end

  def down
    drop_table :videos
  end
end
