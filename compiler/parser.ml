type token =
  | INTLITERAL of (int)
  | BOOLLITERAL of (bool)
  | ID of (string)
  | CMP of (string)
  | STR of (string)
  | TRUE
  | FALSE
  | AND
  | OR
  | COMMA
  | SEMICOLON
  | COLON
  | LBRACKET
  | RBRACKET
  | LPAREN
  | RPAREN
  | EOL
  | LT
  | GT
  | EQ
  | LEQ
  | GEQ
  | NEQ
  | NEGATE
  | ATTR
  | MASK
  | IF
  | ELSE
  | FOR
  | FOR_SEP
  | INCLUDE
  | RETURN
  | LBRACE
  | RBRACE
  | FXN
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | MOD
  | ASSIGN
  | OUTPUT
  | ATTR_W
  | ATTR_H
  | ATTR_G
  | STDOUT
  | MAIN
  | BLANK
  | LOAD
  | MAP
  | SHIFT
  | INT
  | BOOL
  | CANVAS

open Parsing;;
let _ = parse_error;;
# 5 "parser.mly"
 open Ast 
# 62 "parser.ml"
let yytransl_const = [|
  262 (* TRUE *);
  263 (* FALSE *);
  264 (* AND *);
  265 (* OR *);
  266 (* COMMA *);
  267 (* SEMICOLON *);
  268 (* COLON *);
  269 (* LBRACKET *);
  270 (* RBRACKET *);
  271 (* LPAREN *);
  272 (* RPAREN *);
  273 (* EOL *);
  274 (* LT *);
  275 (* GT *);
  276 (* EQ *);
  277 (* LEQ *);
  278 (* GEQ *);
  279 (* NEQ *);
  280 (* NEGATE *);
  281 (* ATTR *);
  282 (* MASK *);
  283 (* IF *);
  284 (* ELSE *);
  285 (* FOR *);
  286 (* FOR_SEP *);
  287 (* INCLUDE *);
  288 (* RETURN *);
  289 (* LBRACE *);
  290 (* RBRACE *);
  291 (* FXN *);
  292 (* PLUS *);
  293 (* MINUS *);
  294 (* TIMES *);
  295 (* DIVIDE *);
  296 (* MOD *);
  297 (* ASSIGN *);
  298 (* OUTPUT *);
  299 (* ATTR_W *);
  300 (* ATTR_H *);
  301 (* ATTR_G *);
  302 (* STDOUT *);
  303 (* MAIN *);
  304 (* BLANK *);
  305 (* LOAD *);
  306 (* MAP *);
  307 (* SHIFT *);
  308 (* INT *);
  309 (* BOOL *);
  310 (* CANVAS *);
    0|]

