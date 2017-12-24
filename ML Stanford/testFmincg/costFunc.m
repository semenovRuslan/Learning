function [cost grad] = costFunc(x)
  cost = sum(x.^4);
  grad = 4*x.^3;
end