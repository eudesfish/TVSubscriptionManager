class CreateAssinaturas < ActiveRecord::Migration[7.1]
  def change
    create_table :assinaturas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :servidor, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_vencimento
      t.string :status
      t.text :observacoes

      t.timestamps
    end
  end
end
