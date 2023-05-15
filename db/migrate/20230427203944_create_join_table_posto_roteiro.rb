class CreateJoinTablePostoRoteiro < ActiveRecord::Migration[7.0]
  def change
    create_join_table :postos, :roteiros do |t|
      # t.index [:posto_id, :roteiro_id]
      # t.index [:roteiro_id, :posto_id]
    end
  end
end
