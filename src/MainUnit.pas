unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, Menus, ClipBrd, Registry, MPlayer;

type
  TMainForm = class(TForm)
    Zeichnung: TImage;
    Bevel1: TBevel;
    Label1: TLabel;
    A_XQuadrat: TEdit;
    Label2: TLabel;
    Nullterminiert: TImage;
    Label3: TLabel;
    B_X: TEdit;
    Label4: TLabel;
    C_Zahl: TEdit;
    Label5: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    A_B_Verknuepfung: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Iterationen: TEdit;
    Bevel4: TBevel;
    HochRunterFeld: TUpDown;
    Label12: TLabel;
    BeginnX: TEdit;
    HorBevel2: TBevel;
    AnzeigenLabel: TLabel;
    Bevel6: TBevel;
    AktXWertLabel: TLabel;
    XWertLabel: TLabel;
    Bevel7: TBevel;
    AktIterationLabel: TLabel;
    Bevel8: TBevel;
    Vorheriges: TBitBtn;
    Naechstes: TBitBtn;
    Status: TStatusBar;
    MiniaturYAchse: TPanel;
    MiniaturXAchse: TPanel;
    X2Box: TEdit;
    Y2Box: TEdit;
    X1Box: TEdit;
    Y1Box: TEdit;
    IterationsNr: TEdit;
    MainMenu1: TMainMenu;
    Datei: TMenuItem;
    Datei_AlsBMPSpeichern: TMenuItem;
    N1: TMenuItem;
    Datei_Beenden: TMenuItem;
    Bearbeiten: TMenuItem;
    Bearbeiten_Kopieren: TMenuItem;
    Optionen: TMenuItem;
    Optionen_AlleFehlerAnzeigen: TMenuItem;
    Optionen_Achsenbeschriftung: TMenuItem;
    Optionen_IterationenSeperatAnzeigen: TMenuItem;
    Optionen_Farben: TMenuItem;
    Bevel15: TBevel;
    BMPSave: TSaveDialog;
    MenuBevel: TBevel;
    Info: TMenuItem;
    XKoordinate: TLabel;
    YKoordinate: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    LinksButton: TSpeedButton;
    ObenButton: TSpeedButton;
    RechtsButton: TSpeedButton;
    UntenButton: TSpeedButton;
    MinusZoomButton: TSpeedButton;
    PlusZoomButton: TSpeedButton;
    ZentrierenButton: TSpeedButton;
    Sektor: TLabel;
    Optionen_QuickHelpAnzeigen: TMenuItem;
    Bevel9: TBevel;
    Hilfe_Hilfe: TMenuItem;
    N2: TMenuItem;
    Info_Info: TMenuItem;
    Optionen_Rasterung: TMenuItem;
    Optionen_Rasterung_AnAus: TMenuItem;
    N3: TMenuItem;
    Optionen_Rasterung_Einstellungen: TMenuItem;
    Click: TMediaPlayer;
    Optionen_Sounds: TMenuItem;
    Ready: TMediaPlayer;
    Optionen_GrosserBildschirm: TMenuItem;
    FeigenBaumDiagramm: TMenuItem;
    procedure B_XChange(Sender: TObject);
    procedure A_XQuadratChange(Sender: TObject);
    procedure StartUp(Sender: TObject);
    procedure IterationenChange(Sender: TObject);
    procedure NaechstesClick(Sender: TObject);
    procedure BeginnXChange(Sender: TObject);
    procedure VorherigesClick(Sender: TObject);
    procedure IterationenDurchButtonChange(Sender: TObject;
      var AllowChange: Boolean);
    procedure AchsenbeschriftungChange(Sender: TObject);
    procedure X1Change(Sender: TObject);
    procedure Y1Change(Sender: TObject);
    procedure X2Change(Sender: TObject);
    procedure Y2Change(Sender: TObject);
    procedure PlusZoomButtonClick(Sender: TObject);
    procedure MinusZoomClick(Sender: TObject);
    procedure LinksClick(Sender: TObject);
    procedure RechtsClick(Sender: TObject);
    procedure UntenClick(Sender: TObject);
    procedure ObenClick(Sender: TObject);
    procedure IterationsNrLeave(Sender: TObject);
    procedure C_Change(Sender: TObject);
    procedure Optionen_IterationenSeperatAnzeigenClick(Sender: TObject);
    procedure Optionen_FarbenClick(Sender: TObject);
    procedure Optionen_AchsenbeschriftungClick(Sender: TObject);
    procedure Optionen_AlleFehlerAnzeigenClick(Sender: TObject);
    procedure Datei_BeendenClick(Sender: TObject);
    procedure Datei_AlsBMPSpeichernClick(Sender: TObject);
    procedure Bearbeiten_KopierenClick(Sender: TObject);
    procedure InfoClick(Sender: TObject);
    procedure ProgrammBeenden(Sender: TObject; var CanClose: Boolean);
    procedure BewegeMaus(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MouseAufForm(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ZentrierenButtonClick(Sender: TObject);
    procedure Optionen_QuickHelpAnzeigenClick(Sender: TObject);
    procedure Hilfe_HilfeClick(Sender: TObject);
    procedure Optionen_Rasterung_EinstellungenClick(Sender: TObject);
    procedure Optionen_Rasterung_AnAusClick(Sender: TObject);
    procedure Optionen_SoundsClick(Sender: TObject);
    procedure Optionen_GrosserBildschirmClick(Sender: TObject);
    procedure FeigenBaumDiagrammClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var MainForm                 : TMainForm;
    X1, X2,
    Y1, Y2                   : Real;
    ParabelFarbe,
    KoordinatenSystemFarbe,
    WinkelhalbierendeFarbe,
    IterationStep1Farbe,
    IterationStep2Farbe,
    ZahlenFarbe,
    EditierFelderFarbe       : TColor;
    ParabelForm,
    KoordinatenSystemForm ,
    WinkelhalbierendeForm,
    IterationStep1Form,
    IterationStep2Form       : TPenStyle;
    Benutzer,
    CtrlA, CtrlB, CtrlC,
    CtrlD, CtrlE, CtrlF,
    CtrlG, CtrlH, CtrlI,
    CtrlJ                    : String;
    Benutzungen              : Integer;
    VertikalL, HorizontalL,
    RasterungStil, Back,
    CurrShow                 : Byte;
    RasterungFarbe           : TColor;
    Linien, Excpt, ButDrueck : Boolean;


Const Version='5.25';
      Zeilen ='2404';

function Round(I : Real):String;
function Cr(A : string):string;
procedure WriteInReg(i:Byte);
procedure SeperatAbfrage;
function PenStyle2Byte(I : TPenStyle):Byte;
function Byte2Penstyle(I : Byte) : TPenStyle;
procedure SetzeQuickHelp;
function CheckChg(Value : Byte):Boolean;
procedure CheckeBildschirmGroesse;

implementation


uses ColorUnit, TextUnit, InfoUnit, UserInformationenUnit, RasterungUnit,
  FeigenBaumUnit;


{$R *.DFM}

procedure SwapDisplay(DisplayType : Byte);

begin

  if (DisplayType<>1) and (DisplayType<>2) then begin
    showmessage('Ungültiger Parameter beim Aufruf der Prozedur "SwapDisplay".');
    exit;
  end;

  if (DisplayType=1) then begin
    MainForm.Left:=275;
    MainForm.Top:=289;
    MainForm.ClientHeight:=500;
    MainForm.ClientWidth:=775;
    MainForm.Zeichnung.Width:=450;
    MainForm.Zeichnung.Height:=450;
    MainForm.Bevel1.Height:=545;
    MainForm.HorBevel2.Left:=624;
    MainForm.HorBevel2.Height:=545;
    MainForm.AnzeigenLabel.Left:=704;
    MainForm.Bevel6.Left:=624;
    MainForm.AktXWertLabel.Left:=632;
    MainForm.XWertLabel.Left:=632;
    MainForm.Bevel7.Left:=624;
    MainForm.AktIterationLabel.Left:=632;
    MainForm.Bevel8.Left:=624;
    MainForm.MenuBevel.Width:=777;
    MainForm.XKoordinate.Top:=400;
    MainForm.YKoordinate.Top:=424;
    MainForm.Label16.Top:=400;
    MainForm.Label17.Top:=424;
    MainForm.LinksButton.Left:=640;
    MainForm.ObenButton.Left:=680;
    MainForm.RechtsButton.Left:=720;
    MainForm.UntenButton.Left:=680;
    MainForm.MinusZoomButton.Left:=632;
    MainForm.PlusZoomButton.Left:=728;
    MainForm.ZentrierenButton.Left:=680;
    MainForm.Sektor.Top:=448;
    MainForm.Bevel9.Left:=624;
    MainForm.Status.Top:=481;
    MainForm.Status.Width:=775;
    MainForm.MiniaturYAchse.Left:=696;
    MainForm.MiniaturXAchse.Left:=660;
    MainForm.X2Box.Left:=704;
    MainForm.Y2Box.Left:=728;
    MainForm.X1Box.Left:=640;
    MainForm.Y1Box.Left:=664;
    MainForm.IterationsNr.Left:=632;
  end;

  if (DisplayType=2) then begin
    MainForm.Left:=146;
    MainForm.Top:=137;
    MainForm.ClientHeight:=626;
    MainForm.ClientWidth:=916;
    MainForm.Zeichnung.Width:=601;
    MainForm.Zeichnung.Height:=577;
    MainForm.Bevel1.Height:=625;
    MainForm.HorBevel2.Left:=762;
    MainForm.HorBevel2.Height:=625;
    MainForm.AnzeigenLabel.Left:=840;
    MainForm.Bevel6.Left:=760;
    MainForm.AktXWertLabel.Left:=768;
    MainForm.XWertLabel.Left:=768;
    MainForm.Bevel7.Left:=760;
    MainForm.AktIterationLabel.Left:=768;
    MainForm.Bevel8.Left:=760;
    MainForm.MenuBevel.Width:=921;
    MainForm.XKoordinate.Top:=472;
    MainForm.YKoordinate.Top:=496;
    MainForm.Label16.Top:=472;
    MainForm.Label17.Top:=496;
    MainForm.LinksButton.Left:=776;
    MainForm.ObenButton.Left:=816;
    MainForm.RechtsButton.Left:=856;
    MainForm.UntenButton.Left:=816;
    MainForm.MinusZoomButton.Left:=768;
    MainForm.PlusZoomButton.Left:=864;
    MainForm.ZentrierenButton.Left:=816;
    MainForm.Sektor.Top:=520;
    MainForm.Bevel9.Left:=760;
    MainForm.Status.Top:=607;
    MainForm.Status.Width:=916;
    MainForm.MiniaturYAchse.Left:=832;
    MainForm.MiniaturXAchse.Left:=796;
    MainForm.X2Box.Left:=840;
    MainForm.Y2Box.Left:=864;
    MainForm.X1Box.Left:=776;
    MainForm.Y1Box.Left:=800;
    MainForm.IterationsNr.Left:=768;
  end;
end;

procedure CheckRasterung;
  begin
    with MainForm do
      if Optionen_Rasterung_AnAus.Checked then
         Optionen_Rasterung_AnAus.Caption:='Deaktivieren' else
         Optionen_Rasterung_AnAus.Caption:='Aktivieren';
  end;

procedure RestoreFromReg(i:Byte);
Var Reg : TRegistry;
  begin
    Reg:=TRegistry.Create;
    Reg.Rootkey:=HKEY_LOCAL_MACHINE;
    if (i=3) then begin
      Reg.OpenKey('SOFTWARE\ChaosMathematik\User',true);
        Benutzer:=Reg.ReadString('Benutzername');
      Reg.CloseKey;
    end;

    if (i=2) then begin
      with MainForm do begin
        Reg.OpenKey('SOFTWARE\ChaosMathematik\Werte',true);
          A_XQuadrat.Text:=Reg.ReadString('A');
          B_X.Text:=Reg.ReadString('B');
          C_Zahl.Text:=Reg.ReadString('C');
          iterationen.text:=Reg.ReadString('Iterationen');
          beginnx.text:=Reg.ReadString('X_Bei_N_Null');
          IterationsNr.text:=Reg.ReadString('Aktuelle_Iteration');
          A_B_Verknuepfung.Checked:=Reg.ReadBool('A_B_Verknuepfung');
          Optionen_IterationenSeperatAnzeigen.Checked:=Reg.ReadBool('IterationsModus');
          Optionen_AchsenBeschriftung.Checked:=Reg.ReadBool('Achsenbeschriftung');
          Optionen_AlleFehlerAnzeigen.Checked:=Reg.ReadBool('Debug-Modus');
          Optionen_QuickHelpAnzeigen.Checked:=Reg.ReadBool('Quickhelp');
          Optionen_Sounds.Checked:=Reg.ReadBool('Sound');
          Optionen_GrosserBildschirm.Checked:=Reg.ReadBool('Grosser Bildschirm');
          SeperatAbfrage;
          SetzeQuickhelp;
        Reg.CloseKey;

        if Reg.KeyExists('SOFTWARE\ChaosMathematik\Zoom') then begin
          Reg.OpenKey('SOFTWARE\ChaosMathematik\Zoom',true);
            x1box.text:=Reg.ReadString('X1');
            x2box.text:=Reg.ReadString('X2');
            y1box.text:=Reg.ReadString('Y1');
            y2box.text:=Reg.ReadString('Y2');
            If X1box.text<>'' then begin
              x1:=-2;
              x2:=2;
              y1:=-2;
              y2:=2;
            end;
            x1:=trunc(strtofloat(x1box.text)*100)/100;
            y1:=trunc(strtofloat(y1box.text)*100)/100;
            x2:=trunc(strtofloat(x2box.text)*100)/100;
            y2:=trunc(strtofloat(y2box.text)*100)/100;
          Reg.CloseKey;
        end;
        Reg.OpenKey('SOFTWARE\ChaosMathematik\User',true);
          benutzungen:=Reg.ReadInteger('Benutzungen');
        Reg.CloseKey;
      end;
    end;
    if (i=1) then begin
      Reg.OpenKey('SOFTWARE\ChaosMathematik\Farben',true);
        ParabelFarbe:=strtoint(Reg.ReadString('Parabel'));
        KoordinatensystemFarbe:=strtoint(Reg.ReadString('Koordinatensystem'));
        ZahlenFarbe:=strtoint(Reg.ReadString('Koordinatensystembeschreibung'));
        WinkelhalbierendeFarbe:=strtoint(Reg.ReadString('Winkelhalbierende'));
        IterationStep1Farbe:=strtoint(Reg.ReadString('Iteration Stufe 1'));
        IterationStep2Farbe:=strtoint(Reg.ReadString('Iteration Stufe 2'));
        EditierFelderFarbe:=strtoint(Reg.ReadString('EditierFelder'));
      Reg.CloseKey;
    end;
    if (i=4) then begin
      Reg.OpenKey('SOFTWARE\ChaosMathematik\Pens',true);
        ParabelForm:=Byte2PenStyle(Reg.ReadInteger('Parabel'));
        KoordinatensystemForm:=Byte2PenStyle(Reg.ReadInteger('Koordinatensystem'));
        WinkelhalbierendeForm:=Byte2PenStyle(Reg.ReadInteger('Winkelhalbierende'));
        IterationStep1Form:=Byte2PenStyle(Reg.ReadInteger('Iteration Nr 1'));
        IterationStep2Form:=Byte2PenStyle(Reg.ReadInteger('Iteration Nr 2'));
      Reg.CloseKey;
    end;
    if (i=5) then begin
      Reg.OpenKey('SOFTWARE\ChaosMathematik\Rasterung',true);
        MainForm.Optionen_Rasterung_AnAus.Checked:=Reg.ReadBool('Aktiv');
        VertikalL:=Reg.ReadInteger('Vertikale Linien');
        HorizontalL:=Reg.ReadInteger('Horizontale Linien');
        RasterungStil:=Reg.ReadInteger('LinienStil');
        RasterungFarbe:=Reg.ReadInteger('Farbe');
        Linien:=Reg.ReadBool('Linien Aktiv');
      Reg.CloseKey;
    end;
  end;

function Cr(A : string):string;
Var X, Y, Z : String;
    I, Q    : Byte;
  begin
    z:=a;
    y:='';
    for i:=1 to length(z) do begin
      x:=copy(z,i,2);
      if (x='- ') then begin
        y:=y+chr(13);
        q:=2;
      end;
      if (q=0) then begin
        y:=y+copy(z,i,1);
      end else begin
        dec(q);
      end;
    end;
    cr:=y;
  end;

function X(i:real):integer;
// Rechnet einen X-Wert wie -1.44 auf einen Wert wie 304
// um. Das Window für das Canvas ist (X1,Y1)-(X2,Y2)
Var C, Breite, Faktor : Real;
  begin
    Breite:=x2-x1;
    Faktor:=MainForm.Zeichnung.Width/Breite;
    c:=i+abs(x1);                // X1 Muss negativ sein
    c:=c*Faktor;
    x:=trunc(c);
  end;

function RevX(i:integer):String;
Var C, Breite, Faktor : Real;
  begin
    Breite:=x2-x1;
    Faktor:=Breite/MainForm.Zeichnung.Width;
    c:=(i*Faktor)+x1;
    RevX:=floattostr(trunc(c*1000)/1000);
  end;

function Y(i:real):integer;
// Rechnet einen Y-Wert wie -1.44 auf einen Wert wie 304
// um. Das Window für das Canvas ist (X1,Y1)-(X2,Y2)
Var C, Hoehe, Faktor : Real;
  begin
    Hoehe:=y2-y1;
    Faktor:=MainForm.Zeichnung.Height/Hoehe;
    c:=i+abs(y1);                                //y1<0
    c:=c*Faktor;
    c:=MainForm.Zeichnung.Height-c;
    y:=trunc(c);
  end;

function RevY(i:integer):string;
Var C, Hoehe, Faktor, H2 : Real;
  begin
    Hoehe:=y2-y1;
    h2:=abs(y1)+abs(y2);
    Faktor:=Hoehe/MainForm.Zeichnung.Height;
    c:=(i*Faktor)+y1;
    c:=-c+y2+y1;
    Revy:=floattostr(trunc(c*1000)/1000);
  end;


procedure FarbenReset;
  begin
    with MainForm do begin
      A_XQuadrat.Color:=EditierFelderFarbe;
      B_X.Color:=EditierFelderFarbe;
      C_Zahl.Color:=EditierFelderFarbe;
      Iterationen.Color:=EditierFelderFarbe;
      BeginnX.Color:=EditierFelderFarbe;
      IterationsNr.Color:=EditierFelderFarbe;
      X1Box.Color:=EditierFelderFarbe;
      X2Box.Color:=EditierFelderFarbe;
      Y1Box.Color:=EditierFelderFarbe;
      Y2Box.Color:=EditierFelderFarbe;
    end;
  end;

procedure Line(x12,y12,x22,y22:Real);
  begin
    with MainForm.Zeichnung.Canvas do begin
      moveto(x(x12),y(y12));
      lineto(x(x22),y(y22));
    end;
  end;

function Berechne(X       : Real;
                  A, B, C : String):Real;
  begin
    try
      Berechne:=(strtofloat(a)*sqr(x))+(strtofloat(b)*x)+strtofloat(c);
    except
      excpt:=true;
    end;
  end;

procedure Zeichne;
Var Cnt, Erg, O, O2, O3,
    IncrX, IncrY, N,
    XKoord, YKoord, A,
    B, C                : Real;
    V, M, T, Z          : Word;
    Field               : Array[1..250] of Real;
  begin
    with MainForm do begin
      a:=strtofloat(a_xquadrat.text);
      b:=strtofloat(b_x.text);
      c:=strtofloat(c_zahl.text);
      xkoord:=-((b)/(2*a));
      ykoord:=-(((sqr(b))/(4*a))-c);
      Status.Panels[0].Text:='Scheitelpunkt bei '+round(xkoord)+'|'+round(ykoord);

      CtrlA:=A_XQuadrat.Text;
      CtrlB:=B_X.Text;
      CtrlC:=C_Zahl.Text;
      CtrlD:=Iterationen.Text;
      CtrlE:=BeginnX.Text;
      CtrlF:=IterationsNr.Text;
      CtrlG:=X2Box.Text;
      CtrlH:=Y2Box.Text;
      CtrlI:=X1Box.Text;
      CtrlJ:=Y1Box.Text;

//      if (butdrueck=false) then showmessage('false') else showmessage('true');
      if (Optionen_Sounds.Checked) and (not ButDrueck) then Ready.Play;
      ButDrueck:=false;

      Zeichnung.Picture:=Nullterminiert.Picture;
//    Status.Panels[0].Text:='';
      if (A_XQuadrat.Text='0') or (A_XQuadrat.Text=' ')
      or (A_XQuadrat.Text='') then
          A_XQuadrat.Text:='-1';
    end;

    with MainForm.Zeichnung.Canvas do begin
      pen.width:=1;
      pen.color:=rasterungfarbe;
      pen.style:=pssolid;

      if MainForm.Optionen_Rasterung_AnAus.Checked then begin
        if linien then begin
          pen.style:=byte2penstyle(rasterungstil);
          z:=0;
          t:=trunc(mainform.zeichnung.width/vertikall);
          repeat
            inc(z,t);
            moveto(z,0);
            lineto(z,mainform.zeichnung.height);
          until (z>=mainform.zeichnung.width);
          z:=0;
          t:=trunc(mainform.zeichnung.height/horizontall);
          repeat
            inc(z,t);
            moveto(0,z);
            lineto(mainform.zeichnung.width,z);
          until (z>=mainform.zeichnung.height);

        end else begin
          z:=0;
          t:=0;
          repeat
            inc(z,trunc(mainform.zeichnung.width/vertikall));
            t:=0;
            repeat
              inc(t,trunc(mainform.zeichnung.height/horizontall));
              moveto(z,t);
              lineto(z,t+1);
            until (t>=mainform.zeichnung.height);
          until (z>=mainform.zeichnung.width);

        end; //if
      end;

      if MainForm.Optionen_Achsenbeschriftung.Checked then begin

        IncrX:=(x2-x1)/10;
        IncrY:=(y2-y1)/10;

        font.color:=zahlenfarbe;

        pen.color:=koordinatensystemfarbe;
        pen.style:=koordinatensystemForm;

        cnt:=x1+incrX;
        z:=0;
        repeat
          inc(z);
          TextOut(x(cnt-(incrx/3.5)),y(-incry/4),floattostr(trunc(cnt*100)/100));
          line(cnt,-incry/15,cnt,incry/15);
//          showmessage('');
          cnt:=cnt+incrx;
        until z=10;

        cnt:=y1+incrY;
        z:=0;
        repeat
          inc(z);
          TextOut(x(-incrx/1.75),y(cnt+(incry/7)),floattostr(trunc(cnt*100)/100));
          line(incrx/15,cnt,-incrx/15,cnt);
          cnt:=cnt+incry;
        until z=10;
      end;


      pen.color:=ParabelFarbe;
      pen.style:=ParabelForm;

      cnt:=x1;
      excpt:=false;
      with Mainform do moveto(x(cnt),y(Berechne(cnt,A_XQuadrat.Text,B_X.Text,C_Zahl.Text)));
      repeat
        cnt:=cnt+0.015;

        with MainForm do begin
          n:=Berechne(cnt,A_XQuadrat.Text,B_X.Text,C_Zahl.Text);
          lineto(X(cnt),y(n));
        end;

        if excpt then begin
          TextOut(x(x1),y(y2),'Ungültige Eingabe');
          exit;
        end;
        if StrToFloat(MainForm.A_XQuadrat.Text)>49 then begin
          TextOut(x(x1),y(y2),'Wert von x² zu gross!');
          exit;
        end;

      until cnt>x2;

      pen.color:=KoordinatensystemFarbe;
      pen.style:=koordinatensystemform;
      line(x1,0,x2,0);  // X-Koordinaten
      line(0,y1,0,y2);  // Y-Koordinaten


      pen.color:=WinkelhalbierendeFarbe;
      pen.style:=Winkelhalbierendeform;

      cnt:=x1;
      moveto(x(x1),y(x1));
      repeat
        cnt:=cnt+0.1;
        lineto(x(cnt),y(cnt));
      until cnt>x2;

      v:=0;
      o:=strtofloat(mainform.beginnx.text);
      o3:=0;
{      With MainForm do o2:=(sqr(o)*strtofloat(A_XQuadrat.Text))+(o*strtofloat(B_X.Text))+strtofloat(C_Zahl.Text);
      line(o,0,o,o2);
      mainform.zeichnung.canvas.lineto(x(o2),y(o));
      o:=o2;}
      m:=strtoint(MainForm.Iterationen.Text);
      for t:=1 to 250 do field[t]:=0;
      if MainForm.Optionen_IterationenSeperatAnzeigen.Checked then m:=currshow;
      for v:=1 to m do begin
        With MainForm do o2:=(sqr(o)*strtofloat(A_XQuadrat.Text))+(o*strtofloat(B_X.Text))+strtofloat(C_Zahl.Text);
        pen.color:=IterationStep1Farbe;
        pen.style:=IterationStep1Form;
        line(o,o3,o,o2);
        try
        pen.style:=IterationStep2Form;
          pen.color:=IterationStep2Farbe;
          lineto(x(o2),y(o2));
        except
          if o2<0 then begin
            MainForm.Status.Panels[0].Text:='Grenzwert zu niedrig';
            if MainForm.Optionen_AlleFehlerAnzeigen.Checked then showmessage('Grenzwert zu niedrig');
          end;
          if o2>0 then begin
            MainForm.Status.Panels[0].Text:='Grenzwert zu hoch';
            if MainForm.Optionen_AlleFehlerAnzeigen.Checked then showmessage('Grenzwert zu hoch');
          end;
          exit;
        end;
        MainForm.XwertLabel.Caption:=floattostr(trunc(o2*10000)/10000);
        if o2<-100 then begin
          MainForm.Status.Panels[0].Text:='Wert von O2 zu niedrig (<-100)';
          if MainForm.Optionen_IterationenSeperatAnzeigen.Checked then begin
            dec(currshow);
            MainForm.IterationsNr.Text:=inttostr(currshow);
          end;
{          if not MainForm.ZeigeEinzeln.Checked then begin
            MainForm.Iterationen.Text:=inttostr(strtoint(MainForm.iterationen.text)-1);
          end;}
          // Funktioniert aus einem unerfindlichen Grund nicht
          if MainForm.Optionen_AlleFehlerAnzeigen.Checked then showmessage('Wert von O2 zu niedrig (<-100)');
          exit;
        end;
        if o2>100 then begin
          MainForm.Status.Panels[0].Text:='Wert von O2 zu hoch (>100)';
          if MainForm.Optionen_AlleFehlerAnzeigen.Checked then showmessage('Wert von O2 zu hoch (>100)');
          if MainForm.Optionen_IterationenSeperatAnzeigen.Checked then begin
            dec(currshow);
            MainForm.IterationsNr.Text:=inttostr(currshow);
          end;
{          if not MainForm.ZeigeEinzeln.Checked then begin
            showmessage('');
            MainForm.Iterationen.Text:=inttostr(strtoint(MainForm.iterationen.text)-1);
          end;}
          exit;
        end;
        Field[v]:=trunc(o2*1000);
        for t:=1 to v-1 do begin
          if Field[t]=Field[v] then begin
            MainForm.Status.Panels[0].Text:='Periode bei '+inttostr(t)+' mit Länge '+inttostr(v-t)+' gefunden ('+floattostr(trunc(field[t])/1000)+')';
            if MainForm.Optionen_AlleFehlerAnzeigen.Checked then
              showmessage('Periode erkannt!'+#13+
                          'Beginn: '+inttostr(t)+#13+
                          'Länge: '+inttostr(v-t)+#13+
                          'Wert: '+floattostr(trunc(field[t])/1000));


            exit;
          end;
        end;
        {lineto(x(o2),y(o));}
        o3:=o2;
        o:=o2;
      end;

//      Ellipse(0,0,100,100);
    end;
  end;

function Round(I : Real):String;
  begin
    Round:=floattostr(trunc(i*100)/100)
  end;

procedure TMainForm.B_XChange(Sender: TObject);
Var B : Real;
  begin
    if CheckChg(2) then exit;
    if A_B_Verknuepfung.Checked then begin
      try
        b:=StrToFloat(b_X.text);
      except
{        Zeichnung.Picture:=Nullterminiert.Picture;
        Zeichnung.Canvas.TextOut(x(-3),y(3),'Fehler bei der Verknüpfung A<==>B - BChange');}
        exit;
      end;
        A_XQuadrat.Text:=round(-abs(b)+1);
    end;
    Zeichne;
  end;

function CheckChg(Value : Byte):Boolean;
Var M : Boolean;
  begin
    with MainForm do begin
      if (Value=1) then begin
        m:=(CtrlA=A_XQuadrat.Text);
        if not m then CtrlA:=A_XQuadrat.Text;
      end;
      if (Value=2) then begin
        m:=(CtrlB=B_X.Text);
        if not m then CtrlB:=B_X.Text;
      end;
      if (Value=3) then begin
        m:=(CtrlC=C_Zahl.Text);
        if not m then CtrlC:=C_Zahl.Text;
      end;
      if (Value=4) then begin
        m:=(CtrlD=Iterationen.Text);
        if not m then CtrlD:=Iterationen.Text;
      end;
      if (Value=5) then begin
        m:=(CtrlE=BeginnX.Text);
        if not m then CtrlE:=BeginnX.Text;
      end;
      if (Value=6) then begin
        m:=(CtrlF=IterationsNr.Text);
        if not m then CtrlF:=IterationsNr.Text;
      end;
     if (Value=7) then begin
        m:=(CtrlG=X2Box.Text);
        if not m then CtrlG:=X2Box.Text;
      end;
      if (Value=8) then begin
        m:=(CtrlH=Y2Box.Text);
        if not m then CtrlH:=Y2Box.Text;
      end;
      if (Value=9) then begin
        m:=(CtrlI=X1Box.Text);
        if not m then CtrlI:=X1Box.Text;
      end;
      if (Value=10) then begin
        m:=(CtrlJ=Y1Box.Text);
        if not m then CtrlJ:=Y1Box.Text;
      end;
    end;
    CheckChg:=m;
  end;

procedure TMainForm.A_XQuadratChange(Sender: TObject);
Var A : Real;
  begin
    if CheckChg(1) then exit;
    if A_B_Verknuepfung.Checked then begin
      try
        a:=StrToFloat(A_XQuadrat.Text);
      except
{        Zeichnung.Picture:=Nullterminiert.Picture;
        Zeichnung.Canvas.TextOut(x(-3),y(3),'Fehler bei der Verknüpfung A<==>B - AChange');}
        exit;
      end;
        b_x.text:=round(abs(a)+1);
    end;
    Zeichne;
  end;

function PenStyle2Byte(I : TPenStyle):Byte;
Var Z: Byte;
  begin
    z:=0;
    if (i=pssolid) then z:=1;
    if (i=psdash) then z:=2;
    if (i=psdot) then z:=3;
    PenStyle2Byte:=z;
  end;

function Byte2Penstyle(I : Byte) : TPenStyle;
Var Z: TPenStyle;
  begin
    if (i=1) then z:=pssolid;
    if (i=2) then z:=psdash;
    if (i=3) then z:=psdot;
    Byte2PenStyle:=z;
  end;

{procedure WindowSize(WieGross : Real);
  begin
    with MainForm do begin
      Height:=trunc(Groessen[1]*wiegross);
      Width:=trunc(Groessen[2]*wiegross);
      MenuBevel.Width:=trunc(Groessen[3]*wiegross);
      HorBevel2.Left:=trunc(Groessen[4]*wiegross);
      HorBevel2.Height:=trunc(Groessen[5]*wiegross);
      AktXWertLabel.Left:=trunc(Groessen[6]*wiegross);
      AktIterationLabel.Left:=trunc(Groessen[6]*wiegross);
      IterationsNr.Left:=trunc(Groessen[6]*wiegross);
    end;
  end;}

procedure TMainForm.StartUp(Sender: TObject);
Var Reg : TRegistry;
    W   : String;
  begin
//    WindowSize(1.3);
    ButDrueck:=false;
    MainForm.Caption:='ChaosMathematik '+version+' by Johannes Bauer';
    A_B_Verknuepfung.Hint:=Texte[1];
    A_XQuadrat.Hint:=Texte[2];
    B_X.Hint:=Texte[3];
    C_Zahl.Hint:=Texte[4];
    Iterationen.Hint:=Texte[5];
    BeginnX.Hint:=Texte[6];
    X1Box.Hint:=Texte[7];
    Y1Box.Hint:=Texte[8];
    X2Box.Hint:=Texte[9];
    Y2Box.Hint:=Texte[10];
    ObenButton.Hint:=Texte[11];
    UntenButton.Hint:=Texte[12];
    LinksButton.Hint:=Texte[13];
    RechtsButton.Hint:=Texte[14];
    PlusZoomButton.Hint:=Texte[15];
    MinusZoomButton.Hint:=Texte[16];
    XWertLabel.Hint:=Texte[17];
    Vorheriges.Hint:=Texte[18];
    Naechstes.Hint:=Texte[19];
    IterationsNr.Hint:=Texte[20];
    ZentrierenButton.Hint:=Texte[21];
    CurrShow:=1;
    Label6.Width:=65;

    Reg:=TRegistry.Create;
    Reg.Rootkey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SOFTWARE\ChaosMathematik',true);
      W:=Reg.ReadString('InstallStr');
    Reg.CloseKey;
    if w<>'InnoSetup' then begin
      showmessage('Dieses Programm wurde nicht richtig installiert. Führen sie SETUP.EXE'+#13+
                  'aus, um es erneut zu installieren.'+#13+#13+
                  'Die neuste Version von Chaos-Mathematik bekommen sie unter'+#13+
                  'http://jb.notrix.de'+#13+
                  'oder'+#13+
                  'http://ind.de/joe'+#13+
                  'oder'+#13+
                  'http://www.geocities.com/SiliconValley/Way/1785'+#13+#13+#13+
                  'Bei Fragen eMailen sie mir unter'+#13+
                  'JohannesBauer@gmx.de'+#13+#13+
                  'Vielen Dank für ihr Verständnis'+#13+
                  'Johannes Bauer');
      close;
      exit;
    end;

    RestoreFromReg(3);
    if Benutzer='' then begin
      BenutzerInfoForm.ShowModal;
      WriteInReg(3);
    end;

    if not Reg.KeyExists('SOFTWARE\ChaosMathematik\Farben') then begin
      EditierFelderFarbe:=StandardFarben[1];
      IterationStep1Farbe:=StandardFarben[2];
      IterationStep2Farbe:=StandardFarben[3];
      KoordinatensystemFarbe:=StandardFarben[4];
      ZahlenFarbe:=StandardFarben[5];
      ParabelFarbe:=StandardFarben[6];
      WinkelhalbierendeFarbe:=StandardFarben[7];
      WriteInReg(1);
    end;

    if not Reg.KeyExists('SOFTWARE\ChaosMathematik\Werte') then begin
      X1Box.Text:='-2';
      Y1Box.Text:='-2';
      X2Box.Text:='2';
      Y2Box.Text:='2';
      A_XQuadrat.Text:='-3,4';
      B_X.Text:='4,4';
      C_Zahl.Text:='0';
      A_B_Verknuepfung.Checked:=true;
      Iterationen.Text:='15';
      BeginnX.Text:='0,1';
      Optionen_QuickhelpAnzeigen.Checked:=true;
      WriteInReg(2);
    end;

    if not Reg.KeyExists('SOFTWARE\ChaosMathematik\Pens') then begin
      IterationStep1Form:=Byte2PenStyle(StandardPens[1]);
      IterationStep2Form:=Byte2PenStyle(StandardPens[2]);
      KoordinatenSystemForm:=Byte2PenStyle(StandardPens[3]);
      ParabelForm:=Byte2PenStyle(StandardPens[4]);
      WinkelhalbierendeForm:=Byte2PenStyle(StandardPens[5]);
      WriteInReg(4);
    end;

    if not Reg.KeyExists('SOFTWARE\ChaosMathematik\Rasterung') then begin
      MainForm.Optionen_Rasterung_AnAus.Checked:=true;
      VertikalL:=10;
      HorizontalL:=10;
      RasterungStil:=penstyle2byte(psdot);
      RasterungFarbe:=clsilver;
      Linien:=true;
      WriteInReg(5);
    end;

    RestoreFromReg(1);
    RestoreFromReg(2);
    RestoreFromReg(4);
    RestoreFromReg(5);

    CheckRasterung;
    FarbenReset;
    CheckeBildschirmGroesse;

    CtrlA:=A_XQuadrat.Text;
    CtrlB:=B_X.Text;
    CtrlC:=C_Zahl.Text;
    CtrlD:=Iterationen.Text;
    CtrlE:=BeginnX.Text;
    CtrlF:=IterationsNr.Text;
    CtrlG:=X2Box.Text;
    CtrlH:=Y2Box.Text;
    CtrlI:=X1Box.Text;
    CtrlJ:=Y1Box.Text;

    Zeichne;
  end;

procedure TMainForm.IterationenChange(Sender: TObject);
Var A : Byte;
  begin
    if CheckChg(4) then exit;
    try
      a:=strtoint(iterationen.text);
    except
      a:=0;
    end;
    Iterationen.Text:=IntToStr(a);
    Zeichne;
  end;

procedure TMainForm.NaechstesClick(Sender: TObject);
  begin
    if Optionen_Sounds.Checked then Click.Play;
    inc(CurrShow);
    IterationsNr.Text:=inttostr(currshow);
    Zeichne;
  end;

procedure TMainForm.BeginnXChange(Sender: TObject);
  begin
    if CheckChg(5) then exit;
    Zeichne;
  end;

procedure TMainForm.VorherigesClick(Sender: TObject);
  begin
    if Optionen_Sounds.Checked then Click.Play;
    if CurrShow>1 then begin
      dec(CurrShow);
      IterationsNr.Text:=inttostr(currshow);
      Zeichne;
    end;
  end;

procedure TMainForm.IterationenDurchButtonChange(Sender: TObject;
  var AllowChange: Boolean);
Var A: Byte;
  begin
    try
      a:=strtoint(iterationen.text);
    except
      a:=0;
    end;
    Iterationen.Text:=IntToStr(a);
    Zeichne;
  end;

procedure TMainForm.AchsenbeschriftungChange(Sender: TObject);
  begin
    Zeichne;
  end;

procedure TMainForm.X1Change(Sender: TObject);
Var Temp : Real;
  begin
    if checkchg(9) then exit;
    try
      temp:=strtofloat(x1box.text);
    except
      Status.Panels[0].Text:='Fehler bei Umwandlung von X1!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Fehler bei Umwandlung von X1!');
      x1box.text:=floattostr(trunc(x1*100)/100);
      exit;
    end;
    if temp>0 then begin
      Status.Panels[0].Text:='Linke untere Koordinate muss im 4. Sektor liegen!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Linke untere Koordinate muss im 4. Sektor liegen!');
      x1box.text:=floattostr(trunc(x1*100)/100);
      exit;
    end;
    if temp<=-15 then temp:=-14.9;
    x1:=temp;
    x1box.text:=floattostr(trunc(x1*10)/10);
    Zeichne;
  end;

