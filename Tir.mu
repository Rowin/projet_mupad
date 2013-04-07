Tir := hold(proc(f, g, x0, x1, y0, y1, p)
  name Tir;
  local a, b, ha, hb, w, f0, f1, fab, fonction, derivee, points;
begin
  a := 0; 
  b := 0; 
  f0 := RK(f, g, x0, x1, y0, 0, 1)[-1][2]; 
  f1 := RK(f, g, x0, x1, y0, 1, 1)[-1][2]; 
  if f0 < f1 and f0 < y1 then 
    ha := 1; 
    hb := 0
  else 
    if f0 < f1 and y1 < f0 then 
      ha := 0; 
      hb := -1
    else 
      if f1 < f0 and f0 < y1 then 
        ha := -1; 
        hb := 0
      else 
        if f1 < f0 and y1 < f0 then 
          ha := 0; 
          hb := 1
        else 
          if f0 = Dom::Float(y1) then 
            ha := 0; 
            hb := 0
          end_if
        end_if
      end_if
    end_if
  end_if; 
  while RK(f, g, x0, x1, y0, a, 1)[-1][2] < y1 do
    a := a + ha
  end_while; 
  while y1 < RK(f, g, x0, x1, y0, b, 1)[-1][2] do
    b := b + hb
  end_while; 
  fab := RK(f, g, x0, x1, y0, (a + b)/2, 100)[-1][2]; 
  repeat 
    if y1 < fab then 
      a := float((a + b)/2)
    else 
      if fab < y1 then 
        b := float((a + b)/2)
      end_if
    end_if; 
    fab := RK(f, g, x0, x1, y0, (a + b)/2, 100)[-1][2]; 
    w := abs(fab - y1)/abs(y1); 
    print(w)
  until w <= p end_repeat; 
  fonction := []; 
  derivee := []; 
  points := RK(f, g, x0, x1, y0, (a + b)/2, 100); 
  for i from 1 to nops(points) do 
    fonction := [op(fonction), [points[i][1], points[i][2]]]; 
    derivee := [op(derivee), [points[i][1], points[i][3]]]
  end_for; 
  return((a + b)/2, fonction, derivee)
end_proc):

