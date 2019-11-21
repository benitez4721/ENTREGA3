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
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}:Operando de tipo '#{@tipo_operando}', debe ser de tipo '#{@tipo_operador}' para la operacion '#{@operador.to_s()}' "
	end	
end

class ErrTipoOpBinaria

	def initialize(operando1,tipo_operando1,operando2,tipo_operando2,operador,pos)
		@operando1 = operando1
		@tipo_operando1 = tipo_operando1
		@operando2 = operando2
		@tipo_operando2 = tipo_operando2
		@operador = operador
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Operacion invalida '#{@operador.to_s()}', los operandos  deben ser del mismo tipo"
	end
end

class ErrOpUnaria

	def initialize(tipo_operando,operador,tipo_operador,pos)
		@tipo_operando = tipo_operando
		@operador = operador
		@tipo_operador = tipo_operador
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}:Operando de tipo '#{@tipo_operando}', debe ser de tipo '#{@tipo_operador}' para la operacion '#{@operador.to_s()}' "	
	end
end

class ErrCondicional

	def initialize(tipo_cond,pos)
		@tipo_cond = tipo_cond
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}: Condicional de tipo '#{@tipo_cond}', debe ser de tipo 'bool'"
	end
end

class ErrExpFor

	def initialize(exp_tipo,pos)
		@exp_tipo = exp_tipo
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Expresion de tipo '#{@exp_tipo}', debe ser de tipo 'int' "		
	end
end	

class ErrModifyIter

	def initialize(id,pos,inst)
		@id = id
		@pos = pos
		@inst = inst
		$Error = true
	end
	
	def Error_to_s()	
		"Error Fila #{@pos[0]} Columna #{@pos[1]}: Instruccion '#{@inst}' invalida, se intento modificar la variable de iteracion '#{@id}'"
	end
end

class ErrTipoConversion

	def initialize(fun,tipo,pos)
		@fun = fun
		@pos = pos
		@tipo = tipo
		$Error = true
	end

	def Error_to_s()
		"Error Fila #{@pos[0]} Columna #{@pos[1]}: Argunmento invalido para la funcion '#{@fun}', se esperaba un 'array' y se recibio un 'int'"
	end	
end

class ErrTipoArrayConsult

	def initialize(id,tipo,pos)
		@id = id
		@pos = pos
		@tipo = tipo
		$Error = true
	end	

	def Error_to_s()
		"Error Fila #{@pos[0]} Columna #{@pos[1]}: La variable '#{@id}' es de tipo '#{@tipo}' , debe ser de tipo 'array'."
	end
end	

class ErrExpConsult

	def initialize(exp_tipo,pos)
		@exp_tipo = exp_tipo
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Expresion de tipo '#{@exp_tipo}', indice de un arreglo debe ser de tipo 'int' "		
	end
end

class ErrArrayAsig

	def initialize(exp_tipo,pos)
		@exp_tipo = exp_tipo
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Expresion de tipo '#{@exp_tipo}',  un arreglo solo admite valores de tipo 'int' "		
	end
end

class ErrTipoArrayIni
	
	def initialize(exp_tipo,pos)
		@exp_tipo = exp_tipo
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return 	"Error Fila #{@pos[0]} Columna #{@pos[1]}: Se intento realizar una inicializacion de arreglo a una varibale de tipo '#{@exp_tipo}'. "		
	end
end	

class ErrCardinalidadArray
	
	def initialize(pos)
		@pos = pos
		$Error = true
	end
	
	def Error_to_s()
		return "Error Fila #{@pos[0]} Columna #{@pos[1]}: El numero de asignaciones debe ser igual a la longitud del arreglo"
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

	def check(padre,tipo=nil)
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

		if @declaracion.get_modo == "card"
			arreglo = []
			array = @declaracion.get_array_type(arreglo).reverse
			@declaracion.check(padre,nil,0,array)
		else
			@declaracion.check(padre,nil,0)
		end			
	end
	
end

class Decla_Card

	def check(padre,tipo,i,array)
	
		if @l_identificadores != nil
			@identificador1.check(padre,array[i])
			@l_identificadores.check(padre,nil,i+1,array)
		else
			@identificador1.check(padre,array[i])
			@identificador2.check(padre,array[i+1])
		end

	end
end				 

