class RenameOnVinylInArtists < ActiveRecord::Migration[7.1]
  def change
    rename_column :artists, :on_vinyl, :still_recording
  end
end
