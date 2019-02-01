class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :datetime
      t.decimal :latitude
      t.decimal :longitude
      t.integer :capacity
      t.string :icon
      t.integer :user_id

      t.timestamps
    end
  end
end
