#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.15
# from Racc grammer file "".
#

require 'racc/parser.rb'


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
class ParserGusb < Racc::Parser

module_eval(<<'...end parserGusb2.y/module_eval...', 'parserGusb2.y', 235)
	
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
...end parserGusb2.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     9,    64,   131,    29,    29,    29,   129,    60,     9,    73,
    74,    75,    71,    72,    83,    82,    84,    81,    79,    80,
   130,    77,    17,    70,     6,   139,   139,   139,    61,    60,
    17,     9,    66,    93,    93,     9,   100,   101,   102,    14,
    69,    16,    68,    18,    19,    20,     9,    14,    21,    16,
    92,    18,    19,    20,    29,     9,    21,    17,     5,     6,
     9,   100,   101,   102,   100,   101,   102,     9,    17,     2,
     9,   100,   101,   102,    14,    91,    16,    44,    18,    19,
    20,    30,    17,    21,    29,    14,     9,    16,   148,    18,
    19,    20,    17,   149,    21,     9,    73,    74,    75,    14,
     9,    16,    23,    18,    19,    20,     9,    22,    21,    14,
    94,    16,    44,    18,    19,    20,    66,    17,    21,     3,
    59,    73,    74,    75,   157,   158,    89,    67,    17,   161,
     6,   162,   nil,   nil,    14,   nil,    16,   nil,    18,    19,
    20,   nil,   nil,    21,   nil,    14,   nil,    16,   nil,    18,
    19,    20,   nil,   nil,    21,    73,    74,    75,    71,    72,
    83,    82,    84,    81,    79,    80,   nil,    77,    78,   nil,
    76,    73,    74,    75,    71,    72,    83,    82,    84,    81,
    79,    80,   nil,    77,    78,   nil,    76,   nil,    73,    74,
    75,    71,    72,    83,    82,    84,    81,    79,    80,   141,
    77,    78,   nil,    76,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   152,    73,    74,    75,    71,    72,    83,    82,    84,
    81,    79,    80,   nil,    77,    78,   nil,    76,    85,    55,
    44,     9,   nil,   nil,   nil,    41,   nil,    55,    44,     9,
   nil,    40,   nil,    41,   nil,   nil,   nil,   nil,   nil,    40,
   nil,   nil,   151,    73,    74,    75,    71,    72,   -75,   -75,
   -75,   -75,    34,    39,   nil,    35,    36,    37,    45,    46,
    34,    39,   nil,    35,    36,    37,    45,    46,    73,    74,
    75,    71,    72,    83,    82,    84,    81,    79,    80,   nil,
    77,    78,   nil,    76,    55,    44,     9,   nil,   nil,   nil,
    41,   nil,   nil,    44,     9,   nil,    40,   nil,    41,   nil,
   nil,    44,     9,   nil,    40,   nil,    41,   nil,    90,   nil,
   nil,   nil,    40,   nil,   nil,   nil,   nil,    34,    39,   nil,
    35,    36,    37,    45,    46,    34,    39,   nil,    35,    36,
    37,    45,    46,    34,    39,   nil,    35,    36,    37,    45,
    46,    44,     9,   nil,   nil,   nil,    41,   nil,   nil,    44,
     9,   nil,    40,   nil,    41,   nil,   nil,    44,     9,   nil,
    40,   nil,    41,   nil,   nil,   nil,   nil,   nil,    40,   nil,
   nil,   nil,   nil,    34,    39,   nil,    35,    36,    37,    45,
    46,    34,    39,   nil,    35,    36,    37,    45,    46,    34,
    39,   nil,    35,    36,    37,    45,    46,    44,     9,   nil,
   nil,   nil,    41,   nil,   nil,    44,     9,   nil,    40,   nil,
    41,   nil,   nil,    44,     9,   nil,    40,   nil,    41,   nil,
   nil,   nil,   nil,   nil,    40,   nil,   nil,   nil,   nil,    34,
    39,   nil,    35,    36,    37,    45,    46,    34,    39,   nil,
    35,    36,    37,    45,    46,    34,    39,   nil,    35,    36,
    37,    45,    46,    44,     9,   nil,   nil,   nil,    41,   nil,
   nil,    44,     9,   nil,    40,   nil,    41,   nil,   nil,    44,
     9,   nil,    40,   nil,    41,   nil,   nil,   nil,   nil,   nil,
    40,   nil,   nil,   nil,   nil,    34,    39,   nil,    35,    36,
    37,    45,    46,    34,    39,   nil,    35,    36,    37,    45,
    46,    34,    39,   nil,    35,    36,    37,    45,    46,    44,
     9,   nil,   nil,   nil,    41,   nil,   nil,    44,     9,   nil,
    40,   nil,    41,   nil,   nil,    44,     9,   nil,    40,   nil,
    41,   nil,   nil,   nil,   nil,   nil,    40,   nil,   nil,   nil,
   nil,    34,    39,   nil,    35,    36,    37,    45,    46,    34,
    39,   nil,    35,    36,    37,    45,    46,    34,    39,   nil,
    35,    36,    37,    45,    46,    44,     9,   nil,   nil,   nil,
    41,   nil,   nil,    44,     9,   nil,    40,   nil,    41,   nil,
   nil,    44,     9,   nil,    40,   nil,    41,   nil,   nil,   nil,
   nil,   nil,    40,   nil,   nil,   nil,   nil,    34,    39,   nil,
    35,    36,    37,    45,    46,    34,    39,   nil,    35,    36,
    37,    45,    46,    34,    39,   nil,    35,    36,    37,    45,
    46,    44,     9,   nil,   nil,   nil,    41,   nil,   nil,    44,
     9,   nil,    40,   nil,    41,   nil,   nil,    44,     9,   nil,
    40,   nil,    41,   nil,   nil,   nil,   nil,   nil,    40,   nil,
   nil,   nil,   nil,    34,    39,   nil,    35,    36,    37,    45,
    46,    34,    39,   nil,    35,    36,    37,    45,    46,    34,
    39,   nil,    35,    36,    37,    45,    46,    44,     9,   nil,
   nil,   nil,    41,   nil,   nil,    44,     9,   nil,    40,   nil,
    41,   nil,   nil,    44,     9,   nil,    40,   nil,    41,   nil,
   nil,   nil,   nil,   nil,    40,   nil,   nil,   nil,   nil,    34,
    39,   nil,    35,    36,    37,    45,    46,    34,    39,   nil,
    35,    36,    37,    45,    46,    34,    39,   nil,    35,    36,
    37,    45,    46,    44,     9,   nil,   nil,   nil,    41,   nil,
   nil,    44,     9,   nil,    40,   nil,    41,   nil,   nil,    44,
     9,   nil,    40,   nil,    41,   nil,   nil,   nil,   nil,   nil,
    40,   nil,   nil,   nil,   nil,    34,    39,   nil,    35,    36,
    37,    45,    46,    34,    39,   nil,    35,    36,    37,    45,
    46,    34,    39,   nil,    35,    36,    37,    45,    46,    44,
     9,   nil,   nil,   nil,    41,   nil,   nil,    44,     9,   nil,
    40,   nil,    41,   nil,   nil,    44,     9,   nil,    40,   nil,
    41,   nil,   nil,   nil,   nil,   nil,    40,   nil,   nil,   nil,
   nil,    34,    39,   nil,    35,    36,    37,    45,    46,    34,
    39,   nil,    35,    36,    37,    45,    46,    34,    39,   nil,
    35,    36,    37,    45,    46,    44,     9,   nil,   nil,   nil,
    41,   nil,   nil,   nil,   nil,   nil,    40,   nil,    73,    74,
    75,    71,    72,    83,    82,    84,    81,    79,    80,   nil,
    77,    78,   nil,    76,   nil,   nil,   nil,    34,    39,   nil,
    35,    36,    37,    45,    46,   150,    73,    74,    75,    71,
    72,    83,    82,    84,    81,    79,    80,   nil,    77,    78,
   nil,    76,    73,    74,    75,    71,    72,    83,    82,    84,
    81,    79,    80,   134,    77,    78,   nil,    76,    73,    74,
    75,    71,    72,    83,    82,    84,    81,    79,    80,   135,
    77,    78,   nil,    76,    73,    74,    75,    71,    72,    83,
    82,    84,    81,    79,    80,   136,    77,    78,   nil,    76,
    73,    74,    75,    71,    72,    83,    82,    84,    81,    79,
    80,   124,    77,    78,   nil,    76,    73,    74,    75,    71,
    72,   -75,   -75,   -75,   -75,   132,   nil,   137,    73,    74,
    75,    71,    72,    83,    82,    84,    81,    79,    80,   nil,
    77,    78,   nil,    76,    73,    74,    75,    71,    72,    83,
    82,    84,    81,    79,    80,   nil,    77,    78,   133,    76,
    73,    74,    75,    71,    72,    83,    82,    84,    81,    79,
    80,   nil,    77,    78,   nil,    76,    73,    74,    75,    71,
    72,    83,    82,    84,    81,    79,    80,   nil,    77,    78,
   nil,    76,    73,    74,    75,    71,    72,    83,    82,    84,
    81,    79,    80,   nil,    77,    78,   nil,    76,    73,    74,
    75,    71,    72,    83,    82,    84,    81,    79,    80,   nil,
    77,    78,    73,    74,    75,    71,    72,    83,    82,    84,
    81,   -75,   -75,    73,    74,    75,    71,    72,    83,    82,
    84,    81,   -75,   -75,    73,    74,    75,    71,    72,    83,
    82,    84,    81,    79,    80,    73,    74,    75,    71,    72,
   -75,   -75,   -75,   -75,    73,    74,    75,    71,    72,   -75,
   -75,   -75,   -75 ]

