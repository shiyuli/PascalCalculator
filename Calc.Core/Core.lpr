library Core;

{$mode objfpc}{$H+}

uses
  Classes
  { you can add units after this };

function Add(x, y: Integer): Integer; stdcall;
begin
  Add := x + y;
end;

function Sub(x, y: Integer): Integer; stdcall;
begin
  Sub := x - y;
end;

function Mul(x, y: Integer): Integer; stdcall;
begin
  Mul := x * y;
end;

function Div_(x, y: Integer): Integer; stdcall;
begin
  Div_ := x div y;
end;

function CheckEmpty(target: String): Boolean; stdcall;
begin
  if target = '' then
    CheckEmpty := true
  else
    CheckEmpty := false;
end;

exports
  Add index 1,
  Sub index 2,
  Mul index 3,
  Div_ index 4,
  CheckEmpty index 5;

end.

