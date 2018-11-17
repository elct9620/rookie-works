# frozen_string_literal: true

class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name

      t.timestamps
    end
  end
end
