class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.date :fecha
      t.text :contenido
      t.integer :noticium_id
      t.string :nombre

      t.timestamps
    end
  end
end
