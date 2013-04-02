Cramer := hold(proc(A, l)
  name Cramer;
  local detA, k, n, solutions;
begin
  detA := linalg::det(A); 
  n := sqrt(nops(A)); 
  solutions := []; 
  for k from 1 to n do 
    solutions := [op(solutions), linalg::det(linalg::setCol(A, k, l))/detA]
  end_for; 
  return(solutions)
end_proc):

