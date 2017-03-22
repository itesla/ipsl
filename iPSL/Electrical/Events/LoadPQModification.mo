within iPSL.Electrical.Events;
model LoadPQModification
parameter Real startTime = Modelica.Constants.inf;
iPSL.Interfaces.AddedConnector P_1;
iPSL.Interfaces.AddedConnector Q_1;
parameter Real P;
parameter Real Q;
equation
    if time < startTime then
      P_1.deltaY = 0;
      Q_1.deltaY = 0;
    else
      P_1.deltaY = (-P + P_1.y);
      Q_1.deltaY = (-Q + Q_1.y);
    end if;

end LoadPQModification;
