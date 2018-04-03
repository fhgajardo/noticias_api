class CreateNoticia < ActiveRecord::Migration[5.1]
  def change
    create_table :noticia do |t|
      t.date :fecha
      t.text :cuerpo
      t.text :bajada
      t.string :titular

      t.timestamps
    end
  end
end
