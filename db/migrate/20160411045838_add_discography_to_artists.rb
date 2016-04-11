class AddDiscographyToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :discography, :string
  end
end
