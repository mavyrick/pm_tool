class AddProjectRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :project, foreign_key: true
  end
end
