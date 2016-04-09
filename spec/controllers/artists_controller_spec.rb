require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  describe "GET #index" do #HTTP method and controller action name
    it "assigns all artists as @artists and renders the index template" do
      artist = create(:artist) #create artist
      get(:index)

      expect(assigns(:artists)).to eq ([artist]) #check to make sure that the instance variable equals array in database
#assigns(:artist) is syntax to access instance vriable
      expect(response).to render_template("index")
      #check to see instance variable is rendered
    end
  end

  describe "GET #show" do
    it "assigns the specific artist as @artist and shows the show template" do
      artist = create(:artist)
      get(:show, {:id => artist.to_param}) #passing in specific artist id
      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("show")
    end
  end
end
