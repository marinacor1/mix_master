require 'rails_helper'

RSpec.feature "User can delete an artist" do
  scenario "they are redirected to the artists inde and do not see the artist name" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)
    #breaks here because when you click on the artist you can't find them
    click_on "Delete Artist"

    expect(page).to_not have_content artist.name
    expect(page).to_not have_css("img[src=\"#{artist.image_path}\"]")
    end

end