class Decla_Tipo

	def check(padre,tipo,i=nil)
		tip = get_tipo()
		if @l_identificadores != nil
			@identificador.check(padre,tip)
			@l_identificadores.check(padre,nil)
		else
			@identificador.check(padre,tip)
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
					valor = [tipo.value(),tipo.size()]	
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
		
		x = 0
		exp_length = @expresion.length(x)
		tipo_id = @identificador.check(padre,nil)
		tipo_exp = @expresion.check(padre,nil,exp_length)

		if tipo_id == "Not_Modify"
			error = ErrModifyIter.new(@identificador.id.to_s(),@identificador.pos(),":=")
			puts error.Error_to_s
			exit()
		end

		if (tipo_id == "int" || tipo_id == "bool") && exp_length > 1
			error = ErrTipoArrayIni.new(tipo_id,@identificador.pos())
			puts error.Error_to_s()
			exit()

		elsif exp_length == 1 	 			 	
			if (tipo_id == "int" || tipo_id == "bool") && tipo_id != tipo_exp
				error = ErrAsignacion.new(tipo_id,tipo_exp,@identificador.id.fila,@identificador.id.columna)
				puts error.Error_to_s
				exit()
			end	

		end

		if tipo_id != "int" && tipo_id != "bool"
			if padre.get(@identificador.id.to_s())[1] != exp_length
				error = ErrCardinalidadArray.new(@identificador.pos())
				puts error.Error_to_s()
				exit()
			end
		end		


	end
end

class ArrayIni
	def check(padre,tipo=nil,exp_length)
		if exp_length == 1
			exp_tipo = @exp.check(padre,nil)
			return exp_tipo
		else	
			if @lista_exp != nil
				exp_tipo = @exp.check(padre,nil)
				if exp_tipo != "int"
					error = ErrArrayAsig.new(exp_tipo,@exp.pos())
					puts error.Error_to_s
					exit()
				end	
				@lista_exp.check(padre,nil,0)
			else
				exp_tipo = @exp.check(padre,nil)
				if exp_tipo != "int"
					error = ErrArrayAsig.new(exp_tipo,@exp.pos())
					puts error.Error_to_s
					exit()
				end
			end
		end			

	end
end		

class Entrada

	def check(padre)
		@identificador.check(padre,nil)
	end
end	

class Salida

	def check(padre,tipo=nil)
		@l_imprimir.check(padre,nil)
	end		
end

class Imprimir

	def check(padre,tipo = nil)

		if @lista_impresion != nil
			@lista_impresion.check(padre,nil)
		end
		@impresion.check(padre,nil)	
		
	end		
end

class Str

	def check(padre=nil,tipo=nil)
		return @string
	end		
end

class Condicional

	def check(padre,tipo=nil)
		
		cond_tipo = @condicion.check(padre,nil)

		if cond_tipo != "bool"

			error = ErrCondicional.new(cond_tipo,@condicion.pos())
			puts error.Error_to_s
			exit()
		end

		@lista_instrucciones1.check(padre)
		if @lista_instrucciones2 != nil
			@lista_instrucciones2.check(padre)
		end	

	end		
end

class Guardia

	def check(padre,tipo=nil)
		cond_tipo = @condicion.check(padre,nil)

		if cond_tipo != "bool"

			error = ErrCondicional.new(cond_tipo,@condicion.pos())
			puts error.Error_to_s
			exit()
		end

		@lista_instrucciones1.check(padre)
		if @lista_instrucciones2 != nil
			@lista_instrucciones2.check(padre)
		end	
	end		
end

class IteradorFor

	def check(padre,tipo=nil)

		@for_table = STable.new()
		@for_table.insert("T_Padre",padre)

		@for_table.insert(@id.id.to_s(),["Not_Modify",0])

		exp1_tipo = @exp1.check(padre,nil)
		exp2_tipo = @exp2.check(padre,nil)

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
			@cuerpo.l_declaraciones.check(@for_table)
		end
		
		if @cuerpo.l_instrucciones != nil
			@cuerpo.l_instrucciones.check(@for_table)
		end
	end
end

class IteratorDo

	def check(padre,tipo=nil)
		
		cond_tipo = @condicion.check(padre,nil)

		if cond_tipo != "bool"

			error = ErrCondicional.new(cond_tipo,@condicion.pos())
			puts error.Error_to_s
			exit()
		end

		@lista_instrucciones1.check(padre)
		if @lista_instrucciones2 != nil
			@lista_instrucciones2.check(padre)
		end	

	end		
end

class Min

	def check(padre,tipo=nil)
		tipo = @identificador.check(padre,nil)

		if tipo == "int" || tipo == "bool"
			error = ErrTipoConversion.new("min()",tipo,@identificador.pos())
			puts error.Error_to_s
			exit()
		end

		return "int"
	end
