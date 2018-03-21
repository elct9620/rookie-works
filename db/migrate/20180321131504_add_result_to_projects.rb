class AddResultToProjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :result, polymorphic: true, index: true
  end
end