procedure TMainForm.Y1Change(Sender: TObject);
Var Temp : Real;
  begin
    if CheckChg(10) then exit;
    try
      temp:=strtofloat(y1box.text);
    except
      Status.Panels[0].Text:='Fehler bei Umwandlung von Y1!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Fehler bei Umwandlung von Y1!');
      y1box.text:=floattostr(trunc(y1*100)/100);
      exit;
    end;
    if temp>0 then begin
      Status.Panels[0].Text:='Linke untere Koordinate muss im 4. Sektor liegen!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Linke untere Koordinate muss im 4. Sektor liegen!');
      y1box.text:=floattostr(trunc(y1*100)/100);
      exit;
    end;
    if temp<=-15 then temp:=-14.9;
    y1:=temp;
    y1box.text:=floattostr(trunc(y1*10)/10);
    Zeichne;
  end;

procedure TMainForm.X2Change(Sender: TObject);
Var Temp : Real;
  begin
    if CheckChg(7) then exit;
    try
      temp:=strtofloat(x2box.text);
    except
      Status.Panels[0].Text:='Fehler bei Umwandlung von X2!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Fehler bei Umwandlung von X2!');
      x2box.text:=floattostr(trunc(x2*100)/100);
      exit;
    end;
    if temp<0 then begin
      Status.Panels[0].Text:='Rechte Obere Koordinate muss im 2. Sektor liegen!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Rechte Obere Koordinate muss im 2. Sektor liegen!');
      x2box.text:=floattostr(trunc(x2*100)/100);
      exit;
    end;
    if temp>=15 then temp:=14.9;
    x2:=temp;
    x2box.text:=floattostr(trunc(x2*10)/10);
    Zeichne;
  end;

