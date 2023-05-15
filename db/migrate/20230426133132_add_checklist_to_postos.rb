class AddChecklistToPostos < ActiveRecord::Migration[7.0]
  def change
    add_reference :postos, :checklist, foreign_key: true
  end
end
