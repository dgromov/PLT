(* FILENAME :  ssanalyzer.ml
 * AUTHOR(s):  Joe Lee (jyl2157)
 * PURPOSE  :  Checks for type errors, undefined var/fxn errors, converts ast to sast.  
 *)

open Ast
open Sast

type t = 
    Void
  | Int 
  | Bool
  | Char 
  | String 
  | RelOp
  | Canvas

let string_of_t = function
    Void -> "Void"
  | Int -> "Int"
  | Bool -> "Bool"
  | Char -> "Char"
  | String -> "String"
  | RelOp -> "&&, ||, =, ~=, <, <=. >, >="
  | Canvas -> "Canvas"

module StringMap = Map.Make(String)

type fxn_env = {
  mutable local_env     : (Sast.expr_detail * t) StringMap.t;
  mutable ret_type      : (Sast.expr_detail * t);
  fxn_name              : string;
  fxn_params            : string list;
  fxn_body              : Ast.stmt list;
}

(* Translation environment *)
type env = {
  mutable global_env    : (Sast.expr_detail * t) StringMap.t;
  mutable fxn_envs      : fxn_env StringMap.t; 
}

exception TypeException of Ast.expr * Ast.expr * t * t
exception BinopException of Ast.op * Ast.expr * t    
exception UndefinedVarException of Ast.expr
exception UndefinedFxnException of string * Ast.expr

