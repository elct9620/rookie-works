# frozen_string_literal: true

class CreateSchoolsDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :schools_departments do |t|
      t.references :school, foreign_key: false
      t.references :department, foreign_key: false

      t.timestamps
    end
  end
end
