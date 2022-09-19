class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :grade
      t.string :uin
      t.string :email
      t.integer :points

      t.timestamps
    end
  end
end
