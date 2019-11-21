
#
# Autores: Marco Benitez 13-10137
#          Orlando Chaparro 12-11499

# Archivo de gramatica libre de contexto
# Debe ser pasada por racc para generar el parser con el siguiente comando
# racc -o parserGusb.rb parserGusb2.y


class ParserGusb

	# Tokens a utilizar
	token 'TkString' 'TkNum' 'TkId' 'TkPlus' 'TkEqual' 'TkIf' 'TkDo' 'TkOd' 'TkFi' 'TkFor' 'TkRof' 'TkPrint' 'TkPrintln'
		  'TkRead' 'Tkint' 'Tkbool' 'Tkarray' 'TkTrue' 'TkFalse' 'Tk0Block' 'TkCBlock' 'TkSoForth' 'TkComma' 'TkOpenPar'
		  'TkClosePar' 'TkAsig' 'TkSemicolon' 'TkArrow' 'TkMinus' 'TkDiv' 'TkMult' 'TkMod' 'TkOr' 'TkAnd' 'TkNot' 'TkLess'
		  'TkLeq' 'TkGeq' 'TkGreater' 'TkNEqual' 'Tk0Bracket' 'TkCBracket' 'TkTwoPoints' 'TkConcat' 'TkAtoi' 'TkSize' 'TkMax'
		  'TkMin' 'TkGuard' 'Tkto' 'Tkin' 'TkDeclare'

	# Precedencia de operadores

	prechigh
		left 'Tk0Bracket' right 'TkCBracket'
		right 'TkNot' UMINUS
		left 'TkMult' 'TkDiv' 'TkMod'
		left 'TkPlus' 'TkMinus'
		nonassoc 'TkGeq' 'TkLeq' 'TkGreater' 'TkLess'
		nonassoc 'TkEqual' 'TkNEqual'
		left 'TkConcat'
		left 'TkAnd'
		left 'TkOr'
		left 'TkTwoPoints'
		left 'TkComma'
	preclow


	# Comienzo de la gramatica.
	start PROGRAMA
	

	rule

	# Regla para reconocer codigos en programas
	PROGRAMA
		: 'Tk0Block' CUERPO 'TkCBlock'		{ result = Programa.new(val[1]) }
		| 'Tk0Block' 'TkCBlock'				{ result = Programa.new(nil) }
		;
		
	# Regla para reconocer el cuerpo en un programa	
	CUERPO
	    : 'TkDeclare' LISTA_DECLARACION INSTRUCCIONES   		{ result = Cuerpo.new(val[1], val[2]) }
		| INSTRUCCIONES 		     						{ result = Cuerpo.new(nil, val[0]) }
		;

	# Reglas para reconocer una lista de declaraciones
	LISTA_DECLARACION 							
		: DECLARACION							{ result = ListaDeclaracion.new(nil, val[0]) }
		| LISTA_DECLARACION 'TkSemicolon' DECLARACION		{ result = ListaDeclaracion.new(val[0], val[2]) }	
		;

	# Reglas para reconocer una declaracion
	DECLARACION
		: DECLA_CARD	{ result = val[0] }
		| DECLA_TIPO 	{ result = val[0] }
		;
	DECLA_CARD
		: IDENTIFICADOR 'TkComma' DECLA_CARD 'TkComma' TIPO  			{result = Decla_Card.new(val[0],nil,val[4],nil,val[2])}
		| IDENTIFICADOR 'TkComma' IDENTIFICADOR 'TkTwoPoints' TIPO 'TkComma' TIPO {result = Decla_Card.new(val[0],val[2],val[4],val[6],nil)}
		;
	DECLA_TIPO
		: IDENTIFICADOR 'TkTwoPoints' TIPO 		{result = Decla_Tipo.new(val[0],nil,val[2])}
		| IDENTIFICADOR 'TkComma' DECLA_TIPO  {result = Decla_Tipo.new(val[0],val[2],nil)}
		;
	# Reglas para reconocer una lista de tipos

	# Reglas para reconocer un tipo
	TIPO
		: 'Tkint' 		{ result = TipoNum.new(val[0]) }
		| 'Tkbool'    	{ result = TipoBool.new(val[0])  }
		| 'Tkarray' 'Tk0Bracket' LITERAL_NUMERO 'TkSoForth' LITERAL_NUMERO 'TkCBracket'	{ result = TipoArray.new(val[0],val[2],val[4]) }
		;

	# Reglas para reconocer asignaciones
	ASIGNACION
		: IDENTIFICADOR 'TkAsig' ARRAY_INI 		{ result = Asignacion.new(val[0], val[2]) }
		;
	ARRAY_INI
		: EXPRESION	'TkComma' ARRAY_INI {result = ArrayIni.new(val[0],val[2])}
		| EXPRESION 					{result = ArrayIni.new(val[0],nil)}
		;

	# Reglas para reconocer una lista de identificadores
	#LISTA_IDENTIFICADOR
	#	: IDENTIFICADOR									{ result = ListaId.new(nil, val[0]) }
	#	| LISTA_IDENTIFICADOR ',' IDENTIFICADOR 		{ result = ListaId.new(val[0], val[2]) }
		;

	# Regla para reconocer un identificador
	IDENTIFICADOR
		: 'TkId' 	                   { result = Identificador.new(val[0]) }
		;
	
	#Reglas para reconocer las expresiones enteras
	EXPRESION
		: LITERAL					{ result = val[0] }
		| IDENTIFICADOR 			{ result = val[0] }
		| EXP_ARRAY 				{ result = val[0] }
		| IDENTIFICADOR EXP_ARRAY_REC					{ result = ArrayAsig.new(val[0],val[1]) }
		| 'TkAtoi' 'TkOpenPar' EXPRESION 'TkClosePar'	{ result = Atoi.new(val[2]) }
		| 'TkSize' 'TkOpenPar' EXPRESION 'TkClosePar'	{ result = Size.new(val[2]) }
		| 'TkMin' 'TkOpenPar' EXPRESION 'TkClosePar'	 { result = Min.new(val[2]) }
		| 'TkMax' 'TkOpenPar' EXPRESION 'TkClosePar'	 { result = Max.new(val[2]) }
		| EXPRESION 'TkPlus' EXPRESION 	{result = OpSuma.new(val[0],val[1],val[2]) }
		| EXPRESION 'TkMinus' EXPRESION 	{ result = OpResta.new(val[0], val[1], val[2]) }
		| EXPRESION 'TkMult' EXPRESION 	{ result = OpMultiplicacion.new(val[0],val[1], val[2]) }
		| EXPRESION 'TkDiv' EXPRESION   { result = OpDivisionE.new(val[0],val[1], val[2]) }
		| EXPRESION 'TkMod' EXPRESION   { result = OpModE.new(val[0],val[1], val[2]) }
		| 'TkOpenPar' EXPRESION 'TkClosePar'			{ result = val[1] }
		| 'TkMinus' EXPRESION = UMINUS 	{ result = OpUMINUS.new(val[0], val[1]) }
		| EXPRESION 'TkAnd' EXPRESION  { result = OpAnd.new(val[0],val[1], val[2]) }
		| EXPRESION 'TkOr' EXPRESION  { result = OpOr.new(val[0], val[1], val[2]) }
		| EXPRESION 'TkEqual' EXPRESION   { result = OpEquivalente.new(val[0],val[1],val[2]) }
		| EXPRESION 'TkNEqual' EXPRESION   { result = OpDesigual.new(val[0], val[1], val[2]) }
		| 'TkNot' EXPRESION 			 { result = OpExclamacion.new(val[0],val[1]) }
		| EXPRESION 'TkLess' EXPRESION 	 { result = OpMenor.new(val[0], val[1], val[2]) }
		| EXPRESION 'TkLeq' EXPRESION   { result = OpMenorIgual.new(val[0], val[1], val[2]) }
		| EXPRESION 'TkGeq' EXPRESION   { result = OpMayorIgual.new(val[0], val[1], val[2]) }
		| EXPRESION'TkGreater' EXPRESION   	 { result = OpMayor.new(val[0], val[1], val[2]) }
		;

	LITERAL
		: LITERAL_NUMERO
		| LITERAL_BOOLEANO
		;	
	

	#Reglas para reconoces expresiones de arreglos
	EXP_ARRAY
		: IDENTIFICADOR 'Tk0Bracket' EXPRESION 'TkCBracket' {result = ArrayConsult.new(val[0],val[2])}
		;

	EXP_ARRAY_REC
		: 'TkOpenPar' EXPRESION 'TkTwoPoints' EXPRESION 'TkClosePar' EXP_ARRAY_REC	{result = ListArrayAsig.new(nil,val[1],val[3],val[5],nil)}
		| 'TkOpenPar' EXPRESION 'TkTwoPoints' EXPRESION 'TkClosePar' 				{result = ListArrayAsig.new(nil,val[1],val[3],nil,nil)}
		| 'TkOpenPar' EXPRESION 'TkTwoPoints' EXPRESION 'TkClosePar' 'Tk0Bracket' EXPRESION 'TkCBracket'  {result = ListArrayAsig.new(nil,val[1],val[3],nil,val[6])}
		;	
	# Reglas de Literales Numericos
	LITERAL_NUMERO
		: 'TkNum' 	{ result = LiteralNumerico.new(val[0]) }
		;

	# Reglas de Literales Booleanos
	LITERAL_BOOLEANO
		: 'TkTrue'	{ result = LiteralBooleano.new(val[0]) }
		| 'TkFalse'	{ result = LiteralBooleano.new(val[0]) }
		;

	# Regla para reconocer una secuencia de instrucciones
	INSTRUCCIONES
		: INSTRUCCIONES 'TkSemicolon' INSTRUCCION	{ result = Instrucciones.new(val[0], val[2]) }
		| INSTRUCCION			    	{ result = Instrucciones.new(nil, val[0]) }
		;


	# Reglas para reconocer una instruccion
	INSTRUCCION
	 	: ASIGNACION			{ result = Instruccion.new(val[0]) }
	  	| ENTRADA 				{ result = Instruccion.new(val[0]) }
	  	| SALIDA 				{ result = Instruccion.new(val[0]) }
	  	| 'TkIf' CONDICIONAL 'TkFi' 			{ result = Instruccion.new(val[1]) }
	  	| ITERACION_FOR 		{ result = Instruccion.new(val[0]) }
	  	| 'TkDo' ITERACION_DO 'TkOd'  		{ result = Instruccion.new(val[1]) }
	  	| 'Tk0Block' CUERPO 'TkCBlock' 		{ result = Instruccion.new(val[1]) } #INSTRUCCION BLOQUE
	  	;

	# Reglas para reconocer la lectura por input
	ENTRADA
	 	: 'TkRead' IDENTIFICADOR 	{ result = Entrada.new(val[1])}
	 	;

	# Reglas para reconocer el output de salida
	SALIDA
	 	: 'TkPrint' 	IMPRIMIR 		{ result = Salida.new(val[1], nil) }
	 	| 'TkPrintln' IMPRIMIR  	    { result = Salida.new(val[1], "SALTO") }
	 	;

	# Reglas para imprimir expresiones o strings por la salida estandar
	IMPRIMIR 
	 	: EXPRESION 					{ result = Imprimir.new(nil, val[0]) }
	 	| STRING 						{ result = Imprimir.new(nil, val[0]) }
	 	| IMPRIMIR  'TkConcat' EXPRESION 		{ result = Imprimir.new(val[0], val[2]) }
	 	| IMPRIMIR  'TkConcat' STRING 		{ result = Imprimir.new(val[0], val[2]) }
	 	;

	# Regla para reconocer un string en la salida
	STRING 
	 	: 'TkString'	{ result = Str.new(val[0]) }
	 	;

	# Reglas para reconocer la instruccion condicional
	CONDICIONAL
	 	: EXPRESION 'TkArrow' INSTRUCCIONES GUARDIA 	{ result = Condicional.new(val[0],val[2],val[3]) }
	 	| EXPRESION 'TkArrow' INSTRUCCIONES 			{ result = Condicional.new(val[0],val[2],nil) }
	 	;

	#Reglas para reconocer una guardia 
	GUARDIA
		: 'TkGuard' EXPRESION 'TkArrow' INSTRUCCIONES GUARDIA {result = Guardia.new(val[1],val[3],val[4])}
		| 'TkGuard' EXPRESION 'TkArrow' INSTRUCCIONES		 {result = Guardia.new(val[1],val[3],nil)}
	# Reglas para reconocer las iteraciones for
	ITERACION_FOR
	 	: 'TkFor' IDENTIFICADOR 'Tkin' EXPRESION 'Tkto' EXPRESION 'TkArrow' 'Tk0Block' CUERPO 'TkCBlock' 'TkRof'	{ result = IteradorFor.new(val[1], val[3], val[5], val[8]) }
	 	;

	# Reglas para reconocer las iteraciones do
	ITERACION_DO
		:  EXPRESION 'TkArrow' INSTRUCCIONES 		{ result = IteratorDo.new(val[0],val[2],nil) }
		|  EXPRESION 'TkArrow' INSTRUCCIONES GUARDIA { result = IteratorDo.new(val[0],val[2],val[3]) }

# Fin de las reglas

---- header ----

# Clases requeridas
require_relative 'lexer'
require_relative 'clasesGusb'
require_relative 'clasesContexto'

# Errores sintacticos
class ErrorSintactico < RuntimeError

	def initialize(token)
		@token = token
	end

	def to_s
		"ERROR: fila: " + @token.fila.to_s() + ", columna: " + @token.columna.to_s() + ", token inesperado: #{@token.token} \n"  
	end
end

# Main del Parser
---- inner ----
	
	def initialize(tokens)
		@tokens = tokens
		@yydebug = true
		super()
	end 

	def parse
		do_parse
	end

	def next_token
		@tokens.shift
	end

	def on_error(id, token, pila)
		raise ErrorSintactico.new(token)
	end