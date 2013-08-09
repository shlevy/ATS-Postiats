(*
** Implementation of
** a simple calculator in ATS for use in Java
*)

(* ****** ****** *)
//
// no run-time dynloading
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)

staload "../calculator.sats"

(* ****** ****** *)

local
//
#include "../calculator_aexp.dats"
#include "../calculator_token.dats"
#include "../calculator_cstream.dats"
#include "../calculator_tstream.dats"
#include "../calculator_parsing.dats"
#include "../calculator_print.dats"
//
in (*nothing*) end

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload JNI = "JNI/SATS/jni.sats"

(* ****** ****** *)

stadef JNIEnvPtr = $JNI.JNIEnvPtr
stadef jstring (l:addr) = $JNI.jstring(l)
stadef jobject (l:addr) = $JNI.jobject(l)

(* ****** ****** *)
//
// HX: helloFrom is declared in Java class [Hello]
//
extern
fun eval{l1,l2:addr}
(
  env: !JNIEnvPtr, obj: !jobject l1, inp: jstring l2
) : double = "ext#Java_Calculator_eval" // endfun

(* ****** ****** *)

implmnt eval
  (env, obj, inp) = let
//
val () = assertloc ($JNI.jstring2ptr(inp) > 0)
//
val (pf | inp2) = $JNI.GetStringUTFChars (env, inp)
val opt = aexp_parse_string ($UN.strptr2string(inp2))
val () = $JNI.ReleaseStringUTFChars (pf | env, inp, inp2)
//
in
//
case+ opt of
| ~Some_vt
    (ae) => aexp_eval (ae)
| ~None_vt ((*void*)) => let
    val (
    ) = $JNI.RaiseExceptionByClassName
      (env, "java/lang/IllegalArgumentException", "ParsingError")
    // end of [val]
  in
    0.0 (*deadcode*)
  end // end of [None_vt]
//
end (* end of [eval] *)

(* ****** ****** *)

%{$
//
// HX: This is ATS runtime:
//
#include "pats_ccomp_runtime.c"
#include "pats_ccomp_runtime2_dats.c"
#include "pats_ccomp_runtime_memalloc.c"
#include "pats_ccomp_runtime_trywith.c"
%}

(* ****** ****** *)

(* end of [Calculator.dats] *)
