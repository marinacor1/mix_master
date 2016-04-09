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
end
