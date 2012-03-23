unit untPosit;

interface
uses
  Controls,QForms;

procedure posit(comp:tcontrol;left,top,width,height:integer);
procedure PositBorder(comp:tcontrol;left,top,width,height:integer);
function  r(w:integer):integer;
procedure PositPercent(comp:tcontrol;left,top,width,height:integer);

implementation

procedure posit(comp:tcontrol;left,top,width,height:integer);
begin
  comp.left:=r(left);
  comp.top:=r(top);
  comp.width:=r(width);
  comp.height:=r(height);
end;

procedure PositBorder(comp:tcontrol;left,top,width,height:integer);
begin
  comp.left:=left;
  comp.top:=top;
  comp.width:=comp.Parent.Width-width-left;
  comp.height:=comp.Parent.Height-height-top;
end;

procedure PositPercent(comp:tcontrol;left,top,width,height:integer);
begin
  comp.left:=round(left/100*comp.Parent.Width);
  comp.top:=round(top/100*comp.Parent.height);
  comp.width:=round(Width/100*comp.Parent.Width);
  comp.height:=round(height/100*comp.parent.height);
end;

function r(w:integer):integer;
var
  wc:real;
begin
  wc:=screen.Width/800;
  r:=round(w*wc);
end;



end.
 