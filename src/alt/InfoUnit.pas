unit InfoUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LinkLbl, ExtCtrls, StdCtrls, Buttons, MPlayer;

type
  TInfoForm = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LinkLabel1: TLinkLabel;
    LinkLabel2: TLinkLabel;
    B3: TBevel;
    B2: TBevel;
    Timer1: TTimer;
    OkayButton: TBitBtn;
    B1: TBevel;
    LBenutzungen: TLabel;
    Label9: TLabel;
    Bevel5: TBevel;
    Label10: TLabel;
    Bevel6: TBevel;
    LLizensnehmer: TLabel;
    Label11: TLabel;
    HelpButton: TBitBtn;
    Toc: TMediaPlayer;
    StartWav: TMediaPlayer;
    procedure Startup(Sender: TObject);
    procedure TimerAusloes(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure CloseWindow(Sender: TObject; var CanClose: Boolean);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  InfoForm: TInfoForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TInfoForm.Startup(Sender: TObject);
Var A, B, C : Word;
  begin
    StartWav.Play;
    Label5.Caption:='Delphi3, '+zeilen+' Zeilen';
    Label1.Caption:='Informationen über ChaosMathematik '+version;
    LLizensnehmer.Caption:=Benutzer;
    LBenutzungen.Caption:=inttostr(Benutzungen);

    c:=400;
    repeat
      dec(c);
      Label3.Left:=c;
      Label5.Left:=c;
      LinkLabel1.Left:=c;
      LinkLabel2.Left:=c;
      LLizensnehmer.Left:=c;
      LBenutzungen.Left:=c;
      for b:=1 to 50000 do a:=b;
      if c mod 5=0 then Update;
    until (c=184);
    Timer1.Enabled:=true;

  end;

procedure TInfoForm.TimerAusloes(Sender: TObject);
Var V : Byte;
  begin
{    if B1.Style=bsraised then B1.Style:=bslowered else
                              B1.Style:=bsraised;
    if B2.Style=bsraised then B2.Style:=bslowered else
                              B2.Style:=bsraised;
    if B3.Style=bsraised then B3.Style:=bslowered else
                              B3.Style:=bsraised;}
    v:=0;
    if B1.Style=bslowered then v:=1;
    if B2.Style=bslowered then v:=2;
    if B3.Style=bslowered then v:=3;
    B1.Style:=bsraised;
    B2.Style:=bsraised;
    B3.Style:=bsraised;
    if v=1 then B2.Style:=bslowered;
    if v=2 then B3.Style:=bslowered;
    if v=3 then B1.Style:=bslowered;
//  Timer1.Enabled:=true;
    Toc.Play;
  end;
procedure TInfoForm.HelpButtonClick(Sender: TObject);
  begin
    Application.HelpFile := 'Chaos-Mathematik.HLP';
    Application.HelpJump('');
  end;

procedure TInfoForm.CloseWindow(Sender: TObject; var CanClose: Boolean);
  begin
    Timer1.Enabled:=false;
    CanClose:=True;
  end;

end.