(* takes Ast program and runs static semantic analysis (type errors, etc..) *)
let semantic_checker (stmt_lst, func_decls) =

  (* Check an expr *)
  let rec expr env scope = function
      Ast.IntLiteral(i) -> 
        Sast.IntLiteral(i), Int 
    | Ast.StrLiteral(s) -> 
        Sast.StrLiteral(s), String
    | Ast.BoolLiteral(b) -> 
        Sast.BoolLiteral(b), Bool
    | Ast.Id(s) ->
        if scope <> "*global*"
        then 
          (try 
             let search_local = (StringMap.find s (StringMap.find scope env.fxn_envs).local_env) in
               search_local
           with Not_found -> 
             (try
                let search_global = StringMap.find s env.global_env in
                  search_global
              with Not_found ->
                raise (UndefinedVarException(Ast.Id(s)))))
        else
          (try
             let search_global = StringMap.find s env.global_env in
               search_global
           with Not_found ->
             raise (UndefinedVarException (Ast.Id(s))))
    | Ast.Binop(e1, op, e2) ->
        let (v1, t1) = expr env scope e1
        and (v2, t2) = expr env scope e2 in
          (match op with
               Ast.Plus ->
                 (match (t1, t2) with
                      (Int, Int) ->
                        Sast.Binop(e1, op, e2), Int
                    | (String, String) ->
                        Sast.Binop(e1, op, e2), String
                    | (_, _) ->
                        raise(TypeException(e2, Ast.Binop(e1, op, e2), t1, t2))
                 )
             | Ast.Minus | Ast.Times | Ast.Divide | Ast.Mod ->
                 (match (t1, t2) with
                      (Int, Int) ->
                        Sast.Binop(e1, op, e2), Int
                    | (_, _) ->
                        raise(TypeException(e2, Ast.Binop(e1, op, e2), Int, t2))
                 )
             | Ast.Eq | Ast.Neq | Ast.Lt | Ast.Gt | Ast.Leq | Ast.Geq ->
                 (match (t1, t2) with
                      (Int, Int) ->
                        Sast.Binop(e1, op, e2), Bool 
                    | (_, _) ->
                        raise(TypeException(e2, Ast.Binop(e1, op, e2), Int, t2))
                 )
             | Ast.Or | Ast.And ->
                 (match (t1, t2) with
                      (Bool, Bool) ->
                        Sast.Binop(e1, op, e2), Bool 
                    | (_, _) ->
                        raise(TypeException(e2, Ast.Binop(e1, op, e2), Bool, t2))
                 )
             | Ast.Mask -> 
                 Sast.Binop(e1, op, e2), Canvas (* need to do *)  
          );
    | Ast.Call(fname, actuals) ->
        (* no need to execute recursive calls *)
        if (scope <> "*global*") && (fname = scope)
        then
          (try 
             let fxn_env_lookup = (StringMap.find fname env.fxn_envs) in
               fxn_env_lookup.ret_type
           with Not_found ->
             raise (UndefinedFxnException (fname, Ast.Call(fname, actuals))))
        else
          (try
             (* first evaluate the actuals *)
             let res = (List.map (expr env scope) (List.rev actuals)) in
             let fxn_env_lookup = (StringMap.find fname env.fxn_envs) in
             let bindings = List.combine (List.rev fxn_env_lookup.fxn_params) res in
             let rec init_loc_env accum_env = function
                 [] -> accum_env
               | (param_name, (sast_elem, typ)) :: tail ->
                   init_loc_env (StringMap.add param_name (sast_elem, typ) accum_env) tail
             in
               (* Side effect: Initialize a local environment with the new parameter values *)
               fxn_env_lookup.local_env <- init_loc_env StringMap.empty bindings;
               (* execute the function_body, which will eventually
                * update the return type *)
               let _ = List.map (stmt env fxn_env_lookup.fxn_name) fxn_env_lookup.fxn_body
               in 
                 (* finally, return the possibly updated return type
                  *  (it is already initialized to (IntLiteral(0), Int)) *)
                 fxn_env_lookup.ret_type
           with Not_found ->
             raise (UndefinedFxnException (fname, Ast.Call(fname, actuals))))
    | Ast.Load(filepath_expr, gran_expr) ->
        let (v1, t1) = (expr env scope) filepath_expr
        and (v2, t2) = (expr env scope) gran_expr in
          if not (t1 = String)
          then 
            raise(TypeException(filepath_expr, Ast.Load(filepath_expr, gran_expr), String, t1))
          else 
            if not (t2 = Int)
            then
              raise(TypeException(gran_expr, Ast.Load(filepath_expr, gran_expr), Int, t2))
            else 
              Sast.Load(filepath_expr, gran_expr), Canvas
    | Ast.Blank(height, width, granularity) ->
        let (v1, t1) = (expr env scope) height
        and (v2, t2) = (expr env scope) width
        and (v3, t3) = (expr env scope) granularity 
        in
          (match (t1, t2, t3) with
               (Int, Int, Int) ->
                 Sast.Canvas, Canvas
             | (_, Int, Int) ->
                 raise(TypeException(height, Ast.Blank(height, width, granularity), Int, t1))
             | (Int, _, Int) ->
                 raise(TypeException(width, Ast.Blank(height, width, granularity), Int, t2))
             | (Int, Int, _) ->
                 raise(TypeException(granularity, Ast.Blank(height, width, granularity), Int, t3))
             | (_, _, _) ->
                 raise(TypeException(height, Ast.Blank(height, width, granularity), Int, t1))
          )
    | Ast.Select_Point (x, y) -> 
        let (v1, t1) = (expr env scope) x
        and (v2, t2) = (expr env scope) y
        in
          (match (t1, t2) with
               (Int, Int) ->
                 Sast.IntLiteral(1), Int
             | (Int, _) ->
                 raise(TypeException(y, Ast.Select_Point(x, y), Int, t2))
             | (_, _) ->
                 raise(TypeException(x, Ast.Select_Point(x, y), Int, t1))
          )
    | Ast.Select_Rect (x1, x2, y1, y2) -> 
        let (v1, t1) = (expr env scope) x1
        and (v2, t2) = (expr env scope) x2
        and (v3, t3) = (expr env scope) y1 
        and (v4, t4) = (expr env scope) y2 
        in
          (match (t1, t2, t3, t4) with
               (Int, Int, Int, Int) ->
                 Sast.Canvas, Canvas
             | (Int, Int, Int, _) ->
                 raise(TypeException(y2, Ast.Select_Rect(x1, x2, y1, y2), Int, t4))
             | (Int, Int, _, Int) ->
                 raise(TypeException(y1, Ast.Select_Rect(x1, x2, y1, y2), Int, t3))
             | (Int, _, Int, Int) ->
                 raise(TypeException(x2, Ast.Select_Rect(x1, x2, y1, y2), Int, t2))
             | (_, _, _, _) ->
                 raise(TypeException(x1, Ast.Select_Rect(x1, x2, y1, y2), Int, t1))
          )
    | Ast.Select_VSlice (x1, y1, y2)  -> 
        let (v1, t1) = (expr env scope) x1
        and (v2, t2) = (expr env scope) y1 
        and (v3, t3) = (expr env scope) y2 
        in
          (match (t1, t2, t3) with
               (Int, Int, Int) ->
                 Sast.Canvas, Canvas
             | (Int, Int, _) ->
                 raise(TypeException(y2, Ast.Select_VSlice(x1, y1, y2), Int, t3))
             | (Int, _, Int) ->
                 raise(TypeException(y1, Ast.Select_VSlice(x1, y1, y2), Int, t2))
             | (_, _, _) ->
                 raise(TypeException(x1, Ast.Select_VSlice(x1, y1, y2), Int, t1))
          )
    | Ast.Select_HSlice (x1, x2, y1) ->
        let (v1, t1) = (expr env scope) x1
        and (v2, t2) = (expr env scope) x2 
        and (v3, t3) = (expr env scope) y1 
        in
          (match (t1, t2, t3) with
               (Int, Int, Int) ->
                 Sast.Canvas, Canvas
             | (Int, Int, _) ->
                 raise(TypeException(y1, Ast.Select_HSlice(x1, x2, y1), Int, t3))
             | (Int, _, Int) ->
                 raise(TypeException(x2, Ast.Select_HSlice(x1, x2, y1), Int, t2))
             | (_, _, _) ->
                 raise(TypeException(x1, Ast.Select_HSlice(x1, x2, y1), Int, t1))
          )
    | Ast.Select_VSliceAll x ->
        let (v1, t1) = (expr env scope) x
        in
          (match t1 with
               Int ->
                 Sast.Canvas, Canvas
             | _ ->
                 raise(TypeException(x, Ast.Select_VSliceAll(x), Int, t1))
          )
    | Ast.Select_HSliceAll y ->
        let (v1, t1) = (expr env scope) y 
        in
          (match t1 with
               Int ->
                 Sast.Canvas, Canvas
             | _ ->
                 raise(TypeException(y, Ast.Select_HSliceAll(y), Int, t1))
          )
    | Ast.Select_All -> 
        Sast.Canvas, Canvas
    | Ast.Select (canv, selection) -> 
        let (v1, t1) = (expr env scope) canv 
        and (v2, t2) = (expr env scope) selection 
        in
          (match (t1, t2) with
               (Canvas, Canvas) | (Canvas, Int) ->
                 (v2, t2)
             | (Canvas, _) ->
                 raise(TypeException(selection, Ast.Select(canv, selection), Canvas, t2))
             | (_, _) ->
                 raise(TypeException(canv, Ast.Select(canv, selection), Canvas, t1))
          )
    | Ast.Select_Binop(op, e) -> 
        let (v1, t1) = (expr env scope) e
        in
          (match (op, t1) with
               (* op must be a relational operator *)
               (Ast.Eq, Int | Ast.Neq, Int | Ast.Lt, Int | Ast.Gt, Int 
                | Ast.Leq, Int | Ast.Geq, Int) ->
                 Sast.Canvas, Canvas
(*
             | (Ast.And, Bool | Ast.Or, Bool) ->
                 Sast.Canvas, Canvas
 *)
             | (Ast.Eq, _ | Ast.Neq, _ | Ast.Lt, _ | Ast.Gt, _ | Ast.Leq, _ | Ast.Geq, _) ->
                 raise(TypeException(e, Ast.Select_Binop(op, e), Int, t1))
(*
             | (Ast.And, _ | Ast.Or, _) ->
                 raise(TypeException(e, Ast.Select_Binop(op, e), Bool, t1))
 *)
             | (_, _) ->
                 raise(BinopException(op, Ast.Select_Binop(op, e), RelOp))
          )
    | Ast.Select_Bool(e) -> 
        (* e here is select_bool_expr which ultimately has type Canvas *)
        let (v1, t1) = (expr env scope) e
        in
          (match t1 with
               Canvas ->
                 Sast.Canvas, Canvas
             | _ ->
                 raise(TypeException(e, Ast.Select_Bool(e), Canvas, t1))
          )
    | Ast.Shift(canv, dir, count) ->
        let (v1, t1) = (expr env scope) canv 
        and (v2, t2) = (expr env scope) dir 
        and (v3, t3) = (expr env scope) count 
        in
          (match (t1, t2, t3) with
               (Canvas, Int, Int) ->
                 Sast.Canvas, Canvas
             | (Canvas, Int, _) ->
                 raise(TypeException(count, Ast.Shift(canv, dir, count), Int, t3))
             | (Canvas, _, Int) ->
                 raise(TypeException(dir, Ast.Shift(canv, dir, count), Int, t2))
             | (_, _, _) ->
                 raise(TypeException(canv, Ast.Shift(canv, dir, count), Canvas, t1))
          )
    | Ast.GetAttr(canv, attr) -> 
        let (v1, t1) = (expr env scope) canv in
          (match t1 with
               Canvas -> 
                 (match attr with 
                      Ast.W | Ast.H | Ast.G ->
                          Sast.IntLiteral(1), Int )
             | _ -> 
                 raise(TypeException(canv, Ast.GetAttr(canv, attr), Canvas, t1))
          )
  
  (* execute statement *)                              
  and stmt env scope = function
      Ast.Assign(var, e) -> 
        let ev = (expr env scope e) in
          if scope <> "*global*"
          then 
            (*
             * if we are in a function, variable lookup proceeds as:
             * 1) Check if the variable is a formal (parameter)
             * 2) Check if the variable is declared globally
             * 3) Finally if both 1 and 2 don't hold, create a new local
             *)
            (
              let f_env = (StringMap.find scope env.fxn_envs)
              in
                if (StringMap.mem var f_env.local_env)
                then 
                  f_env.local_env <- (StringMap.add var ev f_env.local_env)
                else 
                  if (StringMap.mem var env.global_env) 
                  then 
                    env.global_env <- (StringMap.add var ev env.global_env)
                  else 
                    f_env.local_env <- StringMap.add var ev f_env.local_env
            )
          else 
              env.global_env <- (StringMap.add var ev env.global_env)
    | Ast.OutputC(var, var_rend) ->
        let (var_val, var_typ) = expr env scope var
        and (var_rend_val, var_rend_typ) = expr env scope var_rend
        in 
        (match (var_typ, var_rend_typ) with
               (Canvas, Bool) ->
                 ();
             | (_, Bool ) ->
                  ( match var_rend with 
                      Ast.BoolLiteral(b) -> if b 
                                          then raise(TypeException(var_rend, var_rend, Bool, var_rend_typ))
                                          else ()
                    | _ -> raise(TypeException(var_rend, var_rend, Bool, var_rend_typ)) ) ;
             | (_, _) ->
                 raise(TypeException(var_rend, var_rend, Bool, var_rend_typ))
          );

    | Ast.OutputF(var, var_fname, var_rend) ->
        let (var_val, var_typ) = expr env scope var
        and (var_rend_val, var_rend_typ) = expr env scope var_rend
        (* and (var_fname_val, var_fname_typ) = expr env scope var_fname *)
        in
        (match (var_typ, var_rend_typ) with
               (Canvas, Bool) ->
                 ();
             | (_, Bool ) ->
                  ( match var_rend with 
                      Ast.BoolLiteral(b) -> if b 
                                          then raise(TypeException(var_rend, var_rend, Bool, var_rend_typ))
                                          else ()
                    | _ -> raise(TypeException(var_rend, var_rend, Bool, var_rend_typ)) ) ;
             | (_, _) ->
                 raise(TypeException(var_rend, var_rend, Bool, var_rend_typ))
          );
        
    | Ast.If(cond, stmt_lst) ->
        let (cond_val, cond_typ) = expr env scope cond in
          (match cond_typ with
               Bool ->
                 ();
             | _ ->
                 raise(TypeException(cond, cond, Bool, cond_typ))
          );
          (* regardless of the condition, check the statements *)
          List.iter (stmt env scope) stmt_lst;
          ();
    | Ast.If_else(cond, stmt_lst1, stmt_lst2) ->
        let (cond_val, cond_typ) = expr env scope cond in
          (match cond_typ with
               Bool -> ();
             | _ -> raise(TypeException(cond, cond, Bool, cond_typ))
          );
          (* regardless of the condition, check both blocks *)
          List.iter (stmt env scope) stmt_lst1;
          List.iter (stmt env scope) stmt_lst2;
          ();
    | Ast.For(s1, e1, s2, stmt_lst) ->
        (stmt env scope s1);
        let (e1_val, e1_typ) = (expr env scope e1)
        in 
          (match e1_typ with
               Bool -> ();
             | _ -> raise(TypeException(e1, e1, Bool, e1_typ))
          );
          (* we only need to check the statement body once *)
          List.iter (stmt env scope) stmt_lst;
          stmt env scope s2;
          ();
    | Ast.Return(e) ->
        let (v, typ) = expr env scope e 
        and fxn_env_lookup = StringMap.find scope env.fxn_envs
        in
          fxn_env_lookup.ret_type <- (v, typ);
    | Ast.Include(str) -> 
        (); (* no type checking needed since we know it's already a string *)
    | Ast.CanSet (canv, select_expr, set_expr) -> 
        let (v1, t1) = (expr env scope) canv
        and (v2, t2) = (expr env scope) select_expr
        and (v3, t3) = (expr env scope) set_expr
        in
         (match (t1, t2, t3) with
              (Canvas, Canvas, Int) ->
                ();
            | (Canvas, Int, Int) ->
                (); 
            | (Canvas, Canvas, _) ->
                raise(TypeException(set_expr, set_expr, Int, t3))
            | (Canvas, _, Int) ->
                raise(TypeException(select_expr, select_expr, Canvas, t2))
            | (_, _, _) ->
                raise(TypeException(canv, canv, Canvas, t1))
         )
  
  (************************ 
   * start main code here 
   ************************)  
  
  in let env = { 
    global_env    = StringMap.empty; 
    fxn_envs      = StringMap.empty; 
  } in

  let rec add_fxn accum_env = function
      [] -> accum_env
    | fxn_decl :: rest ->
        let f_env = 
          { 
            local_env  = StringMap.empty;
            ret_type   = (Sast.IntLiteral(0), Int); (* return 0 by default *)
            fxn_name   = fxn_decl.fname;
            fxn_params = fxn_decl.params;
            fxn_body   = fxn_decl.body;
          }
        in
          env.fxn_envs <- StringMap.add fxn_decl.fname f_env env.fxn_envs;
          add_fxn env rest
  in
  (* add func_decls to env.fxn_envs *) 
  let env = add_fxn env func_decls
  in
    (* execute the global statements *)
    List.iter (stmt env "*global*") stmt_lst;
    (* return the ast program unchanged for now - need to return sast.program
     * later *)
    (stmt_lst, func_decls)
