class CreateCotizations < ActiveRecord::Migration[7.0]
  def change
    create_table :cotizations do |t|
      t.string :email
      t.string :file
      t.string :price

      t.timestamps
    end
  end
end
