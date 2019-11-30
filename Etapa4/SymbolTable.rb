# Autores: Marco Benitez 13-10137
#          Orlando Chaparro 12-11499


#--Descripcion--
# Implementacion de la Tabla de simbolos para  
# el analisis semantico del lenguaje Guardusb

class STable

	def initialize()
		@table = Hash.new()
	end	
	
	#Funcion de insercion en la tabla
	def insert(key,value)	
		@table.store(key,value)
	end
	
	#Funcion para verificar si existe el elemento de clave 'key' en la tabla
	def ExistKey(key)
		if @table.has_key?(key) 
			return true
		else
			return false
		end
	end

	def update(key,value)
		n_table = Hash.new()
		n_table.store(key,value)
		@table.merge!(n_table)
	end	

	#Funcion que retorna el elemento de clave 'key'
	def get(key)
		return @table.fetch(key,nil)
	end
	
	#Funcion de impresion de la tabla de simbolos
	def printTable(tab)
		s = (" "*tab) + "Symbols Table\n"
		if not @table.empty?
			@table.each {|key,value| if key != "T_Padre"
									 	s << (" "*(tab+2)) + "variable: "+key+" | type: "+value[0] + "\n"
									 end	
						}
		end
		return s

	end
end											