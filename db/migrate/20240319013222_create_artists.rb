class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.boolean :on_vinyl
      t.integer :number_of_singles

      t.timestamps
    end
  end
end
