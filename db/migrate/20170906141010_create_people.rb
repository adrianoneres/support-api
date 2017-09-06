class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :register
      t.date :birth
      t.text :bio
      t.string :photo

      t.timestamps
    end
  end
end
