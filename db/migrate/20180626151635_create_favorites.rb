class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :count_fav
      t.integer :user_id
      t.integer :song_id
      t.references :user, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
