class CreateExhibitions < ActiveRecord::Migration[5.1]
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
