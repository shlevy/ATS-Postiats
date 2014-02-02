(* ****** ****** *)
//
// API in ATS for SDL2
//
(* ****** ****** *)

(*
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi (gmhwxiDOTgmailDOTcom)
*)

(* ****** ****** *)

%{#
//
#include "SDL2/CATS/SDL.cats"
//
%} // end of [%{#]

(* ****** ****** *)

#define ATS_PACKNAME "ATSCNTRB.SDL2" // package name
#define ATS_EXTERN_PREFIX "atscntrb_SDL2_" // prefix for external names"

(* ****** ****** *)

typedef Uint8 = uint8
typedef Uint16 = uint16
typedef Uint32 = uint32

(* ****** ****** *)

#include "./SDL_version.sats"

(* ****** ****** *)

fun SDL_Init(flags: Uint32): int = "mac#%"

(* ****** ****** *)

fun SDL_Init(flags: Uint32): int = "mac#%"
fun SDL_InitSubSystem (flags: Uint32): int = "mac#%"

(* ****** ****** *)

fun SDL_Quit ((*void*)): void = "mac#%"
fun SDL_QuitSubSystem (flags: Uint32): void = "mac#%"

(* ****** ****** *)

fun SDL_WasInit (flags: Uint32): Uint32 = "mac#%"

(* ****** ****** *)

(* end of [SDL.sats] *)