racc_action_check = [
   157,    32,   102,   123,   125,   156,    96,    96,   151,   116,
   116,   116,   116,   116,   116,   116,   116,   116,   116,   116,
    97,   116,   157,    37,   157,   123,   125,   156,    28,    28,
   151,    21,    32,    56,    53,     2,    61,    61,    61,   157,
    36,   157,    35,   157,   157,   157,    85,   151,   157,   151,
    50,   151,   151,   151,    58,    59,   151,     2,     2,     2,
    90,   130,   130,   130,   129,   129,   129,    18,    85,     0,
    29,   148,   148,   148,     2,    49,     2,   131,     2,     2,
     2,     8,    90,     2,     7,    85,     6,    85,   142,    85,
    85,    85,    29,   144,    85,    24,   110,   110,   110,    90,
    60,    90,     4,    90,    90,    90,    17,     3,    90,    29,
    57,    29,   149,    29,    29,    29,   150,    24,    29,     1,
    24,   109,   109,   109,   152,   154,    47,    34,    17,   160,
    17,   161,   nil,   nil,    24,   nil,    24,   nil,    24,    24,
    24,   nil,   nil,    24,   nil,    17,   nil,    17,   nil,    17,
    17,    17,   nil,   nil,    17,   128,   128,   128,   128,   128,
   128,   128,   128,   128,   128,   128,   nil,   128,   128,   nil,
   128,   147,   147,   147,   147,   147,   147,   147,   147,   147,
   147,   147,   nil,   147,   147,   nil,   147,   nil,    38,    38,
    38,    38,    38,    38,    38,    38,    38,    38,    38,   128,
    38,    38,   nil,    38,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   147,   146,   146,   146,   146,   146,   146,   146,   146,
   146,   146,   146,   nil,   146,   146,   nil,   146,    38,    19,
    19,    19,   nil,   nil,   nil,    19,   nil,    20,    20,    20,
   nil,    19,   nil,    20,   nil,   nil,   nil,   nil,   nil,    20,
   nil,   nil,   146,   121,   121,   121,   121,   121,   121,   121,
   121,   121,    19,    19,   nil,    19,    19,    19,    19,    19,
    20,    20,   nil,    20,    20,    20,    20,    20,    48,    48,
    48,    48,    48,    48,    48,    48,    48,    48,    48,   nil,
    48,    48,   nil,    48,    93,    93,    93,   nil,   nil,   nil,
    93,   nil,   nil,   139,   139,   nil,    93,   nil,   139,   nil,
   nil,   141,   141,   nil,   139,   nil,   141,   nil,    48,   nil,
   nil,   nil,   141,   nil,   nil,   nil,   nil,    93,    93,   nil,
    93,    93,    93,    93,    93,   139,   139,   nil,   139,   139,
   139,   139,   139,   141,   141,   nil,   141,   141,   141,   141,
   141,    30,    30,   nil,   nil,   nil,    30,   nil,   nil,    94,
    94,   nil,    30,   nil,    94,   nil,   nil,   133,   133,   nil,
    94,   nil,   133,   nil,   nil,   nil,   nil,   nil,   133,   nil,
   nil,   nil,   nil,    30,    30,   nil,    30,    30,    30,    30,
    30,    94,    94,   nil,    94,    94,    94,    94,    94,   133,
   133,   nil,   133,   133,   133,   133,   133,    84,    84,   nil,
   nil,   nil,    84,   nil,   nil,    83,    83,   nil,    84,   nil,
    83,   nil,   nil,    82,    82,   nil,    83,   nil,    82,   nil,
   nil,   nil,   nil,   nil,    82,   nil,   nil,   nil,   nil,    84,
    84,   nil,    84,    84,    84,    84,    84,    83,    83,   nil,
    83,    83,    83,    83,    83,    82,    82,   nil,    82,    82,
    82,    82,    82,    16,    16,   nil,   nil,   nil,    16,   nil,
   nil,    39,    39,   nil,    16,   nil,    39,   nil,   nil,    40,
    40,   nil,    39,   nil,    40,   nil,   nil,   nil,   nil,   nil,
    40,   nil,   nil,   nil,   nil,    16,    16,   nil,    16,    16,
    16,    16,    16,    39,    39,   nil,    39,    39,    39,    39,
    39,    40,    40,   nil,    40,    40,    40,    40,    40,    41,
    41,   nil,   nil,   nil,    41,   nil,   nil,    81,    81,   nil,
    41,   nil,    81,   nil,   nil,    14,    14,   nil,    81,   nil,
    14,   nil,   nil,   nil,   nil,   nil,    14,   nil,   nil,   nil,
   nil,    41,    41,   nil,    41,    41,    41,    41,    41,    81,
    81,   nil,    81,    81,    81,    81,    81,    14,    14,   nil,
    14,    14,    14,    14,    14,    80,    80,   nil,   nil,   nil,
    80,   nil,   nil,    78,    78,   nil,    80,   nil,    78,   nil,
   nil,    77,    77,   nil,    78,   nil,    77,   nil,   nil,   nil,
   nil,   nil,    77,   nil,   nil,   nil,   nil,    80,    80,   nil,
    80,    80,    80,    80,    80,    78,    78,   nil,    78,    78,
    78,    78,    78,    77,    77,   nil,    77,    77,    77,    77,
    77,    76,    76,   nil,   nil,   nil,    76,   nil,   nil,    75,
    75,   nil,    76,   nil,    75,   nil,   nil,    74,    74,   nil,
    75,   nil,    74,   nil,   nil,   nil,   nil,   nil,    74,   nil,
   nil,   nil,   nil,    76,    76,   nil,    76,    76,    76,    76,
    76,    75,    75,   nil,    75,    75,    75,    75,    75,    74,
    74,   nil,    74,    74,    74,    74,    74,    73,    73,   nil,
   nil,   nil,    73,   nil,   nil,    72,    72,   nil,    73,   nil,
    72,   nil,   nil,    71,    71,   nil,    72,   nil,    71,   nil,
   nil,   nil,   nil,   nil,    71,   nil,   nil,   nil,   nil,    73,
    73,   nil,    73,    73,    73,    73,    73,    72,    72,   nil,
    72,    72,    72,    72,    72,    71,    71,   nil,    71,    71,
    71,    71,    71,    70,    70,   nil,   nil,   nil,    70,   nil,
   nil,    69,    69,   nil,    70,   nil,    69,   nil,   nil,    64,
    64,   nil,    69,   nil,    64,   nil,   nil,   nil,   nil,   nil,
    64,   nil,   nil,   nil,   nil,    70,    70,   nil,    70,    70,
    70,    70,    70,    69,    69,   nil,    69,    69,    69,    69,
    69,    64,    64,   nil,    64,    64,    64,    64,    64,    66,
    66,   nil,   nil,   nil,    66,   nil,   nil,    67,    67,   nil,
    66,   nil,    67,   nil,   nil,    68,    68,   nil,    67,   nil,
    68,   nil,   nil,   nil,   nil,   nil,    68,   nil,   nil,   nil,
   nil,    66,    66,   nil,    66,    66,    66,    66,    66,    67,
    67,   nil,    67,    67,    67,    67,    67,    68,    68,   nil,
    68,    68,    68,    68,    68,    79,    79,   nil,   nil,   nil,
    79,   nil,   nil,   nil,   nil,   nil,    79,   nil,   145,   145,
   145,   145,   145,   145,   145,   145,   145,   145,   145,   nil,
   145,   145,   nil,   145,   nil,   nil,   nil,    79,    79,   nil,
    79,    79,    79,    79,    79,   145,   105,   105,   105,   105,
   105,   105,   105,   105,   105,   105,   105,   nil,   105,   105,
   nil,   105,   106,   106,   106,   106,   106,   106,   106,   106,
   106,   106,   106,   105,   106,   106,   nil,   106,   107,   107,
   107,   107,   107,   107,   107,   107,   107,   107,   107,   106,
   107,   107,   nil,   107,    86,    86,    86,    86,    86,    86,
    86,    86,    86,    86,    86,   107,    86,    86,   nil,    86,
   108,   108,   108,   108,   108,   108,   108,   108,   108,   108,
   108,    86,   108,   108,   nil,   108,   122,   122,   122,   122,
   122,   122,   122,   122,   122,   103,   nil,   108,   103,   103,
   103,   103,   103,   103,   103,   103,   103,   103,   103,   nil,
   103,   103,   nil,   103,   104,   104,   104,   104,   104,   104,
   104,   104,   104,   104,   104,   nil,   104,   104,   104,   104,
   126,   126,   126,   126,   126,   126,   126,   126,   126,   126,
   126,   nil,   126,   126,   nil,   126,    52,    52,    52,    52,
    52,    52,    52,    52,    52,    52,    52,   nil,    52,    52,
   nil,    52,    63,    63,    63,    63,    63,    63,    63,    63,
    63,    63,    63,   nil,    63,    63,   nil,    63,   114,   114,
   114,   114,   114,   114,   114,   114,   114,   114,   114,   nil,
   114,   114,   117,   117,   117,   117,   117,   117,   117,   117,
   117,   117,   117,   118,   118,   118,   118,   118,   118,   118,
   118,   118,   118,   118,   115,   115,   115,   115,   115,   115,
   115,   115,   115,   115,   115,   119,   119,   119,   119,   119,
   119,   119,   119,   119,   120,   120,   120,   120,   120,   120,
   120,   120,   120 ]

