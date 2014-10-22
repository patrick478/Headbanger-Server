json.array!(@song_listens) do |song_listen|
  json.extract! song_listen, :id
  json.url song_listen_url(song_listen, format: :json)
end
