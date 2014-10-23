# var & param
    param t; # nb of periods
    set T := 1..t; # index of periods

    param d{T}; # demand
    param p{T}; # production cost
    param h{T}; # storage cost
    param f{T}; # fixed production cost
    param M{T};
    
    var x{T}, integer, >= 0; # nb of producted units
    var y{T}, >= 0, <= 1; # 0 if not open, 1 otherwise  RELAXED
    #var y{T}, binary;
    var s{T}, integer, >= 0; # nb of stored units

# function
    minimize z: sum{n in T}(p[n]*x[n]+f[n]*y[n]+s[n]*h[n]);

# constraints
    s.t. c1 : x[1] = d[1]+s[1];
    s.t. c2{n in 2..t} : x[n]+s[n-1] = d[n]+s[n];
    s.t. c3{n in T} : x[n] <= M[n]*y[n];
    s.t. coupe{n in T:n<>1} : s[n-1] >= d[n]*(1-y[n]);
    s.t. c4 : y[1] = 1;
    s.t. c6 : y[2] = 1;
    #s.t. c5 : y[4] = 1;
    #s.t. c8 : y[3] = 1;
    #s.t. c7 : y[5] = 1;

solve;
display z;
display x;
display y;
display s;
