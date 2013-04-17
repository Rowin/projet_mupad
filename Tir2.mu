Tir := hold(proc(A, B, C, D, x0, x1, y0, y1, nbre_points_sortie, precision\
, variable)
  name Tir;
  local i, y1_0, y1_1, var_a, var_b, a, b, y1_ab, w;
begin
  alias(y1_compute(z0, nbre_points) = RungeKutta(A, B, C, D, x0, x1, y0, z\
0, nbre_points, variable)[-1][2]); 
  y1_0 := y1_compute(0, 1); 
  y1_1 := y1_compute(1, 1); 
  if y1_0 < y1_1 then 
    if y1 < y1_0 then 
      var_a := 0; 
      var_b := -1
    else 
      if y1_0 < y1 then 
        var_a := 1; 
        var_b := 0
      else 
        var_a := 0; 
        var_b := 0
      end_if
    end_if
  else 
    if y1_1 < y1_0 then 
      if y1 < y1_0 then 
        var_a := 0; 
        var_b := 1
      else 
        if y1_0 < y1 then 
          var_a := -1; 
          var_b := 0
        else 
          var_a := 0; 
          var_b := 0
        end_if
      end_if
    end_if
  end_if; 
  a := 0; 
  b := 0; 
  while y1_compute(a, 1) < y1 do
    a := a + var_a
  end_while; 
  while y1 < y1_compute(b, 1) do
    b := b + var_b
  end_while; 
  y1_ab := y1_compute((a + b)/2, 10); 
  w := abs((y1_ab - y1)/y1); 
  repeat 
    if y1 <= y1_ab then 
      a := (a + b)/2
    else 
      if y1_ab <= y1 then 
        b := (a + b)/2
      end_if
    end_if; 
    y1_ab := y1_compute((a + b)/2, round(100/w + 1)); 
    w := abs((y1_ab - y1)/y1); 
    print(w)
  until w <= precision end_repeat; 
  return((a + b)/2, RungeKutta(A, B, C, D, x0, x1, y0, (a + b)/2, nbre_poi\
nts_sortie, variable))
end_proc):

