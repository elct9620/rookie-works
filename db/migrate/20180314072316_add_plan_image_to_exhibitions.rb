class AddPlanImageToExhibitions < ActiveRecord::Migration[5.1]
  def change
    add_column :exhibitions, :plan_image, :string
  end
end
