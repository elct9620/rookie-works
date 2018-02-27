class RemoveExhibitionYearFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :exhibition_year, :integer
  end
end
