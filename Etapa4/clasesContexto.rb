# Autores: Marco Benitez 13-10137
#          Orlando Chaparro 12-11499
#
#--Descripcion--
# Archivo que contiene todas las estructuras y 
# funciones para reconocer los errores de contexto del lenguaje Guardusb



require_relative 'clasesGusb'
require_relative 'lexer'
require_relative 'SymbolTable'


#---Clases Errores de Contexto --

#--Clase ErrDeclaracion--
# Representa un error en el que una variable ya ha sido declarada.
class ErrDeclaracion 

	#--Atributos--
	# tk: contiene una variable
	# fila: contiene un numero de fila
	# column: contiene un numero de columna
	def initialize(tk,fila,column)
		@tk = tk
		@fila = fila
		@column = column
	end	
	#Funcion de impresion	
	def Error_to_s
		return "Error Fila #{@fila} Columna #{@column}: La variable '#{@tk}' ya ha sido declarada."
	end	
end	

#--Clase ErrNdeclare--
#Representa un error en el que una variable no ha sido declarada.
class ErrNDeclare

	#--Atributos--
	# tk: contiene una variable
	# fila: contiene un numero de fila
	# column: contiene un numero de columna
	def initialize(tk,fila,column)
		@tk = tk
		@fila = fila
		@column = column
	end	
	#Funcion de impresion
	def Error_to_s
		return "Error Fila #{@fila} Columna #{@column}: Variable '#{@tk}' no ha sido declarada"
	end	
end

class ErrAsignacion

	#--Atributos--
	# tipo_id: contiene el tipo de la variable a modificar
	# tipo_asig: contiene el tipo de la asignacion
	# fila: contiene un numero de fila
	# column: contine un numero de columna
	def initialize(tipo_id,tipo_asig,fila,column)
		@tipo_id = tipo_id
		@tipo_asig = tipo_asig
		@fila = fila
		@column = column
	end	
	#Funcion de impresion	
	def Error_to_s
		return "Error Fila #{@fila} Columna #{@column}: Asignacion de tipo '#{@tipo_asig}' a variable de tipo '#{@tipo_id}' ."
	end	
end	

#--Clase ErrOpBinaria--
#Representa un error en el que se intenta realizar una operacion binaria con tipos de operandos incorrectos
class ErrOpBinaria

	#--Atributos--
	# tipo_operando: contiene el tipo de un operando
	# operador: contiene un operador
	# tipo_operador: contiene el tipo de un operador
	# pos: contiene una posicion
	def initialize(tipo_operando,operador,tipo_operador,pos)
		@tipo_operando = tipo_operando
		@operador = operador
		@tipo_operador = tipo_operador
		@pos = pos
	end
	#Funcion de impresion
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}:Operando de tipo '#{@tipo_operando}', debe ser de tipo '#{@tipo_operador}' para la operacion '#{@operador.to_s()}' "
	end	
end

#--Clase ErrTipoOpBinaria--
#Representa un error en el que los operandos para una operacion binaria son distintos
class ErrTipoOpBinaria

	#--Atributos--
	# operando1: contiene el primer operador
	# tipo_operando1 : contiene el tipo del primer operador
	# operando2 : contiene el tipo del segundo operando
	# tipo_operando2 : contiene el tipo del segundo operando
	# operador : contiene el tipo del operador
	# pos: contiene una posicion
	def initialize(operando1,tipo_operando1,operando2,tipo_operando2,operador,pos)
		@operando1 = operando1
		@tipo_operando1 = tipo_operando1
		@operando2 = operando2
		@tipo_operando2 = tipo_operando2
		@operador = operador
		@pos = pos
	end
	#Funcion de impresion
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Operacion invalida '#{@operador.to_s()}', los operandos  deben ser del mismo tipo"
	end
end

#--Clase ErrOpUnaria--
#Representa un error en el cual se realiza una operacion unaria a una expresion de tipo incorrecto
class ErrOpUnaria

	#--Atributos--
	# tipo_operando: contiene el tipo de un operando
	# operador: contiene un operador
	# tipo_operador: contiene el tipo de un operador
	# pos: contiene una posicion
	def initialize(tipo_operando,operador,tipo_operador,pos)
		@tipo_operando = tipo_operando
		@operador = operador
		@tipo_operador = tipo_operador
		@pos = pos
	end
	#Funcion de impresion
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}:Operando de tipo '#{@tipo_operando}', debe ser de tipo '#{@tipo_operador}' para la operacion '#{@operador.to_s()}' "	
	end
end

#--Clase ErrCondicional--
#Representa un error en el cual un condicional no es de tipo booleano
class ErrCondicional

	#--Atributos--
	# tipo_cond: contiene el tipo de un condicional	
	# pos: contiene una posicion
	def initialize(tipo_cond,pos)
		@tipo_cond = tipo_cond
		@pos = pos
	end
	#Funcion de impresion
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}: Condicional de tipo '#{@tipo_cond}', debe ser de tipo 'bool'"
	end
end

#--Clase ErrExpFor
#Representa un error en el cual una expresion que especifica el rango del iterador en el ciclo for no es de tipo entero
class ErrExpFor

	#--Atributos--
	#exp_tipo: contiene el tipo de una expresion
	#pos: contiene una posicion 
	def initialize(exp_tipo,pos)
		@exp_tipo = exp_tipo
		@pos = pos
	end
	#Funcion de impresion
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Expresion de tipo '#{@exp_tipo}', debe ser de tipo 'int' "		
	end
end	

#Class ErrModifyIter
#Representa un error en el cual se intenta modificar una variable de iteracion
class ErrModifyIter

	#--Atributos--
	# id: contiene una variable de iteracion
	# pos: contiene una posicion
	# inst: contiene una instruccion
	def initialize(id,pos,inst)
		@id = id
		@pos = pos
		@inst = inst
	end
	#Funcion de impresion
	def Error_to_s()	
		"Error Fila #{@pos[0]} Columna #{@pos[1]}: Instruccion '#{@inst}' invalida, se intento modificar la variable de iteracion '#{@id}'"
	end
end

#Class ErrTipoConversion
#Representa un error en el cual para una funcion de conversion no se recibe como argumento un arreglo
class ErrTipoConversion

	#--Atributos--
	# fun: contiene una funcion de conversion
	# tipo: contiene el tipo del argumento
	# pos: contiene una posicion
	def initialize(fun,tipo,pos)
		@fun = fun
		@pos = pos
		@tipo = tipo
	end
	#Funcion de impresion
	def Error_to_s()
		"Error Fila #{@pos[0]} Columna #{@pos[1]}: Argunmento invalido para la funcion '#{@fun}', se esperaba un 'array' y se recibio un '#{@tipo}'"
	end	