racc_action_pointer = [
    43,   119,    31,   107,    75,   nil,    82,    55,    47,   nil,
   nil,   nil,   nil,   nil,   532,   nil,   460,   102,    63,   227,
   235,    27,   nil,   nil,    91,   nil,   nil,   nil,     4,    66,
   348,   nil,    -4,   nil,    91,     6,     4,   -13,   178,   468,
   476,   516,   nil,   nil,   nil,   nil,   nil,    82,   268,    29,
    23,   nil,  1026,    13,   nil,   nil,    12,    57,    25,    51,
    96,     6,   nil,  1042,   756,   nil,   796,   804,   812,   748,
   740,   700,   692,   684,   644,   636,   628,   588,   580,   852,
   572,   524,   420,   412,   404,    42,   934,   nil,   nil,   nil,
    56,   nil,   nil,   292,   356,   nil,   -18,    -5,   nil,   nil,
   nil,   nil,    -3,   978,   994,   886,   902,   918,   950,   111,
    86,   nil,   nil,   nil,  1058,  1094,    -1,  1072,  1083,  1105,
  1114,   243,   966,   -26,   nil,   -25,  1010,   nil,   145,    34,
    31,    74,   nil,   364,   nil,   nil,   nil,   nil,   nil,   300,
   nil,   308,    63,   nil,    60,   858,   202,   161,    41,   109,
    80,     4,    98,   nil,   118,   nil,   -24,    -4,   nil,   nil,
   102,    76,   nil ]