let yytransl_block = [|
  257 (* INTLITERAL *);
  258 (* BOOLLITERAL *);
  259 (* ID *);
  260 (* CMP *);
  261 (* STR *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\003\000\004\000\004\000\007\000\007\000\
\005\000\005\000\002\000\006\000\006\000\008\000\008\000\008\000\
\008\000\008\000\008\000\008\000\010\000\011\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\012\000\012\000\013\000\013\000\014\000\000\000"

let yylen = "\002\000\
\000\000\002\000\002\000\008\000\000\000\001\000\001\000\003\000\
\000\000\002\000\002\000\000\000\002\000\004\000\004\000\004\000\
\007\000\011\000\009\000\003\000\003\000\001\000\001\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\004\000\
\003\000\000\000\001\000\001\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\002\000\003\000\011\000\000\000\
\007\000\000\000\000\000\000\000\000\000\009\000\008\000\000\000\
\000\000\010\000\000\000\000\000\000\000\000\000\000\000\004\000\
\013\000\000\000\000\000\000\000\000\000\000\000\023\000\024\000\
\000\000\025\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\014\000\016\000\015\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\041\000\039\000\038\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\040\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\019\000\000\000\
\018\000"

let yydgoto = "\002\000\
\003\000\005\000\006\000\010\000\016\000\019\000\011\000\025\000\
\036\000\030\000\065\000\067\000\068\000\000\000"

let yysindex = "\009\000\
\000\000\000\000\018\255\038\255\000\000\000\000\000\000\051\255\
\000\000\058\255\002\255\042\255\074\255\000\000\000\000\092\255\
\102\255\000\000\049\255\009\255\106\255\120\255\003\255\000\000\
\000\000\003\255\252\254\003\255\083\255\098\255\000\000\000\000\
\111\255\000\000\003\255\048\255\071\255\127\255\134\255\096\255\
\003\255\003\255\003\255\121\255\003\255\003\255\000\000\003\255\
\003\255\003\255\003\255\003\255\003\255\003\255\003\255\003\255\
\003\255\003\255\000\000\000\000\000\000\113\255\144\255\144\255\
\101\255\144\255\131\255\138\255\000\000\000\000\000\000\030\255\
\030\255\249\255\030\255\030\255\249\255\167\255\167\255\218\255\
\218\255\218\255\070\255\120\255\000\000\003\255\115\255\117\255\
\144\255\123\255\070\255\122\255\135\255\070\255\000\000\136\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\154\000\000\000\000\000\000\000\000\000\140\255\
\000\000\000\000\152\255\000\000\000\000\000\000\000\000\093\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\025\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\155\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\007\255\142\255\
\000\000\253\254\000\000\157\255\000\000\000\000\000\000\181\255\
\212\255\049\000\243\255\018\000\060\000\144\000\146\000\091\000\
\102\000\133\000\000\000\000\000\000\000\000\000\000\000\000\000\
\090\255\069\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\158\000\000\000\000\000\000\000\000\000\000\000\176\255\
\230\255\093\000\000\000\000\000\000\000\000\000"

let yytablesize = 439
let yytable = "\037\000\
\038\000\040\000\087\000\031\000\032\000\033\000\044\000\034\000\
\044\000\001\000\093\000\013\000\044\000\096\000\063\000\064\000\
\066\000\035\000\070\000\071\000\004\000\072\000\073\000\074\000\
\075\000\076\000\077\000\078\000\079\000\080\000\081\000\082\000\
\026\000\026\000\026\000\026\000\021\000\045\000\046\000\021\000\
\026\000\039\000\026\000\026\000\026\000\026\000\026\000\026\000\
\007\000\026\000\027\000\020\000\008\000\009\000\026\000\045\000\
\046\000\026\000\047\000\089\000\026\000\026\000\026\000\026\000\
\026\000\048\000\049\000\050\000\051\000\052\000\053\000\017\000\
\020\000\012\000\014\000\021\000\015\000\022\000\045\000\046\000\
\023\000\059\000\024\000\054\000\055\000\056\000\057\000\058\000\
\048\000\049\000\050\000\051\000\052\000\053\000\017\000\017\000\
\021\000\017\000\022\000\045\000\017\000\023\000\017\000\045\000\
\046\000\045\000\054\000\055\000\056\000\057\000\058\000\062\000\
\007\000\048\000\049\000\050\000\051\000\052\000\053\000\012\000\
\028\000\012\000\029\000\041\000\012\000\043\000\012\000\042\000\
\045\000\046\000\084\000\054\000\055\000\056\000\057\000\058\000\
\069\000\060\000\048\000\049\000\050\000\051\000\052\000\053\000\
\061\000\083\000\085\000\086\000\090\000\091\000\092\000\045\000\
\046\000\047\000\094\000\005\000\054\000\055\000\056\000\057\000\
\058\000\048\000\049\000\050\000\051\000\052\000\053\000\006\000\
\095\000\097\000\042\000\022\000\043\000\018\000\045\000\046\000\
\088\000\000\000\000\000\054\000\055\000\056\000\057\000\058\000\
\048\000\049\000\050\000\051\000\052\000\053\000\034\000\034\000\
\000\000\000\000\000\000\000\000\034\000\000\000\034\000\034\000\
\034\000\034\000\034\000\034\000\056\000\057\000\058\000\000\000\
\000\000\000\000\034\000\000\000\000\000\034\000\000\000\000\000\
\034\000\034\000\034\000\034\000\034\000\035\000\035\000\000\000\
\000\000\045\000\046\000\035\000\000\000\035\000\035\000\035\000\
\035\000\035\000\035\000\048\000\049\000\050\000\051\000\052\000\
\053\000\035\000\000\000\000\000\035\000\000\000\000\000\035\000\
\035\000\035\000\035\000\035\000\036\000\036\000\000\000\000\000\
\045\000\046\000\036\000\000\000\036\000\036\000\036\000\036\000\
\036\000\036\000\048\000\049\000\000\000\051\000\052\000\000\000\
\036\000\000\000\000\000\036\000\000\000\000\000\036\000\036\000\
\036\000\036\000\036\000\037\000\037\000\000\000\000\000\000\000\
\000\000\037\000\000\000\037\000\037\000\037\000\037\000\037\000\
\037\000\000\000\000\000\000\000\000\000\000\000\000\000\037\000\
\000\000\000\000\037\000\000\000\000\000\037\000\037\000\037\000\
\037\000\037\000\032\000\032\000\000\000\000\000\000\000\000\000\
\032\000\000\000\000\000\000\000\032\000\033\000\033\000\032\000\
\000\000\000\000\000\000\033\000\000\000\000\000\032\000\033\000\
\000\000\032\000\033\000\000\000\032\000\032\000\032\000\032\000\
\032\000\033\000\000\000\000\000\033\000\000\000\000\000\033\000\
\033\000\033\000\033\000\033\000\029\000\029\000\000\000\000\000\
\000\000\000\000\029\000\000\000\000\000\000\000\000\000\030\000\
\030\000\000\000\000\000\000\000\000\000\030\000\000\000\000\000\
\029\000\000\000\000\000\029\000\000\000\000\000\029\000\029\000\
\029\000\029\000\029\000\030\000\000\000\000\000\030\000\000\000\
\000\000\030\000\030\000\030\000\030\000\030\000\031\000\031\000\
\000\000\000\000\000\000\000\000\031\000\000\000\000\000\000\000\
\000\000\027\000\027\000\028\000\028\000\000\000\000\000\027\000\
\000\000\028\000\031\000\000\000\000\000\031\000\000\000\000\000\
\031\000\031\000\031\000\031\000\031\000\027\000\000\000\028\000\
\027\000\000\000\028\000\027\000\027\000\028\000\028\000"

let yycheck = "\026\000\
\005\001\028\000\083\000\001\001\002\001\003\001\010\001\005\001\
\035\000\001\000\091\000\010\001\016\001\094\000\041\000\042\000\
\043\000\015\001\045\000\046\000\003\001\048\000\049\000\050\000\
\051\000\052\000\053\000\054\000\055\000\056\000\057\000\058\000\
\008\001\009\001\010\001\011\001\030\001\008\001\009\001\033\001\
\016\001\046\001\018\001\019\001\020\001\021\001\022\001\023\001\
\011\001\041\001\042\001\003\001\015\001\003\001\030\001\008\001\
\009\001\033\001\011\001\086\000\036\001\037\001\038\001\039\001\
\040\001\018\001\019\001\020\001\021\001\022\001\023\001\003\001\
\003\001\016\001\033\001\027\001\003\001\029\001\008\001\009\001\
\032\001\011\001\034\001\036\001\037\001\038\001\039\001\040\001\
\018\001\019\001\020\001\021\001\022\001\023\001\003\001\027\001\
\027\001\029\001\029\001\010\001\032\001\032\001\034\001\008\001\
\009\001\016\001\036\001\037\001\038\001\039\001\040\001\016\001\
\011\001\018\001\019\001\020\001\021\001\022\001\023\001\027\001\
\015\001\029\001\003\001\041\001\032\001\015\001\034\001\030\001\
\008\001\009\001\030\001\036\001\037\001\038\001\039\001\040\001\
\016\001\011\001\018\001\019\001\020\001\021\001\022\001\023\001\
\011\001\033\001\016\001\010\001\034\001\033\001\028\001\008\001\
\009\001\000\000\033\001\016\001\036\001\037\001\038\001\039\001\
\040\001\018\001\019\001\020\001\021\001\022\001\023\001\016\001\
\034\001\034\001\016\001\030\001\016\001\016\000\008\001\009\001\
\084\000\255\255\255\255\036\001\037\001\038\001\039\001\040\001\
\018\001\019\001\020\001\021\001\022\001\023\001\010\001\011\001\
\255\255\255\255\255\255\255\255\016\001\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\038\001\039\001\040\001\255\255\
\255\255\255\255\030\001\255\255\255\255\033\001\255\255\255\255\
\036\001\037\001\038\001\039\001\040\001\010\001\011\001\255\255\
\255\255\008\001\009\001\016\001\255\255\018\001\019\001\020\001\
\021\001\022\001\023\001\018\001\019\001\020\001\021\001\022\001\
\023\001\030\001\255\255\255\255\033\001\255\255\255\255\036\001\
\037\001\038\001\039\001\040\001\010\001\011\001\255\255\255\255\
\008\001\009\001\016\001\255\255\018\001\019\001\020\001\021\001\
\022\001\023\001\018\001\019\001\255\255\021\001\022\001\255\255\
\030\001\255\255\255\255\033\001\255\255\255\255\036\001\037\001\
\038\001\039\001\040\001\010\001\011\001\255\255\255\255\255\255\
\255\255\016\001\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\255\255\255\255\255\255\255\255\255\255\255\255\030\001\
\255\255\255\255\033\001\255\255\255\255\036\001\037\001\038\001\
\039\001\040\001\010\001\011\001\255\255\255\255\255\255\255\255\
\016\001\255\255\255\255\255\255\020\001\010\001\011\001\023\001\
\255\255\255\255\255\255\016\001\255\255\255\255\030\001\020\001\
\255\255\033\001\023\001\255\255\036\001\037\001\038\001\039\001\
\040\001\030\001\255\255\255\255\033\001\255\255\255\255\036\001\
\037\001\038\001\039\001\040\001\010\001\011\001\255\255\255\255\
\255\255\255\255\016\001\255\255\255\255\255\255\255\255\010\001\
\011\001\255\255\255\255\255\255\255\255\016\001\255\255\255\255\
\030\001\255\255\255\255\033\001\255\255\255\255\036\001\037\001\
\038\001\039\001\040\001\030\001\255\255\255\255\033\001\255\255\
\255\255\036\001\037\001\038\001\039\001\040\001\010\001\011\001\
\255\255\255\255\255\255\255\255\016\001\255\255\255\255\255\255\
\255\255\010\001\011\001\010\001\011\001\255\255\255\255\016\001\
\255\255\016\001\030\001\255\255\255\255\033\001\255\255\255\255\
\036\001\037\001\038\001\039\001\040\001\030\001\255\255\030\001\
\033\001\255\255\033\001\036\001\037\001\036\001\037\001"

let yynames_const = "\
  TRUE\000\
  FALSE\000\
  AND\000\
  OR\000\
  COMMA\000\
  SEMICOLON\000\
  COLON\000\
  LBRACKET\000\
  RBRACKET\000\
  LPAREN\000\
  RPAREN\000\
  EOL\000\
  LT\000\
  GT\000\
  EQ\000\
  LEQ\000\
  GEQ\000\
  NEQ\000\
  NEGATE\000\
  ATTR\000\
  MASK\000\
  IF\000\
  ELSE\000\
  FOR\000\
  FOR_SEP\000\
  INCLUDE\000\
  RETURN\000\
  LBRACE\000\
  RBRACE\000\
  FXN\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  MOD\000\
  ASSIGN\000\
  OUTPUT\000\
  ATTR_W\000\
  ATTR_H\000\
  ATTR_G\000\
  STDOUT\000\
  MAIN\000\
  BLANK\000\
  LOAD\000\
  MAP\000\
  SHIFT\000\
  INT\000\
  BOOL\000\
  CANVAS\000\
  "

let yynames_block = "\
  INTLITERAL\000\
  BOOLLITERAL\000\
  ID\000\
  CMP\000\
  STR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "parser.mly"
                                  ( [],[] )
# 373 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 38 "parser.mly"
                        ( (_2 :: fst _1), snd _1 )
# 381 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 39 "parser.mly"
                        ( fst _1, (_2 :: snd _1) )
# 389 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 43 "parser.mly"
    ( { fname = _1;
					formals = _3;
					locals = List.rev _6;
					body = List.rev _7 } )
# 402 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
                ( [] )
# 408 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 51 "parser.mly"
                ( List.rev(_1) )
# 415 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 53 "parser.mly"
        ( [_1] )
# 422 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 54 "parser.mly"
                         ( _3 :: _1 )
# 430 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "parser.mly"
                ( [] )
# 436 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 58 "parser.mly"
                     ( _2 :: _1 )
# 444 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 60 "parser.mly"
               ( _1 )
# 451 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
                   ( [] )
# 457 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 65 "parser.mly"
                     ( _2 :: _1 )
# 465 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 68 "parser.mly"
                                       ( Assign(_1, _3) )
# 473 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    Obj.repr(
# 69 "parser.mly"
                                       ( OutputC(_1) )
# 480 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 70 "parser.mly"
                                       ( OutputF(_1) )
# 488 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 71 "parser.mly"
                                                                ( If(_3, _6, Block([])) )
# 496 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 8 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 5 : 'stmt) in
    let _10 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 72 "parser.mly"
                                                                             ( If(_3, _6, _10) )
# 505 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : 'for_stmt) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'expr_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 3 : 'for_stmt) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 73 "parser.mly"
                                                                            ( For(_2, _4, _6, _8) )
# 515 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
                                    ( Return(_2) )
# 522 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                       ( Assign(_1, _3) )
# 530 "parser.ml"
               : 'for_stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                                        ( _1 )
# 537 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 86 "parser.mly"
                                          ( IntLiteral(_1) )
# 544 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 87 "parser.mly"
                         ( BoolLiteral(_1))
# 551 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 88 "parser.mly"
                                          ( StrLiteral(_1) )
# 558 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 89 "parser.mly"
                                          ( Id(_1) )
# 565 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                                          ( Binop(_1, Plus, _3) )
# 573 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "parser.mly"
                                          ( Binop(_1, Minus, _3) )
# 581 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
                                          ( Binop(_1, Times, _3) )
# 589 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "parser.mly"
                                          ( Binop(_1, Divide, _3) )
# 597 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
                                          ( Binop(_1, Mod, _3) )
# 605 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                                          ( Binop(_1, Eq, _3) )
# 613 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                                          ( Binop(_1, Neq, _3) )
# 621 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                                          ( Binop(_1, Lt, _3) )
# 629 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "parser.mly"
                                          ( Binop(_1, Gt, _3) )
# 637 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                                          ( Binop(_1, Leq, _3) )
# 645 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                                          ( Binop(_1, Geq, _3) )
# 653 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                                          ( Binop(_1, Or, _3) )
# 661 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 102 "parser.mly"
                                          ( Binop(_1, And, _3) )
# 669 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 103 "parser.mly"
                                        ( Call(_1, _3) )
# 677 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 104 "parser.mly"
                              ( _2 )
# 684 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 109 "parser.mly"
                ( [] )
# 690 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 110 "parser.mly"
                 ( List.rev _1 )
# 697 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "parser.mly"
       ( [_1] )
# 704 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "parser.mly"
                            ( _3 :: _1 )
# 712 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 117 "parser.mly"
                                ("include [filepath]")
# 719 "parser.ml"
               : 'include_stmt))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)