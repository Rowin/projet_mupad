RungeKutta := hold(proc(A, B, C, D, x0, x1, y0, z0, nbre_points, variable)
  name RungeKutta;
  local f, g, pas, yz, i, x, k1, k2, k3, k4, l1, l2, l3, l4, k, l, points;
begin
  A := fp::unapply(A, variable); 
  B := fp::unapply(B, variable); 
  C := fp::unapply(C, variable); 
  D := fp::unapply(D, variable); 
  f := (variable, y, z) -> z(variable); 
  g := (variable, y, z) -> ((- (B/A)*z(variable)) - (C/A)*y(variable)) - D\
/A; 
  pas := float((x1 - x0)/(nbre_points + 1)); 
  yz := [[x0, y0, z0]]; 
  i := 1; 
  for x from x0 + pas to x1 step pas do 
    i := i + 1; 
    k1 := float(pas*f(yz[-1][1], yz[-1][2], yz[-1][3])); 
    l1 := float(pas*g(yz[-1][1], yz[-1][2], yz[-1][3])); 
    k2 := float(pas*f(yz[-1][1] + pas/2, yz[-1][2] + k1/2, yz[-1][3] + l1/\
2)); 
    l2 := float(pas*g(yz[-1][1] + pas/2, yz[-1][2] + k1/2, yz[-1][3] + l1/\
2)); 
    k3 := float(pas*f(yz[-1][1] + pas/2, yz[-1][2] + k2/2, yz[-1][3] + l2/\
2)); 
    l3 := float(pas*g(yz[-1][1] + pas/2, yz[-1][2] + k2/2, yz[-1][3] + l2/\
2)); 
    k4 := float(pas*f(yz[-1][1] + pas, yz[-1][2] + k3, yz[-1][3] + l3)); 
    l4 := float(pas*g(yz[-1][1] + pas, yz[-1][2] + k3, yz[-1][3] + l3)); 
    k := float(1/6*(k1 + 2*k2 + 2*k3 + k4)); 
    l := float(1/6*(l1 + 2*l2 + 2*l3 + l4)); 
    yz := [op(yz), [yz[-1][1] + pas, yz[-1][2] + k, yz[-1][3] + l]]
  end_for; 
  points := []; 
  for i from 1 to nops(yz) do 
    points := [op(points), [yz[i][1], yz[i][2]]]
  end_for; 
  return(points)
end_proc):

