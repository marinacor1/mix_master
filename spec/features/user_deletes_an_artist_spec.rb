require 'rails_helper'

RSpec.feature "User can delete an artist" do
  scenario "they can delete an artist" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    Artist.create(name: artist_name, image_path: artist_image_path)

    visit '/artists'
save_and_open_page
    click_on("Bob Marley")
    #breaks here because when you click on the artist you can't find them
    click_on "Delete Artist"

    visit '/artists'

    expect(current_path).to eq artist_path
    expect(page).not_to_have_content "Bob Marley"
  end

end
