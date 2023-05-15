class CreateRoteiros < ActiveRecord::Migration[7.0]
  def change
    create_table :roteiros do |t|
      t.string :nome

      t.timestamps
    end
  end
end