procedure TMainForm.Y2Change(Sender: TObject);
Var Temp : Real;
  begin
    if CheckChg(8) then exit;
    try
      temp:=strtofloat(y2box.text);
    except
      Status.Panels[0].Text:='Fehler bei Umwandlung von Y2!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Fehler bei Umwandlung von Y2!');
      y2box.text:=floattostr(trunc(y2*100)/100);
      exit;
    end;
    if temp<0 then begin
      Status.Panels[0].Text:='Rechte Obere Koordinate muss im 2. Sektor liegen!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Rechte Obere Koordinate muss im 2. Sektor liegen!');
      y2box.text:=floattostr(trunc(y2*100)/100);
      exit;
    end;
    if temp>=15 then temp:=14.9;
    y2:=temp;
    y2box.text:=floattostr(trunc(y2*10)/10);
    Zeichne;
  end;

procedure XAndYInBoxes;
  begin
    with MainForm do begin
      if x1>=0 then x1:=-0.1;
      if y1>=0 then y1:=-0.1;
      if x2<=0 then x2:=0.1;
      if y2<=0 then y2:=0.1;
      if x1<=-7 then x1:=-6.9;
      if y1<=-7 then y1:=-6.9;
      if x2>=7 then x2:=6.9;
      if y2>=7 then y2:=6.9;
      X1Box.Text:=floattostr(trunc(x1*100)/100);
      X2Box.Text:=floattostr(trunc(x2*100)/100);
      Y1Box.Text:=floattostr(trunc(y1*100)/100);
      Y2Box.Text:=floattostr(trunc(y2*100)/100);
    end;
    Zeichne;
  end;

