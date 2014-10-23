# var & param
    param t; # nb of periods
    set T := 1..t; # index of periods

    param d{T}; # demand
    param p{T}; # production cost
    param h{T}; # storage cost
    param f{T}; # fixed production cost
    param M;
    
    var x{T}, integer, >= 0; # nb of producted units
    var y{T}, binary; # 0 if not open, 1 otherwise
    var s{T}, integer, >= 0; # nb of stored units

# function
    minimize z: sum{n in T}(p[n]*x[n]+f[n]*y[n]+s[n]*h[n]);

# constraints
    s.t. c1 : x[1] = d[1]+s[1];
    s.t. c2{n in 2..t} : x[n]+s[n-1] = d[n]+s[n];
    s.t. c3{n in T} : x[n] <= M*y[n];

solve;
display z;
display x;
display y;
display s;
