class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|

        t.string :title, :artist, :album, :artwork_url

      t.timestamps
    end
  end
end