procedure TMainForm.PlusZoomButtonClick(Sender: TObject);
  begin
    ButDrueck:=true;
    if Optionen_Sounds.Checked then Click.Play;
    X1:=x1+0.3;
    X2:=x2-0.3;
    y1:=y1+0.3;
    y2:=y2-0.3;
    XAndYInBoxes;
//    Zeichne;
  end;

procedure TMainForm.MinusZoomClick(Sender: TObject);
  begin
    ButDrueck:=true;
    if Optionen_Sounds.Checked then Click.Play;
    X1:=x1-0.3;
    X2:=x2+0.3;
    y1:=y1-0.3;
    y2:=y2+0.3;
    XAndYInBoxes;
//    Zeichne;
  end;

procedure TMainForm.LinksClick(Sender: TObject);
  begin
    if Optionen_Sounds.Checked then Click.Play;
    ButDrueck:=true;
    if x2>0.2 then begin
      x1:=x1-0.2;
      x2:=x2-0.2;
    end;
    XAndYInBoxes;
  end;

procedure TMainForm.RechtsClick(Sender: TObject);
  begin
    ButDrueck:=true;
    if Optionen_Sounds.Checked then Click.Play;
    if x1<-0.2 then begin
      x1:=x1+0.2;
      x2:=x2+0.2;
    end;
    XAndYInBoxes;
  end;

