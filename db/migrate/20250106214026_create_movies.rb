class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.date :release_date
      t.integer :rating
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
