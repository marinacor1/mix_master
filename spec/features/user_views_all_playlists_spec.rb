require 'rails_helper'

RSpec.feature "user views all playlists" do
  scenario "user can see all playlist on page" do

    playlist_name = "Mis canciones"
    playlist_two = "Jamming nights"
    Playlist.create(name: playlist_name)
    Playlist.create(name: playlist_two)

    visit 'playlists'

    expect(page).to have_content playlist_name
    expect(page).to have_content playlist_two

    within("li:first") do
      expect(page).to have_link playlist_name
    end

    within("li:last") do
      expect(page).to have_link playlist_two
    end

  end
end
