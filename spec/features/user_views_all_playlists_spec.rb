require 'rails_helper'

RSpec.feature "user views all playlists" do
  scenario "user can see all playlist on page" do
    song_one, song_two, song_three = create_list(:song, 3)

    playlist_name = "Mis canciones"

    visit 'playlists'
save_and_open_page
    expect(page).to have_content song_one
    expect(page).to have_content song_two
    expect(page).to have_content song_three

    within("li:first") do
      expect(page).to have_link song_one.title, href: song_path(song_one)
    end

    within("li:last") do
      expect(page).to have_link song_three.title, href: song_path(song_three)
    end

  end
end
