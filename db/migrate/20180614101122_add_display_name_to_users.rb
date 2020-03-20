# frozen_string_literal: true

class AddDisplayNameToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :display_name
      t.string :team
    end
  end
end
