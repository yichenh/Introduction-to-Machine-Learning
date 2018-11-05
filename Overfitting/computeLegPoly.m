function [ z ] = computeLegPoly( x, Q )
%COMPUTELEGPOLY Return the Qth order Legendre polynomial of x
%   Inputs:
%       x: vector (or scalar) of reals in [-1, 1]
%       Q: order of the Legendre polynomial to compute
%   Output:
%       z: matrix where each column is the Legendre polynomials of order 0 
%          to Q, evaluated at the corresponding x value in the input

    size_x = size(x);
    %Initialize the result z which is (Q+1)*size(x)(2)
    z = ones(Q+1,size_x(2));
    if Q == 0
        return
    elseif Q == 1
        z(2,:) = x;
        return
    elseif Q >= 2
        z(2,:) = x;
        for i = 3:Q+1
            k = i-1;
            z(i,:) = (2*k-1)/k*x.*z(i-1,:)-(k-1)/k*z(i-2,:);
        end
    end
end