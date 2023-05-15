class CreatePostos < ActiveRecord::Migration[7.0]
  def change
    create_table :postos do |t|
      t.string :cliente
      t.references :usuario, foreign_key: true
      t.timestamps
    end
  end
end
