open Test

let f i l =
  let file = Fmt.strf "re_set_%i.csv" i in
  let n = 
    L.gen sigma l
    |> Test.measure_until
      ~limit:(Mtime.Span.of_uint64_ns (5_000_000_000L))
      ~interval:20
      file
  in
  Gc.full_major ();
  Fmt.pr "Re %i: %i elements@." i n

let () =
  Array.iteri f langs
