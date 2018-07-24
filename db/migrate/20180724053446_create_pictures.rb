class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :imageable, polymorphic: true

      t.timestamps
    end
    add_index :pictures, :image
  end
end
