require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "new songs")}
        playlist.reload
        expect(playlist.name).to eq("new songs")
      end
    end
  end
end