end

#Class ErrTipoArrayConsult
#Representa un error en el cual se intenta realizar una consulta de arreglo a una variable que no es un arreglo
class ErrTipoArrayConsult

	#--Atributos--
	# id: contiene una variable
	# pos: contiene una posicion
	# tipo: contiene el tipo de una variable
	def initialize(id,tipo,pos)
		@id = id
		@pos = pos
		@tipo = tipo
	end	
	#Funcion de impresion
	def Error_to_s()
		"Error Fila #{@pos[0]} Columna #{@pos[1]}: La variable '#{@id}' es de tipo '#{@tipo}' , debe ser de tipo 'array'."
	end
end

#--Class ErrExpConsult--
#Representa un error en el cual se intenta representar el indice de un arreglo con una expresion que no es de tipo entero
class ErrExpConsult

	#--Atributos--
	# exp_tipo: contiene el tipo de una expresion
	# pos: contiene una posicion
	def initialize(exp_tipo,pos)
		@exp_tipo = exp_tipo
		@pos = pos
	end
	#Funcion de impresion
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Expresion de tipo '#{@exp_tipo}', indice de un arreglo debe ser de tipo 'int' "		
	end
end

#--Class ErrArrayAsig--
#Representa un error en el cual se intenta inicializar un arreglo con valores que no son enteros
class ErrArrayAsig

	#--Atributos--
	# exp_tipo: contiene el tipo de una expresion
	# pos: contiene una posicion
	def initialize(exp_tipo,pos)
		@exp_tipo = exp_tipo
		@pos = pos
	end
	
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Expresion de tipo '#{@exp_tipo}',  un arreglo solo admite valores de tipo 'int' "		
	end
end

#--Class ErrTipoArrayIni--
#Representa un error en el cual se intenta realizar una inicializacion de un arreglo a una variable que no es un arreglo
class ErrTipoArrayIni
	
	#--Atributos--
	# exp_tipo: contiene el tipo de una expresion
	# pos: contiene una posicion
	def initialize(exp_tipo,pos)
		@exp_tipo = exp_tipo
		@pos = pos
	end
	#Funcion de impresion
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Se intento realizar una inicializacion de arreglo a una varibale de tipo '#{@exp_tipo}'. "		
	end
end	

#--Class ErrCardinalidadArray--
#Representa un error en el la cardinalidad de la inicializacion de un arreglo es distinta a la longitud del arreglo
class ErrCardinalidadArray
	
	#--Atributos--
	# pos: contiene una posicion
	def initialize(pos)
		@pos = pos
	end
	
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}: El numero de asignaciones debe ser igual a la longitud del arreglo"
	end
end
#--Class ErrInvalidArray--
#Representa un error en el cual para el rango de un arreglo [M..N] se tiene que M > N
class ErrInvalidArray
	#--Atributos--
	# pos: contiene una posicion
	def initialize(pos)
		@pos = pos
	end
	#Funcion de impresion
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}: Declaracion invalidad de rango de indice del arreglo"
	end
end

class ErrVarini

	def initialize(id,pos)
		@id = id
		@pos = pos
	end
	
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}: Variable '#{@id}' aun no ha sido inicializada"
	end	
end	

class ErrDivzero

	def initialize(pos)
		@pos = pos
	end
	
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}:  Division por 0"
	end	
end	 		

class ErrOutRange

	def initialize(pos)
		@pos = pos
	end
	
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}:  Indice fuera del rango "
	end	
end	

class ErrArrayIni
	def initialize(pos)
		@pos = pos
	end
	
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}:  El arreglo no ha sido inicializado "
	end	
end	

class ErrAtoi
	def initialize(pos)
		@pos = pos
	end
	
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}:  El argumento debe ser un arreglo de longitud '1' "
	end	
end	

#---CLASES DE ESTRUCTURAS--

#--Class Programa
class Programa

	#Funcion para identificar errores de contexto de un programa	
	def check()

		if @cuerpo != nil
			#Revisamos errores en el cuerpo
			@cuerpo.check(nil)
		end
	end

	def evaluar()
		if @cuerpo != nil
			@cuerpo.evaluar(nil)
		end	
	end	
end

#Class Cuerpo
class Cuerpo
	
	#Funcion para identificar errores de contexto de un cuerpo
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Creamos la tabla de simbolos
		@table = STable.new()
		#Si no estamos en el cuerpo principal del programa referenciamos a la tabla padre inmediata
		if padre != nil
			@table.insert("T_Padre",padre)
		#Estamos en el cuerpo principal del programa por lo tanto no existe una referencia a padre		
		else
			@table.insert("T_Padre",nil)
		end
		
		if @l_declaraciones != nil
			#Revisamos los errores en las declaraciones
			@l_declaraciones.check(@table)
		end
		
		if @l_instrucciones != nil
			#Revisamos los errores en las instrucciones
			@l_instrucciones.check(@table)
		end
	end

	def evaluar(table)
		
	if @l_instrucciones != nil
		@l_instrucciones.evaluar(@table)
	end
		
	end	

end

#--Class ListaDeclaracion--
class ListaDeclaracion
	#Funcion para identificar errores de contexto de las declaraciones
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	def check(padre)

		if @l_declaraciones != nil
			#Seguimos revisando las declaraciones
			@l_declaraciones.check(padre)
		end

		# Identificamos el tipo/modo de una declaracion
		if @declaracion.get_modo == "card"
			arreglo = []
			#Calculamos un arreglo que contiene los tipos de las declaraciones
			array = @declaracion.get_array_type(arreglo).reverse
			#Revisamos errores en una declaracion
			@declaracion.check(padre,nil,0,array)
		else
			#Revisamos errores en una declaracion
			@declaracion.check(padre,nil,0)
		end			
	end	
end

#--Class Decla_Card--
class Decla_Card

	#Funcion para identificar errores de contexto de una declaracion de tipo cardinalidad(Aquella con varios identificadores y varios tipos)
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	#i: variable de iteracion utilizada para recorrer el arreglo de tipos
	#array: contiene un arreglo de tipos
	def check(padre,tipo,i,array)
	
		if @l_identificadores != nil
			#Revisamos errores en un identificador
			@identificador1.check(padre,array[i])
			#Seguimos revisando los identificadores
			@l_identificadores.check(padre,nil,i+1,array)
		else
			#Revisamos errores en los dos identificadores restantes
			@identificador1.check(padre,array[i])
			@identificador2.check(padre,array[i+1])
		end

	end
end


