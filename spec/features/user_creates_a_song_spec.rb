require 'rails_helper'

RSpec.feature "user can create a song" do
  scenario "they can see a page for the song" do
    artist = create(:artist)
    song_title = "No Woman, No Cry"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artist_path(artist)

    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
