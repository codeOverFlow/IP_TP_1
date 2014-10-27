# var and param
	param n;
	set N := 1..n;

	param p{N};
	param f{N};
	param d{N};
	param h{N};
	
	var x{N}, integer, >= 0;
	var s{N}, integer, >= 0;
	var y{N}, <= 1, >= 0;
	var w{N,N}, >= 0;

# objective
	minimize z : sum{t in N}(p[t]*x[t] + h[t]*s[t] + f[t]*y[t]);

	s.t. c1{j in N}: sum{i in 1..j}(w[i,j]) = d[j];
	s.t. c2{i in N, j in i..n}: w[i,j] <= d[j]*y[i];
	s.t. c3{i in N}: x[i] = sum{j in i..n}(w[i,j]);
	s.t. c4: s[1] = x[1]-3;
	s.t. c5: s[2] = x[1]+x[2]-8;
	s.t. c6: s[3] = x[1]+x[2]+x[3]-14;
	s.t. c7: s[4] = x[1]+x[2]+x[3]+x[4]-17;





	solve;
	display z;
	display x;
	display s;
	display y;

end;
