require 'rails_helper'

RSpec.feature "user can create a song" do
  scenario "they can see a page for the song" do
    artist     = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist2     = Artist.create(name: "Madonna", image_path: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwixvvzOqYDMAhWrmIMKHYW_CqMQjBwIBA&url=http%3A%2F%2Fblog.tiqiq.com%2Fwp-content%2Fuploads%2F2015%2F03%2Fmadonna-story_650_121614035337.jpg&psig=AFQjCNE5aXPoLmjbqoa-aPS9SUahiOwtGg&ust=1460249009565438")
    visit artists_path
    song_title = "No Woman, No Cry"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artist_path(artist)
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
  end
end
