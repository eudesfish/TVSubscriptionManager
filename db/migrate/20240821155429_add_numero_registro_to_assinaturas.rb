class AddNumeroRegistroToAssinaturas < ActiveRecord::Migration[7.1]
  def change
    add_column :assinaturas, :numero_registro, :string
    add_index :assinaturas, :numero_registro, unique: true
  end
end
