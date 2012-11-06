class CreateCacheQueries < ActiveRecord::Migration
  def up
    create_table :cache_queries do |t|
      t.integer :video_id, :null => false
      t.integer :file_id
      t.boolean :hit, :default => false, :null => false
      t.string :client_ip, :default => '', :null => false
      t.datetime :time
    end
  end

  def down
    drop_table :cache_queries
  end
end
