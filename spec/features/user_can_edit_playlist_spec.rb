require 'rails_helper'

RSpec.feature "user can edit playlist" do
  scenario "user sees updated playlist page" do
    new_playlist = Playlist.create(name: "Mi musica")
    newer_playlist = Playlist.create(name: "La mia musica")
    song_one, song_two, song_three = create_list(:song, 3)

    visit playlist_path(new_playlist)
    click_on "Edit"
    fill_in "playlist_name", with: newer_playlist
    check("song-#{song_two.id}")
    uncheck("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content newer_playlist
    expect(page).to have_content song_two.title
    expect(page).not_to have_content song_three.title

  end
end
