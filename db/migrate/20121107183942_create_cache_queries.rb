class CreateCacheQueries < ActiveRecord::Migration
  def up
    create_table :cache_queries do |t|
      t.integer :video_id, :null => false
      t.integer :video_file_id
      t.boolean :hit, :null => false, :default => false
      t.string :client_ip, :null => false, :default => ''
      t.datetime :time
    end
  end

  def down
    drop_table :cache_queries
  end
end
