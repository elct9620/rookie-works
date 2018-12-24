# frozen_string_literal: true

class AddPublishedYearToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :published_year, :integer
    add_index :projects, :published_year
  end
end
