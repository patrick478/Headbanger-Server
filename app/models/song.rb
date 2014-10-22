class Song < ActiveRecord::Base

    has_many :song_listens
end
