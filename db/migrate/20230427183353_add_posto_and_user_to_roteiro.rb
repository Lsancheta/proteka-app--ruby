class AddPostoAndUserToRoteiro < ActiveRecord::Migration[7.0]
  def change
    add_reference :roteiros, :posto, null: false, foreign_key: true
  end
end