racc_action_default = [
   -75,   -75,   -75,   -75,   -75,    -2,   -75,    -4,   -75,   -17,
   -52,   -53,   -54,   -55,   -75,   -57,   -75,   -75,   -75,   -75,
   -75,   -75,   163,    -1,   -75,    -5,    -7,    -8,   -75,   -75,
   -75,   -18,   -19,   -20,   -75,   -75,   -75,   -75,   -75,   -75,
   -75,   -75,   -42,   -43,   -48,   -49,   -50,   -75,   -75,   -75,
   -75,   -60,   -63,   -61,   -64,   -67,   -62,   -75,    -3,   -75,
   -75,   -75,   -51,   -16,   -75,   -45,   -75,   -75,   -75,   -75,
   -75,   -75,   -75,   -75,   -75,   -75,   -75,   -75,   -75,   -75,
   -75,   -75,   -75,   -75,   -75,   -75,   -75,   -32,   -37,   -56,
   -75,   -58,   -59,   -75,   -75,    -6,   -75,   -75,   -12,   -11,
   -13,   -14,   -75,   -75,   -75,   -75,   -75,   -75,   -75,   -25,
   -26,   -27,   -28,   -29,   -30,   -33,   -34,   -35,   -36,   -38,
   -39,   -40,   -41,   -69,   -31,   -73,   -65,   -66,   -75,   -75,
   -75,   -75,   -44,   -75,   -21,   -22,   -23,   -24,   -68,   -75,
   -74,   -75,   -11,    -9,   -75,   -75,   -75,   -75,   -75,   -75,
   -47,   -75,   -75,   -10,   -75,   -46,   -71,   -75,   -15,   -70,
   -75,   -75,   -72 ]

