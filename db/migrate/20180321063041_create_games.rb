# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.column :platform, 'bit(8)', default: '00000000'
      t.integer :genre, default: 0, null: false
      t.string :download_link

      t.timestamps
    end
  end
end
