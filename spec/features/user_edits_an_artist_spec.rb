require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario "they can edit an artist" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit '/artists/'

    click_on "New artist"
    fill_in "artist_name", with: "Bob Marley"
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(current_path).to eq artist_path
    expect(page).not_to_have_content "Bob Marley"

  end
end
