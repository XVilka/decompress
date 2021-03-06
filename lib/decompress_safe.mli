module Buffer = Decompress_buffer

type ro = [`Rd]
type wo = [`Wr]
type ('a, 'i) t = private 'i constraint 'a = [< `Rd | `Wr]

val rw : 'i Buffer.t -> 'i -> ([ro | wo], 'i) t
val ro : 'i Buffer.t -> 'i -> (ro, 'i) t
val wo : 'i Buffer.t -> 'i -> (wo, 'i) t
val length : 'i Buffer.t -> ('a, 'i) t -> int
val get : 'i Buffer.t -> ([> ro], 'i) t -> int -> char
val set : 'i Buffer.t -> ([> wo], 'i) t -> int -> char -> unit
val get_16 : 'i Buffer.t -> ([> ro], 'i) t -> int -> int
val get_32 : 'i Buffer.t -> ([> ro], 'i) t -> int -> int32
val get_64 : 'i Buffer.t -> ([> ro], 'i) t -> int -> int64
val sub_ro : 'i Buffer.t -> ([> ro], 'i) t -> int -> int -> (ro, 'i) t
val sub_rw : 'i Buffer.t -> ([> ro], 'i) t -> int -> int -> ([ro | wo], 'i) t
val fill : 'i Buffer.t -> ([> wo], 'i) t -> int -> int -> char -> unit
val of_string : string -> (ro, string) t

val blit :
  'i Buffer.t -> ([> ro], 'i) t -> int -> ([> wo], 'i) t -> int -> int -> unit

val blit2 :
     'i Buffer.t
  -> ([> ro], 'i) t
  -> int
  -> ([> wo], 'i) t
  -> int
  -> ([> wo], 'i) t
  -> int
  -> int
  -> unit

val blit_string :
  'a Buffer.t -> ([> ro], string) t -> int -> ([> wo], 'a) t -> int -> int -> unit

val pp : 'i Buffer.t -> Format.formatter -> ([> ro], 'i) t -> unit
val to_string : 'i Buffer.t -> ([> ro], 'i) t -> string

val adler32 :
     'i Buffer.t
  -> ([> ro], 'i) t
  -> int
  -> int
  -> Checkseum.Adler32.t
  -> Checkseum.Adler32.t

val crc32 :
     'i Buffer.t
  -> ([> ro], 'i) t
  -> int
  -> int
  -> Checkseum.Crc32.t
  -> Checkseum.Crc32.t

val unsafe : ('a, 'i) t -> 'i
