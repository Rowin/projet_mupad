Differenciation := hold(proc(A, B, C, D, x0, x1, y0, y1, r, variable)
  name Differenciation;
  local pas, i, k, listeA, listeD, matA;
begin
  pas := (x1 - x0)/(r + 1); 
  A := fp::unapply(A, variable); 
  B := fp::unapply(B, variable); 
  C := fp::unapply(C, variable); 
  D := fp::unapply(D, variable); 
  a := A/pas^2 - (B/2)*pas; 
  b := C - (2*A)/pas^2; 
  c := A/pas^2 + (B/2)*pas; 
  listeA := []; 
  listeD := []; 
  k := 0; 
  for i from x0 + pas to x1 - pas step pas do 
    k := k + 1; 
    listeA := [op(listeA), [0*j $ j = 1..k - 1, a(i), b(i), c(i), 0*j $ j = k +\
 3..r]]; 
    if i = x0 + pas then 
      listeD := [op(listeD), D(i) - a(x0)*y0]
    else 
      if i = x1 - pas then 
        listeD := [op(listeD), D(i) - c(i)*y1]
      else 
        listeD := [op(listeD), D(i)]
      end_if
    end_if
  end_for; 
  matA := linalg::delCol(linalg::delCol(matrix(listeA), r + 2), 1); 
  matD := matrix(listeD); 
  return(matA, matD)
end_proc):

