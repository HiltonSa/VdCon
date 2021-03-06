unit formmsg;

{$mode objfpc}{$H+}

interface

uses
  Windows,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  Buttons;

type

  { TFrmMsg }

  TFrmMsg = class(TForm)
    btSim: TSpeedButton;
    btNao: TSpeedButton;
    pnMsg: TPanel;
    procedure btNaoClick(Sender: TObject);
    procedure btSimClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Fbt: Integer;
    procedure Setbt(AValue: Integer);
    { private declarations }
  public
    { public declarations }
    property bt: Integer read Fbt write Setbt;
  end;

var
  FrmMsg: TFrmMsg;

implementation

{$R *.lfm}

{ TFrmMsg }

procedure TFrmMsg.btNaoClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFrmMsg.btSimClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TFrmMsg.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  case Key of
    VK_F2: if btSim.Visible then btSim.Click;
    VK_ESCAPE: btNao.Click;
    else MessageBeep(MB_ICONERROR);
  end;
end;

procedure TFrmMsg.Setbt(AValue: Integer);
begin
  Fbt:=AValue;
  btSim.Visible := (Fbt = 1);
end;

end.

