OBJS = lexer.cmo parser.cmo interpreter.cmo 

interpreter : $(OBJS)
	ocamlc -o interpreter $(OBJS)

lexer.ml : lexer.mll
	ocamllex lexer.mll

parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

.PHONY : clean
clean :
	rm -rf *.cmo *.cmi interpreter parser.mli parser.ml lexer.ml

# generated by ocamldep *.ml *.mli
interpeter.cmo : parser.cmi lexer.cmo 
interpeter.cmx : parser.cmx lexer.cmx
lexer.cmo : parser.cmi
lexer.cmx : parser.cmx
parser.cmo : parser.cmi
parser.cmx : parser.cmi
parser.cmi :