procedure TMainForm.UntenClick(Sender: TObject);
  begin
    ButDrueck:=true;
    if Optionen_Sounds.Checked then Click.Play;
    if y2>0.2 then begin
      y1:=y1-0.2;
      y2:=y2-0.2;
    end;
    XAndYInBoxes;
  end;

procedure TMainForm.ObenClick(Sender: TObject);
  begin
    if Optionen_Sounds.Checked then Click.Play;
    ButDrueck:=true;
    if y1<-0.2 then begin
      y1:=y1+0.2;
      y2:=y2+0.2;
    end;
    XAndYInBoxes;
  end;

procedure TMainForm.IterationsNrLeave(Sender: TObject);
Var Temp : Integer;
  begin
    if CheckChg(6) then exit;
    try
      temp:=strtoint(IterationsNr.Text);
    except
      IterationsNr.Text:=inttostr(currshow);
      Status.Panels[0].Text:='Fehler bei Eingabe der Iteration!';
      if Optionen_AlleFehlerAnzeigen.Checked then showmessage('Fehler bei Eingabe der Iteration!');
      exit;
    end;
    currshow:=temp;
    Zeichne;
  end;

procedure TMainForm.C_Change(Sender: TObject);
  begin
    if CheckChg(3) then exit;
    Zeichne;
  end;

