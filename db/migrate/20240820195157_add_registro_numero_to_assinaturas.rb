class AddRegistroNumeroToAssinaturas < ActiveRecord::Migration[7.1]
  def change
    add_column :assinaturas, :numero_registro, :string
  end
end
