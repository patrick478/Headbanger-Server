class CreateSongListens < ActiveRecord::Migration
  def change
    create_table :song_listens do |t|

        t.integer :user_id, :song_id, :nods
        t.text :location


      t.timestamps
    end
  end
end
