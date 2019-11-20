require_relative 'clasesGusb'
require_relative 'lexer'
require_relative 'SymbolTable'


$Error = false

	

#--Clases de Estructuras--

class ErrDeclaracion 

	def initialize(tk,fila,column)
		@tk = tk
		@fila = fila
		@column = column
		$Error = true
	end	

	def Error_to_s
		return "Error Fila #{@fila} Columna #{@column}: La variable '#{@tk}' ya ha sido declarada."
	end	
end	

class ErrNDeclare

	def initialize(tk,fila,column)
		@tk = tk
		@fila = fila
		@column = column
		$Error = true
	end	

	def Error_to_s
		return "Error Fila #{@fila} Columna #{@column}: Variable #{@tk} no ha sido declarada"
	end	
end

class ErrAsignacion 

	def initialize(tipo_id,tipo_asig,fila,column)
		@tipo_id = tipo_id
		@tipo_asig = tipo_asig
		@fila = fila
		@column = column
		$Error = true
	end	

	def Error_to_s
		return "Error Fila #{@fila} Columna #{@column}: Asignacion de tipo '#{@tipo_asig}' a variable de tipo '#{@tipo_id}' ."
	end	
end	

class ErrOpBinaria

	def initialize(tipo_operando,operador,tipo_operador,pos)
		@tipo_operando = tipo_operando
		@operador = operador
		@tipo_operador = tipo_operador
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}:Operando de tipo #{@tipo_operando}, debe ser de tipo #{@tipo_operador} "
	end	
end		

class Programa

	def check()

		if @cuerpo != nil
			@cuerpo.check(nil)
		end
	end
end

class Cuerpo

	def check(padre,type=nil)

		@table = STable.new()

		if padre != nil
			@table.insert("T_Padre",padre)

		else
			@table.insert("T_Padre",nil)
		end
		
		if @l_declaraciones != nil
			@l_declaraciones.check(@table)
		end
		
		if @l_instrucciones != nil
			@l_instrucciones.check(@table)
		end
	end
end

class ListaDeclaracion

	def check(padre)

		if @l_declaraciones != nil
			@l_declaraciones.check(padre)
		end
		
		@declaracion.check(padre,nil,0)
	end
	
end

class Decla_Card

	def check(padre,tipo,i)
		if @l_identificadores != nil
			@identificador1.check(padre,$array_type[i])
			@l_identificadores.check(padre,nil,i+1)
		else
			@identificador1.check(padre,$array_type[i])
			@identificador2.check(padre,$array_type[i+1])
		end
	end
end				 

class Decla_Tipo

	def check(padre,tipo,i=nil)

		if @l_identificadores != nil
			@identificador.check(padre,$type)
			@l_identificadores.check(padre,nil)
		else
			@identificador.check(padre,$type)
		end	
	end
end

class Identificador

	def	check(padre,tipo)

		if tipo != nil

			if not padre.ExistKey(@id.to_s())

				if tipo.tipo == "int"
					valor = [tipo.value(),0]
				
				elsif tipo.tipo == "bool"
					valor = [tipo.value(),false]
				else tipo.tipo == "array"
					valor = [tipo.value(),0]	
				end
				padre.insert(@id.to_s(),valor)
				return tipo.tipo
			else
				error = ErrDeclaracion.new(@id,@id.fila,@id.columna)
				puts error.Error_to_s
				exit()			
			end
		
		else

			if not padre.ExistKey(@id.to_s())

				upper_table = padre.get("T_Padre")

				while upper_table != nil

					if not upper_table.ExistKey(@id.to_s())

						upper_table = upper_table.get("T_Padre")

					else
						return upper_table.get(@id.to_s())[0] 
					end
				end

				error = ErrNDeclare.new(@id,@id.fila,@id.columna)
				puts error.Error_to_s
				exit()

			else
				return padre.get(@id.to_s())[0] 
			end
		end		
	end
end

class Instrucciones 
	
	def check(padre)

		if @instrucciones != nil
			@instrucciones.check(padre)
		end
		if @instruccion != nil
			@instruccion.check(padre) # Revisamos la instruccion.
		end
	end
end

class Instruccion

	def check(padre)
		@instruccion.check(padre)

	end
end

class Asignacion

	def check(padre)
		tipo_id = @identificador.check(padre,nil)
		tipo_exp = @expresion.check(padre,nil)
		if tipo_id != tipo_exp
			error = ErrAsignacion.new(tipo_id,tipo_exp,@identificador.id.fila,@identificador.id.columna)
			puts error.Error_to_s
			exit()
		end	
	end
end

class Entrada

	def check(padre)

	end
end	

class Salida

	def check(padre)
	
	end		
end

class Imprimir

	def check(padre)
	
	end		
end

class Str

	def check(padre)
	
	end		
end

class Condicional

	def check(padre)

		@lista_instrucciones1.check(padre)
		if @lista_instrucciones2 != nil
			@lista_instrucciones2.check(padre)
		end	

	end		
end

class Guardia

	def check(padre)
		@lista_instrucciones1.check(padre)
		if @lista_instrucciones2 != nil
			@lista_instrucciones2.check(padre)
		end	
	end		
end

#--- OPERACIONES BINARIAS--

class OpSuma

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,"+","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,"+","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "int"	
	end
end			





		


						

																		

