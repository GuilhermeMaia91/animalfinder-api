class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :photo
      t.string :age
      t.string :extra_information
      t.string :city
      t.string :state
      t.string :status
      t.references :owner, index: true, foreign_key: true

      t.timestamps
    end
  end
end