procedure SeperatAbfrage;
Var Z : Boolean;
  begin
    with Mainform do begin
      z:=Optionen_IterationenSeperatAnzeigen.Checked;
      Vorheriges.Visible:=z;
      Naechstes.Visible:=z;
      IterationsNr.Visible:=z;
      AktIterationLabel.Visible:=z;
      Bevel4.Visible:=z;
      Bevel8.Visible:=z;
        // *****************************************
      Label11.Visible:=not z;
      Iterationen.Visible:=not z;
      HochRunterFeld.Visible:=not z;
      if Optionen_IterationenSeperatAnzeigen.Checked then begin
        IterationsNr.Text:='1';
        Label12.Top:=256-32;
        BeginnX.Top:=251-32;
        Bevel15.Top:=288-32;
        Vorheriges.Top:=296-32;
        Naechstes.Top:=344-32;
        Bevel4.Top:=384-32;
        // ************************************************
        X1Box.Top:=248;
        Y1Box.Top:=248;
        X2Box.Top:=192;
        Y2Box.Top:=192;
        MiniaturXAchse.Top:=232;
        MiniaturYAchse.Top:=196;
        // ************************************************
      end;
      if not Optionen_IterationenSeperatAnzeigen.Checked then begin
        Label12.Top:=256;
        BeginnX.Top:=251;
        Bevel15.Top:=288;
        // ************************************************
        X1Box.Top:=248-48;
        Y1Box.Top:=248-48;
        X2Box.Top:=192-48;
        Y2Box.Top:=192-48;
        MiniaturXAchse.Top:=232-48;
        MiniaturYAchse.Top:=196-48;
        // ************************************************
      end;
    end;
  end;

