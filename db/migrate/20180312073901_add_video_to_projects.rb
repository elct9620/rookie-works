# frozen_string_literal: true

class AddVideoToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :video, :string
  end
end
