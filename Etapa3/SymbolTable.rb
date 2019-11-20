# Implementacion de la Tabla de simbolos para  
# el analisis semantico del lenguaje Guardusb

class STable

	def initialize()
		@table = Hash.new()
	end	
	

	def insert(key,value)	
		@table.store(key,value)
	end

	def delete(key)
		@table.delete(key)
	end	

	def update(key,new_value)
		n_table = Hash.new
		n_table.store(key,new_value)
		@table.merge!(n_table)	
	end
	
	def ExistKey(key)
		if @table.has_key?(key)
			return true
		else
			return false
		end
	end

	def get(key)
		return @table.fetch(key,nil)
	end
	
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