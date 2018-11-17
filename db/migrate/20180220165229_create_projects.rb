# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :school, foreign_key: true
      t.references :department, foreign_key: true
      t.string :website
      t.string :thumbnail
      t.integer :exhibition_year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
