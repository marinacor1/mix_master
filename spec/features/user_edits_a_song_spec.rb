require 'rails_helper'

RSpec.feature "user can edit a song" do
  scenario "they can see a form and edit the song" do
    artist = create(:artist)
    song = create(:song)
    song_title = "No Woman, No Cry"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    updated_title = "One Love"

    visit song_path(song)
    save_and_open_page

    click_on "Edit Song"
    fill_in "song_title", with: updated_title
    click_on "Update Song"

    expect(page).to have_content updated_title
    expect(page).to_not have_content song_title
  end
end