end

class Max

	def check(padre,tipo=nil)
		tipo = @identificador.check(padre,nil)

		if tipo == "int" || tipo == "bool"
			error = ErrTipoConversion.new("max()",tipo,@identificador.pos())
			puts error.Error_to_s
			exit()
		end

		return "int"
	end
end

class Atoi

	def check(padre,tipo=nil)
		tipo = @identificador.check(padre,nil)

		if tipo == "int" || tipo == "bool"
			error = ErrTipoConversion.new("atoi()",tipo,@identificador.pos())
			puts error.Error_to_s
			exit()
		end

		return "int"
	end
end	

class Size

	def check(padre,tipo=nil)
		tipo = @identificador.check(padre,nil)

		if tipo == "int" || tipo == "bool"
			error = ErrTipoConversion.new("size()",tipo,@identificador.pos())
			puts error.Error_to_s
			exit()
		end

		return "int"
	end
end										
#--- OPERACIONES BINARIAS--

class OpSuma

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpResta

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpMultiplicacion

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpDivisionE

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpModE

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpEquivalente

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		if tipo1 != tipo2
			error = ErrTipoOpBinaria.new(@oper1,tipo1,@oper2,tipo2,"==",@op.position())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
end

class OpDesigual

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

		if tipo1 != tipo2
			error = ErrTipoOpBinaria.new(@oper1,tipo1,@oper2,tipo2,"!=",@op.position())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"	
	end
end

class OpMayorIgual

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpMenorIgual

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpMenor

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end				

class OpMayor

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpAnd

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

class OpOr

	def check(padre,tipo=nil)

		tipo1 = @oper1.check(padre,nil)
		tipo2 = @oper2.check(padre,nil)

		if tipo1 == "Not_Modify"
			tipo1 = "int"
		end

		if tipo2 == "Not_Modify"
			tipo2 = "int"
		end

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
end

#---Operaciones Unarias---


class OpExclamacion

	def check(padre,tipo=nil)

		tipo = @oper.check(padre,nil)

		if tipo == "Not_Modify"
			tipo = "int"
		end

		if tipo != "bool"
			error = ErrOpUnaria.new(tipo,"!","bool",@oper.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "bool"
	end
end

class OpUMINUS

	def check(padre,tipo=nil)

		tipo = @oper.check(padre,nil)


		if tipo == "Not_Modify"
			tipo = "int"
		end

		if tipo != "int"
			error = ErrOpUnaria.new(tipo,"- (UMINUS)","int",@oper.pos())
			puts error.Error_to_s
			exit()
		end
		
		return "int"
	end
end	

class Literal
	
	def check(padre=nil,tipo=nil)
		return @tipo.to_s()
	end
end				

class ArrayConsult

	def check(padre,tipo=nil)
		tipo_id = @identificador.check(padre,nil)

		if tipo_id == "int" || tipo_id == "bool"
			error = ErrTipoArrayConsult.new(@identificador.id.to_s(),tipo_id,@identificador.pos())
			puts error.Error_to_s()
			exit()
		end

		exp = @exp.check(padre,nil)

		if exp != "int"
			error = ErrExpConsult.new(exp,@exp.pos())
			puts error.Error_to_s()
			exit()
		end	
		
		return "int"
	end
end	

class ArrayAsig

	def check(padre,tipo=nil)
		tipo_id = @identificador.check(padre,nil)

		if tipo_id == "int" || tipo_id == "bool"
			error = ErrTipoArrayConsult.new(@identificador.id.to_s(),tipo_id,@identificador.pos())
			puts error.Error_to_s()
			exit()
		end

		consulta = @listArrayAsig.get_consult()
		if consulta != nil
			consulta_tipo = consulta.check(padre,nil)
			if consulta_tipo != "int"
				error = ErrExpConsult.new(consulta_tipo,consulta.pos())
				puts error.Error_to_s()
				exit()
			end
		end		


		@listArrayAsig.check(padre,nil)	

		return tipo_id
	end
end

class ListArrayAsig

	def check(padre,tipo=nil)
		if @lista_exp != nil
			exp1_tipo = @exp1.check(padre,nil)
			exp2_tipo = @exp2.check(padre,nil)
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
			@lista_exp.check(padre,nil)
		else
			exp1_tipo = @exp1.check(padre,nil)
			exp2_tipo = @exp2.check(padre,nil)
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
end					








		


						

																		

