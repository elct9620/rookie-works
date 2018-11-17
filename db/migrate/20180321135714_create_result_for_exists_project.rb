# frozen_string_literal: true

class CreateResultForExistsProject < ActiveRecord::Migration[5.1]
  def change
    Project.where(result: nil).in_batches.each_record do |project|
      project.result = Game.new
      project.save
    end
  end
end
