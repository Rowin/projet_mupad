Cramer := hold(proc(A, l)
  name Cramer;
  local detA, k, n, solutions;
begin
  detA := float(numeric::det(A)); 
  n := sqrt(nops(A)); 
  solutions := []; 
  for k from 1 to n do 
    solutions := [op(solutions), float(numeric::det(linalg::setCol(A, k, l))/de\
tA)]
  end_for; 
  return(solutions)
end_proc):

