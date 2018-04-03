class Comentario < ApplicationRecord
	belongs_to :noticium
	validates_presence_of :contenido,
	:nombre
end