procedure TMainForm.Optionen_IterationenSeperatAnzeigenClick(
  Sender: TObject);
  begin
    if Optionen_IterationenSeperatAnzeigen.Checked then
       Optionen_IterationenSeperatAnzeigen.Checked:=false else
       Optionen_IterationenSeperatAnzeigen.Checked:=true;
    SeperatAbfrage;
    CurrShow:=1;
    Zeichne;
  end;

procedure TMainForm.Optionen_FarbenClick(Sender: TObject);
  begin
    ColorForm.ShowModal;
    FarbenReset;
    Zeichne;
  end;

procedure TMainForm.Optionen_AchsenbeschriftungClick(Sender: TObject);
  begin
    if Optionen_Achsenbeschriftung.Checked then
       Optionen_Achsenbeschriftung.Checked:=false else
       Optionen_Achsenbeschriftung.Checked:=true;
    Zeichne;
  end;

procedure TMainForm.Optionen_AlleFehlerAnzeigenClick(Sender: TObject);
  begin
    if Optionen_AlleFehlerAnzeigen.Checked then
       Optionen_AlleFehlerAnzeigen.Checked:=false else
       Optionen_AlleFehlerAnzeigen.Checked:=true;
  end;

procedure TMainForm.Datei_BeendenClick(Sender: TObject);
  begin
    Close;
  end;

procedure CopyRightEinfuegen;
Var Z : String;
  begin
    with MainForm do begin
      Zeichnung.Canvas.Font.Name:='Arial';
      Zeichnung.Canvas.Font.Height:=-15;
      Zeichnung.Canvas.TextOut(x(x1),y(y2),'Erstellt von ChaosMathematik '+version+' by Johannes Bauer');
      z:='f(x)=';
      if trunc(strtofloat(a_xquadrat.text)*100)/100<>0 then begin
        if trunc(strtofloat(a_xquadrat.text)*100)/100=1 then z:=z+'x²'
                                                        else z:=z+a_xquadrat.text+'x²';
      end;

      if trunc(strtofloat(b_x.text)*100)/100<>0 then begin
        if trunc(strtofloat(b_x.text)*100)/100=1        then z:=z+'+x'
                                                        else z:=z+'+'+b_x.text+'x';
        end;

      if trunc(strtofloat(c_zahl.text)*100)/100<>0 then z:=z+'+'+c_zahl.text;

      Zeichnung.Canvas.TextOut(x(x1),y(y1+0.25),z);
    end;
  end;

procedure TMainForm.Datei_AlsBMPSpeichernClick(Sender: TObject);
  begin
    if BMPSave.Execute then begin
      CopyRightEinfuegen;
      Zeichnung.Picture.Graphic.SaveToFile(BMPSave.FileName);
    end;
    ButDrueck:=true;
    Zeichne;
  end;

procedure TMainForm.Bearbeiten_KopierenClick(Sender: TObject);
Var AData, APalette : THandle;
    WieViel         : Word;
  begin
    CopyRightEinfuegen;
    zeichnung.picture.SaveToClipBoardFormat(wieviel,AData,APalette);
    ClipBoard.SetAsHandle(wieviel,AData);
    ButDrueck:=true;
    Zeichne;
  end;

procedure TMainForm.InfoClick(Sender: TObject);
  begin
    InfoForm.ShowModal;
  end;