racc_goto_table = [
     4,     8,    58,    65,    99,    28,   138,    25,   140,   144,
    53,    56,    24,    62,    47,    50,     8,    51,    49,    97,
    57,    98,   127,     8,     1,   nil,   nil,   154,     8,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   159,
    38,   nil,    48,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    63,   nil,    28,    96,
    95,   nil,   nil,   123,   nil,    86,    87,    88,   125,   nil,
   nil,   nil,   142,   143,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     8,   nil,   nil,   nil,   nil,     8,
   103,   153,   104,   105,   106,   107,   108,   109,   110,   111,
   112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
   122,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   126,
   128,   155,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   156,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     8,   nil,   nil,   nil,   nil,   160,     8,   nil,   nil,   145,
   nil,   nil,   nil,   nil,   nil,   146,   nil,   147 ]

racc_goto_check = [
     2,     8,     4,    16,     9,     8,    25,     5,    25,    10,
    23,    23,     3,    17,    20,     2,     8,     8,    22,     6,
     8,     7,    24,     8,     1,   nil,   nil,    10,     8,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    25,
    12,   nil,    12,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    12,   nil,     8,     8,
     5,   nil,   nil,     4,   nil,    12,    12,    12,     4,   nil,
   nil,   nil,     9,     9,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     8,   nil,   nil,   nil,   nil,     8,
    12,     9,    12,    12,    12,    12,    12,    12,    12,    12,
    12,    12,    12,    12,    12,    12,    12,    12,    12,    12,
    12,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    12,
    12,    16,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     8,   nil,   nil,   nil,   nil,     2,     8,   nil,   nil,    12,
   nil,   nil,   nil,   nil,   nil,    12,   nil,    12 ]

