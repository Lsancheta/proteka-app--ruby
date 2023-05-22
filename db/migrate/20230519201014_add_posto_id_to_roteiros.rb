class AddPostoIdToRoteiros < ActiveRecord::Migration[7.0]
  def change
    add_reference :roteiros, :posto, foreign_key: true
  end
end
