class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_location
      t.time :event_time
      t.date :event_date
      t.string :event_type
      t.integer :event_points
      t.boolean :active

      t.timestamps
    end
  end
end
