class CreateExhibitionsProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :exhibitions_projects do |t|
      t.references :exhibition, foreign_key: false
      t.references :project, foreign_key: false

      t.timestamps
    end
  end
end
