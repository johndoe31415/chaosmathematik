unit UserInformationenUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Registry;

type
  TBenutzerInfoForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    BenutzerName: TEdit;
    Label3: TLabel;
    Bevel2: TBevel;
    OkayButton: TBitBtn;
    procedure StartUp(Sender: TObject);
    procedure OkayButtonClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  BenutzerInfoForm: TBenutzerInfoForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TBenutzerInfoForm.StartUp(Sender: TObject);
Var Reg : Tregistry;
    W   : String;
  begin
    Reg:=TRegistry.Create;
    Reg.Rootkey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion',true);
      W:=Reg.ReadString('RegisteredOwner');
    Reg.CloseKey;
    BenutzerName.Text:=w;
    Label2.Caption:=Cr(label2.caption);
  end;

procedure TBenutzerInfoForm.OkayButtonClick(Sender: TObject);
  begin
    Benutzer:=BenutzerName.Text;
    close;
  end;

end.
