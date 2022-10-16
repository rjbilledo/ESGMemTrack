class CreateClassifications < ActiveRecord::Migration[6.1]
  def change
    create_table :classifications do |t|
      t.string :classification_name

      t.timestamps
    end
  end
end