procedure WriteInReg(i:Byte);
Var Reg : TRegistry;
  begin
    Reg:=TRegistry.Create;
    Reg.Rootkey:=HKEY_LOCAL_MACHINE;
    if (i=1) then begin
      Reg.OpenKey('SOFTWARE\ChaosMathematik\Farben',true);
        Reg.WriteString('Parabel', inttostr(ParabelFarbe));
        Reg.WriteString('Koordinatensystem', inttostr(KoordinatensystemFarbe));
        Reg.WriteString('Koordinatensystembeschreibung', inttostr(zahlenfarbe));
        Reg.WriteString('Winkelhalbierende', inttostr(WinkelhalbierendeFarbe));
        Reg.WriteString('Iteration Stufe 1', inttostr(IterationStep1Farbe));
        Reg.WriteString('Iteration Stufe 2', inttostr(IterationStep2Farbe));
        Reg.WriteString('EditierFelder', inttostr(EditierFelderFarbe));
      Reg.CloseKey;
    end;
    if (i=2) then begin
      with MainForm do begin
        Reg.OpenKey('SOFTWARE\ChaosMathematik\Werte',true);
          Reg.WriteString('A', A_XQuadrat.Text);
          Reg.WriteString('B', B_X.Text);
          Reg.WriteString('C', C_Zahl.Text);
          Reg.WriteBool('A_B_Verknuepfung', a_b_verknuepfung.checked);
          Reg.WriteString('Iterationen', iterationen.text);
          Reg.WriteString('X_Bei_N_Null', beginnx.text);
          Reg.WriteString('Aktuelle_Iteration', iterationsnr.text);
          Reg.WriteBool('IterationsModus',Optionen_IterationenSeperatAnzeigen.Checked);
          Reg.WriteBool('Achsenbeschriftung',Optionen_AchsenBeschriftung.Checked);
          Reg.WriteBool('Debug-Modus',Optionen_AlleFehlerAnzeigen.Checked);
          Reg.WriteBool('Quickhelp',Optionen_QuickHelpAnzeigen.Checked);
          Reg.WriteBool('Sound',Optionen_Sounds.Checked);
          Reg.WriteBool('Grosser Bildschirm',Optionen_GrosserBildschirm.Checked);
        Reg.CloseKey;
        Reg.OpenKey('SOFTWARE\ChaosMathematik\Zoom',true);
          Reg.WriteString('X1', X1Box.Text);
          Reg.WriteString('X2', X2Box.Text);
          Reg.WriteString('Y1', Y1Box.Text);
          Reg.WriteString('Y2', Y2Box.Text);
        Reg.CloseKey;
        Reg.OpenKey('SOFTWARE\ChaosMathematik\User',true);
          Reg.WriteInteger('Benutzungen', benutzungen+1);
        Reg.CloseKey;
      end;
    end;
    if (i=3) then begin
      Reg.OpenKey('SOFTWARE\ChaosMathematik\User',true);
        Reg.WriteString('Benutzername', Benutzer);
      Reg.CloseKey;
    end;
    if (i=4) then begin
      Reg.OpenKey('SOFTWARE\ChaosMathematik\Pens',true);
        Reg.WriteInteger('Parabel',PenStyle2Byte(ParabelForm));
        Reg.WriteInteger('Koordinatensystem',PenStyle2Byte(KoordinatensystemForm));
        Reg.WriteInteger('Winkelhalbierende',PenStyle2Byte(WinkelhalbierendeForm));
        Reg.WriteInteger('Iteration Nr 1',PenStyle2Byte(IterationStep1Form));
        Reg.WriteInteger('Iteration Nr 2',PenStyle2Byte(IterationStep2Form));
      Reg.CloseKey;
    end;
    if (i=5) then begin
      Reg.OpenKey('SOFTWARE\ChaosMathematik\Rasterung',true);
        Reg.WriteBool('Aktiv',MainForm.Optionen_Rasterung_AnAus.Checked);
        Reg.WriteInteger('Vertikale Linien',VertikalL);
        Reg.WriteInteger('Horizontale Linien',HorizontalL);
        Reg.WriteInteger('Linienstil',RasterungStil);
        Reg.WriteInteger('Farbe',RasterungFarbe);
        Reg.WriteBool('Linien Aktiv',Linien);
      Reg.CloseKey;
    end;
  end;

procedure TMainForm.ProgrammBeenden(Sender: TObject;
  var CanClose: Boolean);
  begin
    WriteInReg(2);
    Canclose:=true;
  end;

procedure TMainForm.BewegeMaus(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
Var X2, Y2 : Real;
  begin
    XKoordinate.Caption:=RevX(X);
    YKoordinate.Caption:=RevY(Y);
    X2:=StrToFloat(Revx(x));
    y2:=StrToFloat(revy(y));
    if x2<0 then XKoordinate.Color:=clred
            else XKoordinate.Color:=clgreen;
    if y2<0 then YKoordinate.Color:=clred
            else YKoordinate.Color:=clgreen;
    if (x2<0) and (y2>0) then Sektor.Caption:='1. Sektor';
    if (x2>0) and (y2>0) then Sektor.Caption:='2. Sektor';
    if (x2>0) and (y2<0) then Sektor.Caption:='3. Sektor';
    if (x2<0) and (y2<0) then Sektor.Caption:='4. Sektor';
  end;

procedure TMainForm.MouseAufForm(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  begin
    XKoordinate.Caption:='';
    YKoordinate.Caption:='';
    Sektor.Caption:=''
  end;

procedure TMainForm.ZentrierenButtonClick(Sender: TObject);
Var XKoord, YKoord, A, B, C : Real;
  begin
    if Optionen_Sounds.Checked then Click.Play;
    ButDrueck:=true;
    a:=strtofloat(a_xquadrat.text);
    b:=strtofloat(b_x.text);
    c:=strtofloat(c_zahl.text);
    xkoord:=-((b)/(2*a));
    ykoord:=-(((sqr(b))/(4*a))-c);
    x1:=xkoord-(1.4+(xkoord/3.5));
    x2:=xkoord+(1.4+(xkoord/3.5));
    y1:=ykoord-(1.4+(ykoord/3.5));
    y2:=ykoord+(1.4+(ykoord/3.5));
    if x1>=0 then x1:=-0.01;
    if y1>=0 then x1:=-0.01;
    if x2<=0 then x2:=0.01;
    if y2<=0 then y2:=0.01;
    x1box.text:=round(x1);
    x2box.text:=round(x2);
    y1box.text:=round(y1);
    y2box.text:=round(y2);
    Zeichne;
  end;

procedure SetzeQuickHelp;
  begin
    with MainForm do begin
      A_B_Verknuepfung.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      A_XQuadrat.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      B_X.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      C_Zahl.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      Iterationen.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      BeginnX.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      X1Box.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      Y1Box.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      X2Box.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      Y2Box.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      ObenButton.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      UntenButton.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      LinksButton.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      RechtsButton.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      PlusZoomButton.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      MinusZoomButton.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      XWertLabel.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      Vorheriges.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      Naechstes.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      IterationsNr.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
      ZentrierenButton.ShowHint:=Optionen_QuickHelpAnzeigen.Checked;
    end;
  end;

procedure TMainForm.Optionen_QuickHelpAnzeigenClick(Sender: TObject);
  begin
    if Optionen_QuickHelpAnzeigen.Checked then
       Optionen_QuickHelpAnzeigen.Checked:=false else
       Optionen_QuickHelpAnzeigen.Checked:=true;
    SetzeQuickHelp;
  end;

procedure TMainForm.Hilfe_HilfeClick(Sender: TObject);
  begin
    Application.HelpFile := 'Chaos-Mathematik.HLP';
    Application.HelpJump('');
  end;

procedure TMainForm.Optionen_Rasterung_EinstellungenClick(Sender: TObject);
  begin
    RasterungForm.ShowModal;
    WriteInReg(5);
    CheckRasterung;
    Zeichne;
  end;

procedure TMainForm.Optionen_Rasterung_AnAusClick(Sender: TObject);
  begin
    if Optionen_Rasterung_AnAus.Checked then
       Optionen_Rasterung_AnAus.Checked:=false else
       Optionen_Rasterung_AnAus.Checked:=true;
    WriteInReg(5);
    CheckRasterung;
    Zeichne;
  end;

procedure TMainForm.Optionen_SoundsClick(Sender: TObject);
  begin
    If Optionen_Sounds.Checked then Optionen_Sounds.Checked:=false else
                                    Optionen_Sounds.Checked:=true;
  end;

procedure CheckeBildschirmGroesse;
  begin
    with MainForm do begin
      if Optionen_GrosserBildschirm.Checked then SwapDisplay(2) else
                                                 SwapDisplay(1);
    end;
  end;

procedure TMainForm.Optionen_GrosserBildschirmClick(Sender: TObject);
  begin
    if Optionen_GrosserBildschirm.Checked then Optionen_GrosserBildschirm.Checked:=false else
                                               Optionen_GrosserBildschirm.Checked:=true;
    CheckeBildschirmGroesse;
    Zeichne;
  end;
procedure TMainForm.FeigenBaumDiagrammClick(Sender: TObject);
  begin
    FeigenBaumForm.ShowModal;
  end;

end.
