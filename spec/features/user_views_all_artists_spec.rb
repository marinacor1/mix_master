require 'rails_helper'

RSpec.feature "User can view all artists" do
  scenario "they can see all artists" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    artist_name1 = "The Beatles"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146039.jpg"

    visit '/artists/new'

    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    click_on "Edit Artist"
    # current_artist = Artist.find(1)
    # visit "/artists/#{current_artist}"

    fill_in "artist_name", with: artist_name1
    fill_in "artist_image_path", with: artist_image_path1
    click_on "Update Artist"

    expect(page).to have_content artist_name1
    expect(page).to have_css("img[src=\"#{artist_image_path1}\"]")
  end
end
