(* File: Ast.ml   *)
(*                *)

type op = Plus | Minus | Times | Divide | Mod 
               | And | Or | Lt | Gt | Eq | Leq | Geq | Neq | Mask

type expr =                                 (* Expressions *)
    IntLiteral of int                       (* 42 *)
  | StrLiteral of string                    (* "this is a string" *)
  | BoolLiteral of bool                     (* true *)
  | Id of string                            (* foo *)
  | Binop of expr * op * expr               (* a + b *)
  | Call of string * expr list              (* foo(1, 25) *)


type stmt =                                 (* Statements *)
    Assign of string * expr                 (* foo <- 42 *)
  | OutputC of expr                         (* canvas -> out *)
  | OutputF of string                       (* canvas -> "C:\test.png" *)
  | If of expr * stmt list                  (* if (foo = 42) {} *)
  | If_else of expr * stmt list * stmt list (* if (foo = 42) {} else {} *)
  | For of stmt * expr * stmt * stmt list   (* for i <- 0 | i < 10 | i <- i + 1 { ... } *)
  | Return of expr                          (* return 42; *)

type func_decl = {
  fname : string;                           (* Name of the function *)
  args : string list;                       (* Formal argument names *)
  locals : string list;                     (* Locally defined variables *)
  body : stmt list;
}

type program = stmt list (* * func_decl list (* global vars, funcs *)  *)
