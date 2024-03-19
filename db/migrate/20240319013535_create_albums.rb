class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.boolean :on_vinyl
      t.integer :number_of_tracks
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
