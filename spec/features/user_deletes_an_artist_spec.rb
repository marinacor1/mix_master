require 'rails_helper'

RSpec.feature "User can delete an artist" do
  scenario "they can delete an artist" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit '/artists/new'

    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    click_on "Delete Artist"

    visit '/artists'

    expect(page).to have_content "Deleted artists"
  end

end