racc_goto_pointer = [
   nil,    24,    -2,     6,   -22,     1,   -41,   -39,    -1,   -57,
  -122,   nil,    26,   nil,   nil,   nil,   -29,   -16,   nil,   nil,
     0,   nil,     2,    -9,   -71,  -117 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,     7,   nil,    26,    27,    32,   nil,
    42,    11,    52,    31,    33,    43,   nil,    10,    12,    13,
   nil,    15,   nil,   nil,    54,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  3, 57, :_reduce_1,
  2, 57, :_reduce_2,
  3, 58, :_reduce_3,
  1, 58, :_reduce_4,
  1, 59, :_reduce_5,
  3, 59, :_reduce_6,
  1, 61, :_reduce_7,
  1, 61, :_reduce_8,
  5, 62, :_reduce_9,
  7, 62, :_reduce_10,
  3, 63, :_reduce_11,
  3, 63, :_reduce_12,
  1, 65, :_reduce_13,
  1, 65, :_reduce_14,
  6, 65, :_reduce_15,
  3, 67, :_reduce_16,
  1, 64, :_reduce_17,
  1, 68, :_reduce_18,
  1, 68, :_reduce_19,
  1, 68, :_reduce_20,
  4, 68, :_reduce_21,
  4, 68, :_reduce_22,
  4, 68, :_reduce_23,
  4, 68, :_reduce_24,
  3, 68, :_reduce_25,
  3, 68, :_reduce_26,
  3, 68, :_reduce_27,
  3, 68, :_reduce_28,
  3, 68, :_reduce_29,
  3, 68, :_reduce_30,
  3, 68, :_reduce_31,
  2, 68, :_reduce_32,
  3, 68, :_reduce_33,
  3, 68, :_reduce_34,
  3, 68, :_reduce_35,
  3, 68, :_reduce_36,
  2, 68, :_reduce_37,
  3, 68, :_reduce_38,
  3, 68, :_reduce_39,
  3, 68, :_reduce_40,
  3, 68, :_reduce_41,
  1, 69, :_reduce_none,
  1, 69, :_reduce_none,
  4, 70, :_reduce_44,
  2, 70, :_reduce_45,
  6, 72, :_reduce_46,
  5, 72, :_reduce_47,
  1, 66, :_reduce_48,
  1, 71, :_reduce_49,
  1, 71, :_reduce_50,
  3, 60, :_reduce_51,
  1, 60, :_reduce_52,
  1, 73, :_reduce_53,
  1, 73, :_reduce_54,
  1, 73, :_reduce_55,
  3, 73, :_reduce_56,
  1, 73, :_reduce_57,
  3, 73, :_reduce_58,
  3, 73, :_reduce_59,
  2, 74, :_reduce_60,
  2, 75, :_reduce_61,
  2, 75, :_reduce_62,
  1, 79, :_reduce_63,
  1, 79, :_reduce_64,
  3, 79, :_reduce_65,
  3, 79, :_reduce_66,
  1, 80, :_reduce_67,
  4, 76, :_reduce_68,
  3, 76, :_reduce_69,
  5, 81, :_reduce_70,
  4, 81, :_reduce_71,
  11, 77, :_reduce_72,
  3, 78, :_reduce_73,
  4, 78, :_reduce_74 ]

racc_reduce_n = 75

racc_shift_n = 163

