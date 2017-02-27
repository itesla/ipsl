within iPSL.Electrical.Loads.Eurostag;
model ZeroCurrent
iPSL.Connectors.PwPin p;
equation
p.ii = 0;
p.ir = 0;
end ZeroCurrent;
