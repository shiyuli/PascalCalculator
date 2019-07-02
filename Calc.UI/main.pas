unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  Menus;

type
  { TMainForm }

  TMainForm = class(TForm)
    btnAdd: TButton;
    cboOperator: TComboBox;
    txtNumLeft: TEdit;
    txtNumRight: TEdit;
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

function Add(x, y: Integer): Integer; stdcall; external 'Core.dll';
function Sub(x, y: Integer): Integer; stdcall; external 'Core.dll';
function Mul(x, y: Integer): Integer; stdcall; external 'Core.dll';
function Div_(x, y: Integer): Integer; stdcall; external 'Core.dll';

function CheckEmpty(target: String): Boolean; stdcall; external 'Core.dll';

function Calculate(x, y: Integer; opStr: String): Integer;
begin
  case opStr of
    '+': Calculate := Add(x, y);
    '-': Calculate := Sub(x, y);
    '*': Calculate := Mul(x, y);
    '/': Calculate := Div_(x, y);
  end;
end;

procedure TMainForm.btnAddClick(Sender: TObject);
var
  result: Integer = 0;
  msg: String = '';
begin
  if CheckEmpty(cboOperator.Text) or CheckEmpty(txtNumLeft.Text) or CheckEmpty(txtNumRight.Text) then
    ShowMessage('value is empty')
  else
  begin
    result := Calculate(StrToInt(txtNumLeft.Text), StrToInt(txtNumRight.Text), cboOperator.Text);
    AppendStr(msg, IntToStr(result));
    ShowMessage(msg);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  cboOperator.SelText := '+';
end;

begin
  ShowMessage('Enjoy yourself!');
end.