racc_token_table = {
  false => 0,
  :error => 1,
  "TkString" => 2,
  "TkNum" => 3,
  "TkId" => 4,
  "[" => 5,
  :right => 6,
  "]" => 7,
  "!" => 8,
  :UMINUS => 9,
  "*" => 10,
  "/" => 11,
  "%" => 12,
  "+" => 13,
  "-" => 14,
  ">=" => 15,
  "<=" => 16,
  ">" => 17,
  "<" => 18,
  "==" => 19,
  "!=" => 20,
  "||" => 21,
  "/\\" => 22,
  "\\/" => 23,
  ":" => 24,
  "," => 25,
  "|[" => 26,
  "]|" => 27,
  "declare" => 28,
  ";" => 29,
  "int" => 30,
  "bool" => 31,
  "array" => 32,
  ".." => 33,
  ":=" => 34,
  "atoi" => 35,
  "(" => 36,
  ")" => 37,
  "size" => 38,
  "min" => 39,
  "max" => 40,
  "true" => 41,
  "false" => 42,
  "if" => 43,
  "fi" => 44,
  "do" => 45,
  "od" => 46,
  "read" => 47,
  "print" => 48,
  "println" => 49,
  "-->" => 50,
  "[]" => 51,
  "for" => 52,
  "in" => 53,
  "to" => 54,
  "rof" => 55 }

racc_nt_base = 56

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"TkString\"",
  "\"TkNum\"",
  "\"TkId\"",
  "\"[\"",
  "right",
  "\"]\"",
  "\"!\"",
  "UMINUS",
  "\"*\"",
  "\"/\"",
  "\"%\"",
  "\"+\"",
  "\"-\"",
  "\">=\"",
  "\"<=\"",
  "\">\"",
  "\"<\"",
  "\"==\"",
  "\"!=\"",
  "\"||\"",
  "\"/\\\\\"",
  "\"\\\\/\"",
  "\":\"",
  "\",\"",
  "\"|[\"",
  "\"]|\"",
  "\"declare\"",
  "\";\"",
  "\"int\"",
  "\"bool\"",
  "\"array\"",
  "\"..\"",
  "\":=\"",
  "\"atoi\"",
  "\"(\"",
  "\")\"",
  "\"size\"",
  "\"min\"",
  "\"max\"",
  "\"true\"",
  "\"false\"",
  "\"if\"",
  "\"fi\"",
  "\"do\"",
  "\"od\"",
  "\"read\"",
  "\"print\"",
  "\"println\"",
  "\"-->\"",
  "\"[]\"",
  "\"for\"",
  "\"in\"",
  "\"to\"",
  "\"rof\"",
  "$start",
  "PROGRAMA",
  "CUERPO",
  "LISTA_DECLARACION",
  "INSTRUCCIONES",
  "DECLARACION",
  "DECLA_CARD",
  "DECLA_TIPO",
  "IDENTIFICADOR",
  "TIPO",
  "LITERAL_NUMERO",
  "ASIGNACION",
  "EXPRESION",
  "LITERAL",
  "EXP_ARRAY",
  "LITERAL_BOOLEANO",
  "EXP_ARRAY_REC",
  "INSTRUCCION",
  "ENTRADA",
  "SALIDA",
  "CONDICIONAL",
  "ITERACION_FOR",
  "ITERACION_DO",
  "IMPRIMIR",
  "STRING",
  "GUARDIA" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parserGusb2.y', 40)
  def _reduce_1(val, _values, result)
     result = Programa.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 41)
  def _reduce_2(val, _values, result)
     result = Programa.new(nil) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 46)
  def _reduce_3(val, _values, result)
     result = Cuerpo.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 47)
  def _reduce_4(val, _values, result)
     result = Cuerpo.new(nil, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 52)
  def _reduce_5(val, _values, result)
     result = ListaDeclaracion.new(nil, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 53)
  def _reduce_6(val, _values, result)
     result = ListaDeclaracion.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 58)
  def _reduce_7(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 59)
  def _reduce_8(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 62)
  def _reduce_9(val, _values, result)
    result = Decla_Card.new(val[0],nil,val[4],nil,val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 63)
  def _reduce_10(val, _values, result)
    result = Decla_Card.new(val[0],val[2],val[4],val[6],nil)
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 66)
  def _reduce_11(val, _values, result)
    result = Decla_Tipo.new(val[0],nil,val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 67)
  def _reduce_12(val, _values, result)
    result = Decla_Tipo.new(val[0],val[2],nil)
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 73)
  def _reduce_13(val, _values, result)
     result = TipoNum.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 74)
  def _reduce_14(val, _values, result)
     result = TipoBool.new(val[0])  
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 75)
  def _reduce_15(val, _values, result)
     result = TipoArray.new(val[0],val[2],val[4]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 80)
  def _reduce_16(val, _values, result)
     result = Asignacion.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 91)
  def _reduce_17(val, _values, result)
     result = Identificador.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 96)
  def _reduce_18(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 97)
  def _reduce_19(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 98)
  def _reduce_20(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 99)
  def _reduce_21(val, _values, result)
     result = Atoi.new(val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 100)
  def _reduce_22(val, _values, result)
     result = Size.new(val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 101)
  def _reduce_23(val, _values, result)
     result = Min.new(val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 102)
  def _reduce_24(val, _values, result)
     result = Max.new(val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 103)
  def _reduce_25(val, _values, result)
    result = OpSuma.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 104)
  def _reduce_26(val, _values, result)
     result = OpResta.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 105)
  def _reduce_27(val, _values, result)
     result = OpMultiplicacion.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 106)
  def _reduce_28(val, _values, result)
     result = OpDivisionE.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 107)
  def _reduce_29(val, _values, result)
     result = OpModE.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 108)
  def _reduce_30(val, _values, result)
     result = OpComa.new(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 109)
  def _reduce_31(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 110)
  def _reduce_32(val, _values, result)
     result = OpUMINUS.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 111)
  def _reduce_33(val, _values, result)
     result = OpAnd.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 112)
  def _reduce_34(val, _values, result)
     result = OpOr.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 113)
  def _reduce_35(val, _values, result)
     result = OpEquivalente.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 114)
  def _reduce_36(val, _values, result)
     result = OpDesigual.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 115)
  def _reduce_37(val, _values, result)
     result = OpExclamacion.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 116)
  def _reduce_38(val, _values, result)
     result = OpMenor.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 117)
  def _reduce_39(val, _values, result)
     result = OpMenorIgual.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 118)
  def _reduce_40(val, _values, result)
     result = OpMayorIgual.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 119)
  def _reduce_41(val, _values, result)
     result = OpMayor.new(val[0], val[2]) 
    result
  end
