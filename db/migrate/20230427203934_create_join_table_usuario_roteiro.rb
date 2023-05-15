class CreateJoinTableUsuarioRoteiro < ActiveRecord::Migration[7.0]
  def change
    create_join_table :usuarios, :roteiros do |t|
      # t.index [:usuario_id, :roteiro_id]
      # t.index [:roteiro_id, :usuario_id]
    end
  end
end
