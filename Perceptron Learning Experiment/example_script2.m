%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Get Started %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Command Window: type and run commands immediately
% Workspace: shows your current variables
% Command History
% Current Folder
% Script Editor: used to edit and run script files (Important: you must be in the directory of the script you wish to run)


%% Basic Operations

% text here will be ignored

% Elementary math operations
9 + 2
3 - 2
5 * 8
1 / 2
2 + 3 * 10 ^ 4 - 1
2 ^ 6
% use semicolon to suppress the output, optional
2 ^ 6;

% Logical operations 
1 == 2  % false
1 ~= 2  % true
1 & 0   % AND
1 | 0   % OR
~1      % NOT
% realationship operators: >, <, >=, <=


%% Variables
x = 3
x^2 + 3*x
%Observe the changes to x in the workspace window:
x = 5
x^2 + 3*x
%Variables can also be used to define other variables, or even to redefine themselves:
x = x * 4;
y = 3 * x - 9 * 2;
z = 4 * x + 3 * y ^ 2 - 10;

% predefined variables (pi, inf, NaN, i)
pi
pi = 3;     % this is dangerous
pi

%% Built-in Matlab functions
sqrt(81)    % square root
abs(-53.2)  % absolute value

log(1000)   % natural log
log2(1000)  % log with base 2
log10(1000) % log with base 10 
% Question: how to get log with base 3?

sin(pi / 2) % input in radians
sind(90)    % input in degrees

%% Help and documentation
help sin
doc sin     % open matlab help for this function (easier to read)

%% Save variables to computer hard drive
save my_temp_var x y z
clear 
clc
load my_temp_var




%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Arrays (vectors and matrices)%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Vectors - a list of scalars arranged in a row or a column
% create Row vector:
rowVec = [1,2,3,4,5]  

% Column vector: 
colVec = [1;2;3;4;5]

% transpose
t = colVec'
t = transpose(colVec)

% created vector with evenly spaced values
% - use colon notation
v1 = 2:0.2:3    % start value : step size : ending value, separated with colons
v2 = 2:7        % spacing of 1 by default
% - use linspace when don't know the space value
v3 = linspace(20, 40, 6) % start value + ending value + # of points 

% combine two vectors into one vector
newVec = [v1, v2]

% vector index and over
v1(3)       % retrieve the element with index of 3
v1(1:3)     % return elementx with index from 1 to 3
v1
v1(3) = 7   % update / overwrite new values to that position


%% Matrices creation
% create matrix one row at a time
% semicolon indicates the end of current row AND begining of next row
% scalar values in the same row can be separated with commas or whitespace
% NOTE: each row must have the same # of values
A = [1,2,3;4,5,6;7,8,9]
A = [1,2,3;5,6]     %lead to error
% use variables or expressions to create matrix
x = 2:0.3:3.2
B = [sin(x); cos(x)]

% use built-in functions to create matrix
ones(3,4)
zeros(4,5)
eye(4)      % identity function
rand(3,2)   % random number uniform dist between 0 and 1. 
% QUESTION: how to generate uniformly distributed values between -1 and +1?
% other func: diag(),randi(),randn(),magic()

% matrix elements index
C = magic(3)
C(1,2)      % row & col number
C(1,2) = 10 % overwrite the original value
C(:,2)      % access all elements in the 2nd column 
C(2,:)      % access all elements in the 2nd row

% transpose
C'          
transpose(C)   

% built-in functions for matrix
[r, c] = size(C)
max(A)      % max element in each column, same as max(A,[],1)
max(A,[],2) % max element in each row
inv(C)
% use help to find other functions: min(), median(), std(), var()

%% Addition, subtraction
A = [1,2,3; 5,6,7]
B = [-2,1,15;7,4,2]
A + B
A - B
A + 12

%% multiplication
A * B   	% leads to error
A * B'      % not communtative, not equal to B'*A
B' * A

%% Division
A = [18 -20 2; 9 11 -14; 1 -1 100]
B = [-12 73 22; -10 -11 0; 85 2 90]
% left division
A \ B
inv(A) * B
% right division
A / B
A * inv(B)

%% element-wise multiplication
A = [1,2,3; 5,6,7]
B = [-2,1,15;7,4,2]
A.*B    % element wise multiplication
A./B    % element wise division
A.^B    % element wise power


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLOTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = -5:5;
y = 3.* x.^2 + 10.*x - 4; % Note element wise multiplication, y's funciton of x

plot(x,y)
plot(x,y,'r--')
plot(x,y,'r--^')
plot(x,y,'r--^', 'LineWidth',3)
xlabel('x values')
ylabel('y values')
title('my plot')
% legend('y(t)')


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Define and call our own functions %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pass in a number, get the squared value
function y = squareNumber(x)
    y = x^2;
end
%test
x = 3;
squareNumber(x) 

% pass in a vector/matrix, get the squared value
function y = squareMatrix(x)
    y = x.^2;
end
%test
x = [1:5]
squareMatrix(x) 

% return multiple values
function [y1, y2] = squareCubeMatrix(x)
    y1 = x.^2;
    y2 = x.^3;
end
% test
x = [1:5]
[y1, y2] = squareCubeMatrix(x)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Control statements %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the relation and logical operations used as conditions for flow control

%% for loop
% fixed number of iterations
v = zeros(10,1);
for i = 1:10
    v(i) = 2^i;
end

% Fibonacci number: 
% y(1) = 1;
% y(2) = 1;
% for i = [1:5]
%     y(i+2) = y(i) + y(i+1)
% end


%% while loop
% want certain condition to be met, but don't know # of iterations needed
i = 1;
while i <= 5
    v(i) = 100;
    i = i + 1;
end

%% if else
v(1) = 1;
if v(1) == 1
    disp('The value is one');
elseif v(1) == 2
    disp('The value is two');
else
    disp('The value is not one or two');
end
    
%% if else 
% if x < 0
%     f = 1 - x
% elseif x <10
%     f = 2 * x
% else
%     f = x^2 
% end







