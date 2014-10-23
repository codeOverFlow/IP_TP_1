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
    var w{T,T}, >= 0;


# function
    minimize z: sum{n in T}(p[n]*x[n]+f[n]*y[n]+s[n]*h[n]);

# constraints
    s.t. c1 : w[1,1] = 3;
    s.t. c1 : w[1,2] + w[2,2] = 5;
    s.t. c1 : w[1,3] + w[2,3] + w[3,3] = 6;
    s.t. c1 : w[1,4] + w[2,4] + w[3,4] + w[4,4] = 3;
    s.t. c1 : w[1,5] + w[2,5] + w[3,5] + w[4,5] + w[5,5]= 8;


solve;
display z;
display x;
display y;
display s;