.,.,

# reduce 42 omitted

# reduce 43 omitted

module_eval(<<'.,.,', 'parserGusb2.y', 130)
  def _reduce_44(val, _values, result)
    result = ArrayConsult.new(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 131)
  def _reduce_45(val, _values, result)
    result = ArrayAsig.new(val[0],val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 135)
  def _reduce_46(val, _values, result)
    result = ListArrayAsig.new(nil,val[1],val[3],val[5])
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 136)
  def _reduce_47(val, _values, result)
    result = ListArrayAsig.new(nil,val[1],val[3],nil)
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 140)
  def _reduce_48(val, _values, result)
     result = LiteralNumerico.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 145)
  def _reduce_49(val, _values, result)
     result = LiteralBooleano.new("true") 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 146)
  def _reduce_50(val, _values, result)
     result = LiteralBooleano.new("false") 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 151)
  def _reduce_51(val, _values, result)
     result = Instrucciones.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 152)
  def _reduce_52(val, _values, result)
     result = Instrucciones.new(nil, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 158)
  def _reduce_53(val, _values, result)
     result = Instruccion.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 159)
  def _reduce_54(val, _values, result)
     result = Instruccion.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 160)
  def _reduce_55(val, _values, result)
     result = Instruccion.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 161)
  def _reduce_56(val, _values, result)
     result = Instruccion.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 162)
  def _reduce_57(val, _values, result)
     result = Instruccion.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 163)
  def _reduce_58(val, _values, result)
     result = Instruccion.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 164)
  def _reduce_59(val, _values, result)
     result = Instruccion.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 169)
  def _reduce_60(val, _values, result)
     result = Entrada.new(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 174)
  def _reduce_61(val, _values, result)
     result = Salida.new(val[1], nil) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 175)
  def _reduce_62(val, _values, result)
     result = Salida.new(val[1], "SALTO") 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 180)
  def _reduce_63(val, _values, result)
     result = Imprimir.new(nil, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 181)
  def _reduce_64(val, _values, result)
     result = Imprimir.new(nil, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 182)
  def _reduce_65(val, _values, result)
     result = Imprimir.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 183)
  def _reduce_66(val, _values, result)
     result = Imprimir.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 188)
  def _reduce_67(val, _values, result)
     result = Str.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 193)
  def _reduce_68(val, _values, result)
     result = Condicional.new(val[0],val[2],val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 194)
  def _reduce_69(val, _values, result)
     result = Condicional.new(val[0],val[2],nil) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 199)
  def _reduce_70(val, _values, result)
    result = Guardia.new(val[1],val[3],val[4])
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 200)
  def _reduce_71(val, _values, result)
    result = Guardia.new(val[1],val[3],nil)
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 203)
  def _reduce_72(val, _values, result)
     result = IteradorFor.new(val[1], val[3], val[5], val[8]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 208)
  def _reduce_73(val, _values, result)
     result = IteratorDo.new(val[0],val[2],nil) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parserGusb2.y', 209)
  def _reduce_74(val, _values, result)
     result = IteratorDo.new(val[0],val[2],val[3]) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class ParserGusb