#--Class Decla_Tipo--
class Decla_Tipo
	#Funcion para identificar errores de contexto de una declaracion de modo tipo(Aquella con varios identificadores con un solo tipo)
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo,i=nil)
		#Buscamos el tipo de la declaracion
		tip = get_tipo()
		if @l_identificadores != nil
			#Revisamos errores en un identificador
			@identificador.check(padre,tip)
			#Seguimos revisando los identificadores
			@l_identificadores.check(padre,nil)
		else
			#Revisamos errores en un identificador
			@identificador.check(padre,tip)
		end	
	end
end

#--Class Identificador--
class Identificador

	#Funcion para identificar errores de contexto de un cuerpo
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: contiene el tipo del identificador a verificar
	def	check(padre,tipo)
		#Venimos de una declaracion
		if tipo != nil

			#La variable no esta en la tabla de simbolo entonces la insertamos
			if not padre.ExistKey(@id.to_s()) 
				if tipo.tipo == "int"
					valor = [tipo.value(),nil]
				
				elsif tipo.tipo == "bool"
					valor = [tipo.value(),nil]
				else tipo.tipo == "array"
					#Verificamos que el rango del arreglo sea valido
					if tipo.valido == false
						error = ErrInvalidArray.new(tipo.tipo.position())
						puts error.Error_to_s()
						exit()
					end	
					valor = [tipo.value(),tipo.size(),[],tipo.get_index1(),tipo.get_index2()]
				end
				#Insertamos la variable en la tabla de simbolo
				padre.insert(@id.to_s(),valor)
				#Retornamos el tipo de la variable
				return tipo.tipo

			#La variable ya ha sido declarada anteriormente	entonces reportamos un error
			else
				error = ErrDeclaracion.new(@id,@id.fila,@id.columna)
				puts error.Error_to_s
				exit()			
			end
		#Venimos de una instruccion
		else
			#La variable no esta declarada en la la tabla de simbolos actual buscamos en todas las tablas superiores hasta encontrarla o 
			#hasta llegar a la tabla raiz
			if not padre.ExistKey(@id.to_s())
				upper_table = padre.get("T_Padre")

				while upper_table != nil
					if not upper_table.ExistKey(@id.to_s())

						upper_table = upper_table.get("T_Padre")

					else
						#La variable esta declarada entonces retornamos su tipo
						return upper_table.get(@id.to_s())[0] 
					end
				end

				#No encontramos la variable en ninguna tabla por lo tanto no esta declarada; reportamos un error 	
				error = ErrNDeclare.new(@id,@id.fila,@id.columna)
				puts error.Error_to_s
				exit()

			#La variable esta declara en la tabla de simbolos actual entonces retornamos su tipo
			else
				return padre.get(@id.to_s())[0] 
			end
		end		
	end
	def evaluar(table,tipo)
		#Queremos el valor de la variable
		if tipo == "int" || tipo == "bool" || tipo == nil
			if not table.ExistKey(@id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							#La variable esta declarada entonces retornamos su valor
							val = upper_table.get(@id.to_s())[1] 
							if val != nil
								return val
							else
								error = ErrVarini.new(@id.to_s,@id.position())
								puts error.Error_to_s
								exit()
							end	 
						end
					end
			else
				val = table.get(@id.to_s())[1]
				if val != nil
					return val
				else
					error = ErrVarini.new(@id.to_s,@id.position())
					puts error.Error_to_s
					exit()
				end	
			end
		else

			if not table.ExistKey(@id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							#La variable esta declarada entonces retornamos su tipo
							return upper_table.get(@id.to_s())[2] 
						end
					end
			else
				val = table.get(@id.to_s())[2]
				if val.length > 0
					return val
				else
					error = ErrArrayIni.new(@id.position())
					puts error.Error_to_s
					exit()
				end	
			end
		end	
				
	end			
end

#--Class Instrucciones--
class Instrucciones 
	#Funcion para identificar errores de contexto de las instrucciones
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	def check(padre)

		if @instrucciones != nil
			#Recorremos la lista de instrucciones
			@instrucciones.check(padre)
		end
		if @instruccion != nil
			#Revisamos errores en la instruccion
			@instruccion.check(padre) 
		end
	end

	def evaluar(table)

		if @instrucciones != nil
			#Recorremos la lista de instrucciones
			@instrucciones.evaluar(table)
		end
		if @instruccion != nil
			#Revisamos errores en la instruccion
			@instruccion.evaluar(table) 
		end
	end
end

#--Class Instruccion--
class Instruccion
	#Funcion para identificar errores de contexto de una Instruccion
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	def check(padre)
		#Revisamos errores en una instruccion
		@instruccion.check(padre)

	end

	def evaluar(table)
		@instruccion.evaluar(table)		
	end
end

#--Class Asignacion--
class Asignacion

	#Funcion para identificar errores de contexto de una Asignacion
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	def check(padre)
		
		x = 0
		#Obtenemos el tipo de la variable a hacerle la asignacion despues de la verificacion de errores
		tipo_id = @identificador.check(padre,nil)

		#Verificamos que la variable no sea un iterador de un for
		if tipo_id == "Not_Modify"
			error = ErrModifyIter.new(@identificador.id.to_s(),@identificador.pos(),":=")
			puts error.Error_to_s
			exit()
		end

		#Obtenemos la longitud de la asignacion
		exp_length = @expresion.length(x)

		#Obtenemos el tipo de la expresion a asignar despues de la verificacion de errores
		tipo_exp = @expresion.check(padre,nil,exp_length,tipo_id)

		#Revisamos si la asignacion es un arreglo y la variable es un arreglo
		if tipo_exp != "int" && tipo_exp != "bool" && exp_length == 1 &&  tipo_id != "int" && tipo_id != "bool"
			#Revisamos que ambos arreglos tengan la misma dimension
			if not padre.ExistKey(@identificador.id.to_s())
				upper_table = padre.get("T_Padre")

				while upper_table != nil
					if not upper_table.ExistKey(@identificador.id.to_s())

						upper_table = upper_table.get("T_Padre")

					else
						id_size = upper_table.get(@identificador.id.to_s())[1]
						break
					end
				end
			else
				id_size = padre.get(@identificador.id.to_s())[1]
			end
			if @expresion.exp.get_nodo == "Id"
				if not padre.ExistKey(@expresion.exp.id.to_s())
					upper_table = padre.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@expresion.exp.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							exp_size = upper_table.get(@expresion.exp.id.to_s())[1] 
						end
					end
				else
					exp_size = padre.get(@expresion.exp.id.to_s())[1]
				end
			else
				if not padre.ExistKey(@expresion.exp.identificador.id.to_s())
					upper_table = padre.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@expresion.exp.identificador.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							exp_size = upper_table.get(@expresion.exp.identificador.id.to_s())[1] 
							break
						end
					end
				else
					exp_size = padre.get(@expresion.exp.identificador.id.to_s())[1]
				end
			end	

			if id_size != exp_size
				error = ErrArrayAsigSize.new(@identificador.pos())
				puts error.Error_to_s()
				exit()
			end	
			
			return nil	
		end		

		#Revisamos si la se esta intentanto realizar una inicializacion a una variable de tipo entero o booleana
		if (tipo_id == "int" || tipo_id == "bool") && exp_length > 1
			error = ErrTipoArrayIni.new(tipo_id,@identificador.pos())
			puts error.Error_to_s()
			exit()

		elsif exp_length == 1
			#Revisamos que los tipos de la variable y la asignacion coincidan 	 			 	
			if (tipo_id == "int" || tipo_id == "bool") && tipo_id != tipo_exp
				error = ErrAsignacion.new(tipo_id,tipo_exp,@identificador.id.fila,@identificador.id.columna)
				puts error.Error_to_s
				exit()
			end	

		end

		if tipo_id != "int" && tipo_id != "bool"
			#Revisamos que la longitud del arreglo coincida con la longitud de la asignacion
			#if padre.get(@identificador.id.to_s())[1] != exp_length
			#	error = ErrCardinalidadArray.new(@identificador.pos())
			#	puts error.Error_to_s()
			#	exit()
			#end

			#Ubicamos el arreglo para verificar si su longitud es igual a la longitud de la asignacion
			if not padre.ExistKey(@identificador.id.to_s())
				upper_table = padre.get("T_Padre")

				while upper_table != nil
					if not upper_table.ExistKey(@identificador.id.to_s())

						upper_table = upper_table.get("T_Padre")

					else
						if upper_table.get(@identificador.id.to_s())[1] != exp_length
							error = ErrCardinalidadArray.new(@identificador.pos())
							puts error.Error_to_s()
						 	exit()
						end	
						break()
					end
				end
			else
				if padre.get(@identificador.id.to_s())[1] != exp_length
					error = ErrCardinalidadArray.new(@identificador.pos())
					puts error.Error_to_s()
					exit()
				end
			end	
					
		end		


	end

	def evaluar(table)
		array = []
		
		array = @expresion.evaluar(table,@identificador,array)
		if array.length > 0
			tipo_id = @identificador.check(table,nil)
			#Ubicamos el arreglo y obtenemos los indices
			if not table.ExistKey(@identificador.id.to_s())
				upper_table = table.get("T_Padre")

				while upper_table != nil
					if not upper_table.ExistKey(@identificador.id.to_s())

						upper_table = upper_table.get("T_Padre")

					else
						index1 = upper_table.get(@identificador.id.to_s())[3]
						index2 = upper_table.get(@identificador.id.to_s())[4]
						upper_table.update(@identificador.id.to_s(),[tipo_id,array.length,array,index1,index2])							
						break()
					end
				end
			else
				index1 = table.get(@identificador.id.to_s())[3]
				index2 = table.get(@identificador.id.to_s())[4]
				table.update(@identificador.id.to_s(),[tipo_id,array.length,array,index1,index2])
			end	
		end	
	end	
end

#--Class ArrayIni--
class ArrayIni

	#Funcion para identificar errores de contexto de una lista de aignaciones
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	#exp_length: contiene la longitud de la lista de asignacion
	#tipo_id: contiene el tipo de la variable a modificar
	def check(padre,tipo=nil,exp_length,tipo_id)
		#La lista de asignacion tiene un solo elemento
		if exp_length == 1
			#Revisamos errores en una expresion de la asignacion
			exp_tipo = @exp.check(padre,nil)
			#Revisamos si se esta intentando asignarle un booleano a un arreglo
			if exp_tipo == "bool" && tipo_id != "bool" && tipo_id != "int"
				error = ErrArrayAsig.new(exp_tipo,@exp.pos())
				puts error.Error_to_s
				exit()
			end	
			return exp_tipo
		#La lista de asignacion tiene mas de un elemneto	
		else	
			if @lista_exp != nil
				#Obtenemos el tipo de una expresion de la asignacion, despues de ser revisada
				exp_tipo = @exp.check(padre,nil)
				#Revisamos que el tipo de la expresion sea un entero 
				if exp_tipo != "int"
					error = ErrArrayAsig.new(exp_tipo,@exp.pos())
					puts error.Error_to_s
					exit()
				end	
				#Recorremos y verificamos la lista de asignaciones
				@lista_exp.check(padre,nil,0)
			else
				#Obtenemos el tipo de una expresion de la asignacion, despues de ser revisada
				exp_tipo = @exp.check(padre,nil)
				#Revisamos que el tipo de la expresion sea un entero
				if exp_tipo != "int"
					error = ErrArrayAsig.new(exp_tipo,@exp.pos())
					puts error.Error_to_s
					exit()
				end
			end
		end			

	end

	def evaluar(table,identificador,array)
		id_tipo = identificador.check(table,nil)
		if id_tipo == "int" || id_tipo == "bool"
			val_exp = @exp.evaluar(table,nil)
			table.update(identificador.id.to_s(),[id_tipo,val_exp])
			array = []
			return array
		else
			if lista_exp != nil
				array << @exp.evaluar(table,nil)
				lista_exp.evaluar(table,identificador,array)
			else
				exp_tipo = @exp.check(table,nil)
				if exp_tipo != "int"
					array = @exp.evaluar(table,exp_tipo)
					return array
				else	
					array << @exp.evaluar(table,nil)
					return array

				end	
			end			
		end
	end			
end		

#--Class Entrada--
class Entrada
	#Funcion para identificar errores de contexto de una Entrada
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	def check(padre)
		#Revisamos errores en la variable
		@identificador.check(padre,nil)
	end

	def evaluar(table)
		var_tipo = @identificador.check(table,nil)
		num = /^\d+$/
		bool = /^false{1}$|^true{1}$/
		array = /^(([\d+][','])|[\d+])+$/
		input_tipo = nil
		error_read = true
		while input_tipo == nil && error_read
			error_previo = false
			input = $stdin.gets.strip
			if input =~ num
				input_tipo = "int"
			elsif input =~ bool
				input_tipo = "bool"
			elsif input =~ array
				input_tipo = "array"
			else
				puts "Input no valido,vuelva a intentar"
				error_previo = true
			end
		
		

			if input_tipo == "array" && var_tipo != "int" && var_tipo != "bool"
				input_tipo = var_tipo
			end

			if input_tipo == "int" && var_tipo != "int" && var_tipo != "bool"
				input_tipo = var_tipo
			end	

			if var_tipo != input_tipo && error_previo == false
				#error = ErrTipoInput.new(@identificador.id.to_s(),@identificador.pos())
				#puts error.Error_to_s
				#exit()
				puts "Error la entrada debe ser de tipo '#{var_tipo}', vuelva a intentar"
				input_tipo = nil
			
			elsif (var_tipo == "int" || var_tipo == "bool") && error_previo == false && input_tipo != nil
				table.update(@identificador.id.to_s(),[var_tipo,input])
				error_read = false

			elsif error_previo == false && input_tipo != nil
				array_input = input.split(",")
				# Ubtenemos el arreglo y su dimension
				if not table.ExistKey(@identificador.id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@identificador.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							array_size = upper_table.get(@identificador.id.to_s)[1]
							index1 = upper_table.get(@identificador.id.to_s)[3]
							index2 = upper_table.get(@identificador.id.to_s)[4]
							if array_input.length != array_size 
								puts "Se deben introducir #{array_size} enteros,vuelva a intentar"
								input_tipo = nil
							else
								upper_table.update(@identificador.id.to_s,[var_tipo,array_size,array_input,index1,index2])
								error_read = false
							end	
								
						end
					end
				else
					
					array_size = table.get(@identificador.id.to_s)[1]
					index1 = table.get(@identificador.id.to_s)[3]
					index2 = table.get(@identificador.id.to_s)[4]
					if array_input.length != array_size 
						puts "Se deben introducir #{array_size} enteros,vuelva a intentar"
						input_tipo = nil
					else
						table.update(@identificador.id.to_s,[var_tipo,array_size,array_input,index1,index2])
						error_read = false
					end
				end						
			end	
		end	
	end



end	

#--Class Salida--
class Salida

	#Funcion para identificar errores de contexto de una Salida
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Revisamos errores en la lista de impresion
		@l_imprimir.check(padre,nil)
	end

	def evaluar(table)
		s = ""
		@l_imprimir.evaluar(table,s)
		if @salto != nil
			s << "\n"
		end
		print("#{s}")	

	end			
end

#--Class Imprimir--
class Imprimir

	#Funcion para identificar errores de contexto de una Impresion
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo = nil)

		if @lista_impresion != nil
			#Recorremos y revisamos la lista de impresion
			@lista_impresion.check(padre,nil)
		end
		#Revisamos errores en una expresion a imprimir
		@impresion.check(padre,nil)	
		
	end

	def evaluar(tabla,s)
		if @lista_impresion != nil
			@lista_impresion.evaluar(tabla,s)
		end
			val = impresion.evaluar(tabla,nil)
			val = val.to_s()
			s << val
	
	end			

end

#--Class Str--
class Str

	#Funcion para identificar errores de contexto de un String
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre=nil,tipo=nil)
		return @string
	end	
	def evaluar(table=nil,tipo=nil)
		return @string
	end		
end

#--Class Condicional--
class Condicional

	#Funcion para identificar errores de contexto de un Condicional
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		
		#Obtenemos el tipo del condicional despues de la verificacion de errores
		cond_tipo = @condicion.check(padre,nil)

		#Revisamos que el condicional sea de tipo booleano
		if cond_tipo != "bool"

			error = ErrCondicional.new(cond_tipo,@condicion.pos())
			puts error.Error_to_s
			exit()
		end

		#Revisamos las instrucciones del condicional
		@lista_instrucciones1.check(padre)
		if @lista_instrucciones2 != nil
			#Revisamos las guardias del condicional
			@lista_instrucciones2.check(padre)
		end	

	end

	def evaluar(table)

		val_cond = @condicion.evaluar(table,nil)
		if val_cond == "true"
			@lista_instrucciones1.evaluar(table)
		else
			if @lista_instrucciones2 != nil
				@lista_instrucciones2.evaluar(table)
			end
		end	
	end		

end

#--Class Guardia--
class Guardia

	#Funcion para identificar errores de contexto de una Guardia
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Obtenemos el tipo del condicional despues de la verificacion de errores
		cond_tipo = @condicion.check(padre,nil)

		#Revisamos que el condicional sea de tipo booleano
		if cond_tipo != "bool"

			error = ErrCondicional.new(cond_tipo,@condicion.pos())
			puts error.Error_to_s
			exit()
		end

		#Revisamos las instrucciones del condicional
		@lista_instrucciones1.check(padre)
		if @lista_instrucciones2 != nil
			#Revisamos las guardias del condicional
			@lista_instrucciones2.check(padre)
		end	
	end

	def evaluar(table)
		val_cond = @condicion.evaluar(table,nil)
		if val_cond == "true"	
			@lista_instrucciones1.evaluar(table)
		else
			if @lista_instrucciones2 != nil
				@lista_instrucciones2.evaluar(table)
			else
				$cond = false
			end	
		end	
	end				
end

#--Class IteradorFor
class IteradorFor

	#Funcion para identificar errores de contexto de una Iteracion for
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Creamos una tabla de simbolos donde solo guardaremos el iterador del for y le asignamos un apuntador a la tabla actual
		@iterator_table = STable.new()
		@iterator_table.insert("T_Padre",padre)
		@iterator_table.insert(@id.id.to_s(),["Not_Modify",nil])
		#Creamos una tabla para el cuerpo del for y le asignamos un apuntador a la tabla donde guardamos el iterador
		@for_table = STable.new()
		@for_table.insert("T_Padre",@iterator_table)
	
		#Obtenemos los tipos de las expresiones que indican el rango de la variable de iteracion despues de la verificacion de errores
		exp1_tipo = @exp1.check(padre,nil)
		exp2_tipo = @exp2.check(padre,nil)

		#Revisamos que las expresiones sean de tipo entero
		if exp1_tipo != "int"
			error = ErrExpFor.new(exp1_tipo,@exp1.pos())
			puts error.Error_to_s
			exit()

		elsif exp2_tipo != "int"
			error = ErrExpFor.new(exp2_tipo,@exp2.pos())
			puts error.Error_to_s
			exit()
		end

		if @cuerpo.l_declaraciones != nil
			#Revisamos errores en las declaraciones
			@cuerpo.l_declaraciones.check(@for_table)
		end
		
		if @cuerpo.l_instrucciones != nil
			#Revisamos errores en las instrucciones
			@cuerpo.l_instrucciones.check(@for_table)
		end
	end

	def evaluar(table)
		iter_ini = @exp1.evaluar(table,nil)
		iter_end = @exp2.evaluar(table,nil)
		for i in iter_ini.to_i..iter_end.to_i
			@iterator_table.update(@id.id.to_s(),["Not_Modify",i])
			@cuerpo.l_instrucciones.evaluar(@for_table)
		end	
	end	
end

#--Class IteratorDo--
class IteratorDo

	#Funcion para identificar errores de contexto de una Iteracion Do
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Obtenemos el tipo de la condicion despues de la verificacion de errores
		cond_tipo = @condicion.check(padre,nil)
		
		#Revisamos que la condicion sea de tipo booleana
		if cond_tipo != "bool"

			error = ErrCondicional.new(cond_tipo,@condicion.pos())
			puts error.Error_to_s
			exit()
		end

		#Revisamos errores en las instrucciones
		@lista_instrucciones1.check(padre)
		if @lista_instrucciones2 != nil
			#Revisamos errores en las guardias
			@lista_instrucciones2.check(padre)
		end	

	end

	def evaluar(table)
		$cond = true
		while $cond
			if @condicion.evaluar(table,nil) == "true"
				@lista_instrucciones1.evaluar(table)
			else
				if @lista_instrucciones2 != nil
					@lista_instrucciones2.evaluar(table)
				else
					$cond = false
				end		
			end	
		end
	end	
					
end

#--Class Min--
class Min

	#Funcion para identificar errores de contexto de una funcion Min
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Obtenemos el tipo del identificador despues de la revision de errores
		tipo = @identificador.check(padre,nil)

		#Revisamos que la variable que recibe la funcion como argumento sea un arreglo
		if tipo == "int" || tipo == "bool"
			error = ErrTipoConversion.new("min()",tipo,@identificador.pos())
			puts error.Error_to_s
			exit()
		end

		return "int"
	end

	def evaluar(table,tipo=nil)
		modo = @identificador.get_nodo()
		if modo == "Id"
			if not table.ExistKey(@identificador.id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@identificador.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							indiceMin = upper_table.get(@identificador.id.to_s())[3]							
							break()
						end
					end
			else
				indiceMin = table.get(@identificador.id.to_s())[3]	
			end
		else
			if not table.ExistKey(@identificador.identificador.id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@identificador.identificador.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							indiceMin = upper_table.get(@identificador.identificador.id.to_s())[3]							
							break()
						end
					end
			else
				indiceMin = table.get(@identificador.identificador.id.to_s())[3]	
			end	
		end		

		return "#{indiceMin}"
	end	
end

#--Class Max--
class Max

	#Funcion para identificar errores de contexto de una Funcion Max
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Obtenemos el tipo del identificador despues de la revision de errores
		tipo = @identificador.check(padre,nil)

		#Revisamos que la variable que recibe la funcion como argumento sea un arreglo
		if tipo == "int" || tipo == "bool"
			error = ErrTipoConversion.new("max()",tipo,@identificador.pos())
			puts error.Error_to_s
			exit()
		end

		return "int"
	end

	def evaluar(table,tipo=nil)
		modo = @identificador.get_nodo()
		if modo == "Id"
			if not table.ExistKey(@identificador.id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@identificador.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							indiceMax = upper_table.get(@identificador.id.to_s())[4]							
							break()
						end
					end
			else
				indiceMax = table.get(@identificador.id.to_s())[4]	
			end
		else
			if not table.ExistKey(@identificador.identificador.id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@identificador.identificador.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							indiceMax = upper_table.get(@identificador.identificador.id.to_s())[4]							
							break()
						end
					end
			else
				indiceMax = table.get(@identificador.identificador.id.to_s())[4]	
			end	
		end	

		return "#{indiceMax}"
	end	
end

#--Class Atoi--
class Atoi

	#Funcion para identificar errores de contexto de una Funcion Atoi
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Obtenemos el tipo del identificador despues de la revision de errores
		tipo = @identificador.check(padre,nil)

		#Revisamos que la variable que recibe la funcion como argumento sea un arreglo
		if tipo == "int" || tipo == "bool"
			error = ErrTipoConversion.new("atoi()",tipo,@identificador.pos())
			puts error.Error_to_s
			exit()
		end

		return "int"
	end
	def evaluar(table,tipo=nil)
		modo = @identificador.get_nodo()
		if modo == "Id"
			if not table.ExistKey(@identificador.id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@identificador.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							array = upper_table.get(@identificador.id.to_s())[2]
							if array.length > 1
								error = ErrAtoi.new(@identificador.pos())
								puts error.Error_to_s
								exit()
							elsif array.length == 0
								error = ErrArrayIni.new(@identificador.pos())
								puts error.Error_to_s
								exit()
							end	
																						
							break()
						end
					end
			else
				array = table.get(@identificador.id.to_s())[2]
				if array.length > 1
					error = ErrAtoi.new(@identificador.pos())
					puts error.Error_to_s
					exit()
				elsif array.length == 0
					error = ErrArrayIni.new(@identificador.pos())
					puts error.Error_to_s
					exit()	
				end		
			end
		else

			array = @identificador.evaluar(table,nil)
			if array.length != 1
				error = ErrAtoi.new(@identificador.identificador.pos())
				puts error.Error_to_s
				exit()
			end							
		end	
				


		return "#{array[0]}"
	end	

end	

class Size

	#Funcion para identificar errores de contexto de una Funcion Atoi
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Obtenemos el tipo del identificador despues de la revision de errores
		tipo = @identificador.check(padre,nil)

		#Revisamos que la variable que recibe la funcion como argumento sea un arreglo
		if tipo == "int" || tipo == "bool"
			error = ErrTipoConversion.new("size()",tipo,@identificador.pos())
			puts error.Error_to_s
			exit()
		end

		return "int"
	end

	def evaluar(table,tipo=nil)
		modo = @identificador.get_nodo()
		if modo == "Id"
			if not table.ExistKey(@identificador.id.to_s())
					upper_table = table.get("T_Padre")

					while upper_table != nil
						if not upper_table.ExistKey(@identificador.id.to_s())

							upper_table = upper_table.get("T_Padre")

						else
							size = upper_table.get(@identificador.id.to_s())[2].length							
							break()
						end
					end
			else
				size = table.get(@identificador.id.to_s())[2].length	
			end
		else
			array = @identificador.evaluar(table,nil)
			size = array.length	
		end	


		return "#{size}"
	end	
end										


#--- OPERACIONES BINARIAS--

#--Class OpSuma--
class OpSuma

	#Funcion para identificar errores de contexto de una Suma
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo Entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,"+","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,"+","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "int"	
	end

	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		return "#{val1+val2}" 
	end	 
end

#--Class OpResta--
class OpResta

	#Funcion para identificar errores de contexto de una Resta
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo Entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,"-","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,"-","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "int"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		return "#{val1-val2}" 
	end
end

#--Class OpMultiplicacion--
class OpMultiplicacion

	#Funcion para identificar errores de contexto de una Multiplicacion
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo Entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,"*","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,"*","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "int"	
	end

	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		return "#{val1*val2}" 
	end
end

#--ClassOpDivision--
class OpDivisionE

	#Funcion para identificar errores de contexto de una Division
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos	
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo Entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,"/","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,"/","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "int"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		if val2 == 0
			error = ErrDivzero.new(@oper2.pos())
			puts error.Error_to_s
			exit()
		end	
		return "#{val1/val2}" 
	end
end

#--Class OpModE--
class OpModE

	#Funcion para identificar errores de contexto de una operacion modulo
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo Entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,"%","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,"%","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "int"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		return "#{val1%val2}" 
	end
end

#--Class OpEquivalente--
class OpEquivalente

	#Funcion para identificar errores de contexto de una Equivalencia
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean del mismo tipo
		if tipo1 != tipo2
			error = ErrTipoOpBinaria.new(@oper1,tipo1,@oper2,tipo2,"==",@op.position())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil)
		val2 = @oper2.evaluar(table,nil)
		return "#{val1==val2}" 
	end
end

#--Class OpDesigual--
class OpDesigual

	#Funcion para identificar errores de contexto de una operacion Desigual
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean del mismo tipo
		if tipo1 != tipo2
			error = ErrTipoOpBinaria.new(@oper1,tipo1,@oper2,tipo2,"!=",@op.position())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil)
		val2 = @oper2.evaluar(table,nil)
		return "#{val1 != val2}" 
	end
end

#--Class OpMayorIgual--
class OpMayorIgual

	#Funcion para identificar errores de contexto de una operacion Mayor o igual
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,">=","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,">=","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		return "#{val1>=val2}" 
	end
end

#--Class OpMenorIgual--
class OpMenorIgual

	#Funcion para identificar errores de contexto de una operacion Menor o igual
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,"<=","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,"<=","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		return "#{val1<=val2}" 
	end
end

#--Class OpMenor
class OpMenor

	#Funcion para identificar errores de contexto de una operacion Menor 
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,"<","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,"<","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		return "#{val1<val2}" 
	end
end				

#--Class OpMayor--
class OpMayor

	#Funcion para identificar errores de contexto de una operacion Mayor
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo entero
		if tipo1 != "int"
			error = ErrOpBinaria.new(tipo1,">","int",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "int"	
			error = ErrOpBinaria.new(tipo2,">","int",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil).to_i
		val2 = @oper2.evaluar(table,nil).to_i
		return "#{val1>val2}" 
	end
end

#--Class OpAnd--
class OpAnd

	#Funcion para identificar errores de contexto de una operacion And
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo booleano
		if tipo1 != "bool"
			error = ErrOpBinaria.new(tipo1,"/\\","bool",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "bool"	
			error = ErrOpBinaria.new(tipo2,"/\\","bool",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil)
		val2 = @oper2.evaluar(table,nil)
		if val1 == "true" && val2 == "true"
			return "true"
		else
			return "false"
		end	 
	end
end

#--Class OpOr--
class OpOr

	#Funcion para identificar errores de contexto de una operacion Or
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de los operadores despues de la verificacion de errores
		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		#Si alguno de sus operadores es un iterador for lo cambiamos a int para utilizarlos
		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		#Revisamos que los operadores sean de tipo entero
		if tipo1 != "bool"
			error = ErrOpBinaria.new(tipo1,"\\/","bool",@oper1.pos())
			puts error.Error_to_s
			exit()
		elsif tipo2 != "bool"	
			error = ErrOpBinaria.new(tipo2,"\\/","bool",@oper2.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
	def evaluar(table,tipo=nil)
		val1 = @oper1.evaluar(table,nil)
		val2 = @oper2.evaluar(table,nil)
		if val1 == "true" || val2 == "true"
			return "true"
		else
			return "false"
		end		 
	end
end


#---Operaciones Unarias---


#--Class OpExclamacion--
class OpExclamacion

	#Funcion para identificar errores de contexto de una Negacion
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		tipo = @oper.check(padre,nil)

		#Si el operando es un iterador for lo cambiamos a int para utilizarlos
		if tipo == "Not_Modify"
			tipo = "int"
		end

		#Revisamos que el operando sea de tipo booleano
		if tipo != "bool"
			error = ErrOpUnaria.new(tipo,"!","bool",@oper.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"
	end
	def evaluar(table,tipo=nil)
		val = @oper.evaluar(table,nil)
		if val == "true"
			return "false"
		else
			return "true"
		end		 
	end
end

#--Class OpMinus--
class OpUMINUS

	#Funcion para identificar errores de contexto de una operacion Menos unitario
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		tipo = @oper.check(padre,nil)

		#Si el operando es un iterador for lo cambiamos a int para utilizarlos
		if tipo == "Not_Modify"
			tipo = "int"
		end

		#Revisamos que el operando sea de tipo booleano
		if tipo != "int"
			error = ErrOpUnaria.new(tipo,"- (UMINUS)","int",@oper.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "int"
	end
	def evaluar(table,tipo=nil)
		val = @oper.evaluar(table,nil).to_i
		return "#{-val}"	 
	end
end	

#--Class Literal--
class Literal
	
	#Funcion para identificar errores de contexto de un Literal
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre=nil,tipo=nil)
		return @tipo.to_s()
	end
	def evaluar(table=nil,tipo=nil)
		return @valor.to_s()
	end	
end				

#--Class ArrayConsult--
class ArrayConsult

	#Funcion para identificar errores de contexto de una Consulta de Arreglo
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)

		#Obtenemos el tipo de la variable despues de la revision de errores
		tipo_id = @identificador.check(padre,nil)

		#Verificamos que la variable es un arreglo 
		if tipo_id == "int" || tipo_id == "bool"
			error = ErrTipoArrayConsult.new(@identificador.id.to_s(),tipo_id,@identificador.pos())
			puts error.Error_to_s()
			exit()
		end

		#Obtenemos el tipo de la consulta despues de la revision de errores
		exp = @exp.check(padre,nil)

		#Si la consulta es una variable de iteracion for la cambiamos a int para utilizarlas
		if exp == "Not_Modify"
			exp = "int"
		end
		
		#Revisamos que la consulta sea un entero
		if exp != "int"
			error = ErrExpConsult.new(exp,@exp.pos())
			puts error.Error_to_s()
			exit()
		end	
		
		return "int"
	end

	def evaluar(table,tipo=nil)
		exp_val = @exp.evaluar(table,nil)
		#Obtenemos el primer y ultimo indice del arreglo y el arreglo
		if not table.ExistKey(@identificador.id.to_s())
				upper_table = table.get("T_Padre")

				while upper_table != nil
					if not upper_table.ExistKey(@identificador.id.to_s())

						upper_table = upper_table.get("T_Padre")

					else
						array = upper_table.get(@identificador.id.to_s())[2]
						index1 = upper_table.get(@identificador.id.to_s())[3]
						index2 = upper_table.get(@identificador.id.to_s())[4]							
						break()
					end
				end
		else
			array = table.get(@identificador.id.to_s())[2]
			index1 = table.get(@identificador.id.to_s())[3]
			index2 = table.get(@identificador.id.to_s())[4]
		end

		if array.length == 0
			error = ErrArrayIni.new(@identificador.pos())
			puts error.Error_to_s()
			exit()
		end	
		if not exp_val.to_i >= index1 && exp_val.to_i <= index2
			error = ErrOutRange.new(exp.pos())
			puts error.Error_to_s()
			exit()
		end
		
		indice_real = exp_val.to_i - index1
		return "#{array[indice_real]}"
	end		
			

end	

class ArrayAsig

	#Funcion para identificar errores de contexto de una Inicializacion de Arreglo
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		#Obtenemos el tipo de la variable despues de la revision de errores
		tipo_id = @identificador.check(padre,nil)

		#Revisamos que la variable sea un arreglo
		if tipo_id == "int" || tipo_id == "bool"
			error = ErrTipoArrayConsult.new(@identificador.id.to_s(),tipo_id,@identificador.pos())
			puts error.Error_to_s()
			exit()
		end

		#Obtenemos la consulta si existe
		consulta = @listArrayAsig.get_consult()
		if consulta != nil
			#Obtenemos el tipo de la consulta
			consulta_tipo = consulta.check(padre,nil)

			#Si la consulta es una variable de iteracion for la cambiamos a int para utilizarlas
			if consulta_tipo == "Not_Modify"
				consulta_tipo = "int"
			end

			#Revisamos que la consulta sea en un entero
			if consulta_tipo != "int"
				error = ErrExpConsult.new(consulta_tipo,consulta.pos())
				puts error.Error_to_s()
				exit()
			end
		end		

		#Revisamos errores en la lista de asignaciones
		@listArrayAsig.check(padre,nil)	
		if consulta != nil
			return "int"
		end	
		return tipo_id
	end

	def evaluar(table,tipo=nil)

		if not table.ExistKey(identificador.id.to_s())
				upper_table = table.get("T_Padre")

				while upper_table != nil
					if not upper_table.ExistKey(@identificador.id.to_s())

						upper_table = upper_table.get("T_Padre")

					else
						array = upper_table.get(@identificador.id.to_s())[2]
						index1 = upper_table.get(@identificador.id.to_s())[3]
						index2 = upper_table.get(@identificador.id.to_s())[4]							
						break()
					end
				end
		else
			array = table.get(@identificador.id.to_s())[2]
			index1 = table.get(@identificador.id.to_s())[3]
			index2 = table.get(@identificador.id.to_s())[4]
		end

		if array.length == 0
			error = ErrArrayIni.new(@identificador.pos())
			puts error.Error_to_s()
			exit()
		end
		new_array = array.clone
		return @listArrayAsig.evaluar(table,new_array,index1,index2) 
	end	

end

class ListArrayAsig

	#Funcion para identificar errores de contexto de una Inicializacion de Arreglo
	#--Atributos--
	#padre: contiene una referencia a la tabla de simbolos actual
	#tipo: nil ya que no lo necesitamos
	def check(padre,tipo=nil)
		if @lista_exp != nil

			#Obtenemos los tipos de las expresiones despues de la revision de errores
			exp1_tipo = @exp1.check(padre,nil)
			exp2_tipo = @exp2.check(padre,nil)

			#Si las expresiones son de tipo iterador for le cambiamos el tipo a entero para poder utilizarlas
			if exp1_tipo == "Not_Modify"
				exp1_tipo = "int"
			end

			if exp2_tipo == "Not_Modify"
				exp2_tipo = "int"
			end

			#Revisamos que las expresiones sean enteros
			if exp1_tipo != "int"
				error = ErrExpConsult.new(exp1_tipo,@exp1.pos())
				puts error.Error_to_s()
				exit()
			end
			
			if exp2_tipo != "int"
				error = ErrArrayAsig.new(exp2_tipo,@exp2.pos())
				puts error.Error_to_s()
				exit()
			end
			#Recorremos y revisamos las proximas asignaciones		
			@lista_exp.check(padre,nil)
		else
			#Obtenemos los tipos de las expresiones despues de la revision de errores
			exp1_tipo = @exp1.check(padre,nil)
			exp2_tipo = @exp2.check(padre,nil)

			#Si las expresiones son de tipo iterador for le cambiamos el tipo a entero para poder utilizarlas
			if exp1_tipo == "Not_Modify"
				exp1_tipo = "int"
			end

			if exp2_tipo == "Not_Modify"
				exp2_tipo = "int"
			end

			#Revisamos que las expresiones sean enteros
			if exp1_tipo != "int"
				error = ErrExpConsult.new(exp1_tipo,@exp1.pos())
				puts error.Error_to_s()
				exit()
			end
			
			if exp2_tipo != "int"
				error = ErrArrayAsig.new(exp2_tipo,@exp2.pos())
				puts error.Error_to_s()
				exit()
			end
		end
	end

	def evaluar(table,new_array,index1,index2)


		if @lista_exp != nil
			indice = @exp1.evaluar(table,nil)
			exp_val = @exp2.evaluar(table,nil)

			if not indice.to_i >= index1 && indice.to_i <= index2
				error = ErrOutRange.new(@exp1.pos())
				puts error.Error_to_s()
				exit()
			end

			indice_real = indice.to_i - index1
			new_array[indice_real] = exp_val
			@lista_exp.evaluar(table,new_array,index1,index2)
		else
			indice = @exp1.evaluar(table,nil)
			exp_val = @exp2.evaluar(table,nil)

			if not indice.to_i >= index1 && indice.to_i <= index2
				error = ErrOutRange.new(@exp1.pos())
				puts error.Error_to_s()
				exit()				
			end

			indice_real = indice.to_i - index1
			new_array[indice_real] = exp_val

			if @consult != nil
				consulta = @consult.evaluar(table,nil)
				if not consulta.to_i >= index1 && consulta.to_i <= index2
					error = ErrOutRange.new(@exp1.pos())
					puts error.Error_to_s()
					exit()
				end	
				consult_real = consulta.to_i - index1
				x = new_array[consult_real]
				return "#{x.to_s}"
			end
			return new_array
		end		

	end	


end				