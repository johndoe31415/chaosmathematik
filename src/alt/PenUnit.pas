unit PenUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls;

type
  TPenForm = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    AbbrechenButton: TBitBtn;
    SolidButton: TImage;
    DashButton: TImage;
    DotButton: TImage;
    procedure StartUp(Sender: TObject);
    procedure SolidClick(Sender: TObject);
    procedure DashClick(Sender: TObject);
    procedure DotClick(Sender: TObject);
    procedure AbbrechenButtonClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  PenForm: TPenForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TPenForm.StartUp(Sender: TObject);
  begin
    with SolidButton.Canvas do begin
      moveto(0,16);
      Pen.Style:=psSolid;
      lineto(133,16);
    end;
    with DashButton.Canvas do begin
      moveto(0,16);
      Pen.Style:=psdash;
      lineto(133,16);
    end;
    with dotButton.Canvas do begin
      moveto(0,16);
      Pen.Style:=psdot;
      lineto(133,16);
    end;
  end;

procedure TPenForm.SolidClick(Sender: TObject);
  begin
    Back:=1;
    close;
  end;

procedure TPenForm.DashClick(Sender: TObject);
  begin
    Back:=2;
    close;
  end;

procedure TPenForm.DotClick(Sender: TObject);
  begin
    Back:=3;
    close;
  end;


procedure TPenForm.AbbrechenButtonClick(Sender: TObject);
  begin
    Back:=4;
    close;
  end;

end.
