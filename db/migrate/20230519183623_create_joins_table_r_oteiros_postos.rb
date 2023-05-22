class CreateJoinsTableROteirosPostos < ActiveRecord::Migration[7.0]
  def change
    create_table :joins_table_r_oteiros_postos do |t|
      t.string :roteiros
      t.string :postos

      t.timestamps
    end
  end
end
