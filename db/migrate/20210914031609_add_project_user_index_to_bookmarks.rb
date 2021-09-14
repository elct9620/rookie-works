# frozen_string_literal: true

class AddProjectUserIndexToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_index :bookmarks, %i[user_id project_id], unique: true
  end
end
