RK := hold(proc(f, g, a, b, y0, z0, r)
  name RK;
  local h, yz, i, k1, k2, k3, k4, l1, l2, l3, l4, k, l;
begin
  h := (b - a)/r; 
  yz := [[a, y0, z0]]; 
  for i from float(a + h) to float(b) step float(h) do 
    k1 := float(h*f(yz[-1][1], yz[-1][2], yz[-1][3])); 
    l1 := float(h*g(yz[-1][1], yz[-1][2], yz[-1][3])); 
    k2 := float(h*f(yz[-1][1] + h/2, yz[-1][2] + k1/2, yz[-1][3] + l1/2)); 
    l2 := float(h*g(yz[-1][1] + h/2, yz[-1][2] + k1/2, yz[-1][3] + l1/2)); 
    k3 := float(h*f(yz[-1][1] + h/2, yz[-1][2] + k2/2, yz[-1][3] + l2/2)); 
    l3 := float(h*g(yz[-1][1] + h/2, yz[-1][2] + k2/2, yz[-1][3] + l2/2)); 
    k4 := float(h*f(yz[-1][1] + h, yz[-1][2] + k3, yz[-1][3] + l3)); 
    l4 := float(h*g(yz[-1][1] + h, yz[-1][2] + k3, yz[-1][3] + l3)); 
    k := float(1/6*(k1 + 2*k2 + 2*k3 + k4)); 
    l := float(1/6*(l1 + 2*l2 + 2*l3 + l4)); 
    yz := [op(yz), [yz[-1][1] + h, yz[-1][2] + k, yz[-1][3] + l]]
  end_for; 
  return(yz)
end_proc):

