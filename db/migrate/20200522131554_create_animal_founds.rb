class CreateAnimalFounds < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_founds do |t|
      t.string :name
      t.string :phone
      t.references :animal, foreign_key: true

      t.timestamps
    end
  end
end
