unit FeigenBaumUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFeigenBaumForm = class(TForm)
    FeigenBaumZeichnung: TImage;
    ZeichnenButton: TBitBtn;
    Status: TStatusBar;
    AbbruchButton: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    A1: TEdit;
    Label2: TLabel;
    B: TEdit;
    Label3: TLabel;
    C: TEdit;
    Label4: TLabel;
    A2: TEdit;
    procedure ZeichnenButtonClick(Sender: TObject);
    procedure AbbruchButtonClick(Sender: TObject);
    procedure StartUp(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var FeigenBaumForm : TFeigenBaumForm;
    FX1, FX2, FY1,
    FY2            : Real;
    BreakCalc      : Boolean;

implementation

uses MainUnit;

{$R *.DFM}

function X(i:real):integer;
Var C, Breite, Faktor : Real;
  begin
    Breite:=Fx2-Fx1;
    Faktor:=FeigenBaumForm.FeigenBaumZeichnung.Width/Breite;
    c:=i+abs(Fx1);
    c:=c*Faktor;
    x:=trunc(c);
  end;

function Y(i:real):integer;
Var C, Hoehe, Faktor : Real;
  begin
    Hoehe:=Fy2-Fy1;
    Faktor:=FeigenBaumForm.FeigenBaumZeichnung.Height/Hoehe;
    c:=i+abs(Fy1);
    c:=c*Faktor;
    c:=FeigenBaumForm.FeigenBaumZeichnung.Height-c;
    y:=trunc(c);
  end;

procedure Line(x12,y12,x22,y22:Real);
  begin
    with FeigenBaumForm.FeigenBaumZeichnung.Canvas do begin
      moveto(x(x12),y(y12));
      lineto(x(x22),y(y22));
    end;
  end;

procedure Punkt(PX,PY:Real);
  begin
    with FeigenBaumForm.FeigenBaumZeichnung.Canvas do begin
      moveto(x(PX),y(PY));
      lineto(x(PX)+1,y(PY)+1);
    end;
  end;

procedure Linie(PX1,PY1,PX2,PY2:Real);
  begin
    with FeigenBaumForm.FeigenBaumZeichnung.Canvas do begin
      moveto(x(PX1),y(PY1));
      lineto(x(PX2),y(PY2));
    end;
  end;

procedure TFeigenBaumForm.ZeichnenButtonClick(Sender: TObject);
Var C             : LongInt;
    T, PX, PY,
    FB, FC        : Real;
    INr, Cnt, T1,
    T2            : Byte;
    SaveVal       : Array[1..300] of Real;
    D             : TextFile;
    DumpPro       : Boolean;
    MaxI, Z       : Word;
  begin
    DumpPro:=false;
    BreakCalc:=false;
    with FeigenBaumForm.FeigenBaumZeichnung.Canvas do begin
      Pen.Style:=psSolid;
      Pen.Mode:=pmBlack;
      Pen.Width:=1;
      Update;
    end;

    if dumppro then assignfile(d,'c:\dump');
    if dumppro then rewrite(d);

    MaxI:=300;          {Maximale Anzahl auszuführender Iterationen}

    FX1:=-5;            {Koordinatensystemausmasse}
    FX2:=0.1;
    FY1:=-2;
    FY2:=5;

    Linie(FX1,0,FX2,0);
    Linie(0,FY1,0,FY2);

    px:=0.1;            {Beginn auf X-Achse}
    py:=0;

    FB:=0.3;            {Parabelwerte b & c}
    FC:=1;

    Status.Panels[0].Text:='Zeichne...';
    AbbruchButton.Enabled:=true;
    for c:=50000 downto 30000 do begin
      t:=-c/10000;

      if c mod 150=0 then begin
        Status.Panels[0].Text:='Bin bei '+floattostr(trunc(t*1000)/1000);
        Application.ProcessMessages;
      end;
      if BreakCalc then begin
        Status.Panels[0].Text:='Abbruch bei '+floattostr(trunc(t*1000)/1000);
        exit;
      end;
      px:=0.1;
      py:=0;
      for z:=1 to MaxI do begin
//        py:=(sqr(t)*fa)+(t*fb)+fc;
// a soll t sein, weil die Parabel durchgehend verändert wird
// b und c sind gegeben
// was ist x?? vielleicht zuerst das 0.1, dann immer y? also px?
        py:=(t*sqr(px))+(fb*px)+(fc);
        if (py<-100) or (py>100) then break;

        saveval[z]:=py;
        for t1:=1 to z-1 do begin
          if dumppro then writeln(d,'Vergleiche '+floattostr(saveval[z])+' und '+floattostr(saveval[t1]));
          if dumppro then writeln(d,'Abweichung: '+floattostr(abs(saveval[z]-saveval[t1])));
          if abs(saveval[z]-saveval[t1])<0.001 then begin
             for t2:=t1 to z do begin
               punkt(t,saveval[t2]);
               if dumppro then writeln(d,'Punkt bei '+floattostr(t)+'|'+floattostr(saveval[t2]));
            end;
          end;
        end;

        //        showmessage(floattostr(t)+#13+floattostr(w2));
{        showmessage('c='+inttostr(c)+#13+
                    't='+floattostr(t)+#13+
                    'z='+inttostr(z)+#13+
                    'w2='+floattostr(w2)+#13);}

        if dumppro then writeln(d,'X: '+floattostr(px));
        if dumppro then writeln(d,'Y: '+floattostr(py));
        if dumppro then writeln(d);
        px:=py;
      end;
//    punkt(t,w2);
    end;
    if dumppro then closefile(d);
    AbbruchButton.Enabled:=false;
    Status.Panels[0].Text:='Zeichnung beendet.';
  end;


procedure TFeigenBaumForm.AbbruchButtonClick(Sender: TObject);
  begin
    AbbruchButton.Enabled:=false;
    BreakCalc:=true;
  end;

procedure TFeigenBaumForm.StartUp(Sender: TObject);
  begin
    A1.Text:=MainForm.A_XQuadrat.Text;
    A2.Text:=MainForm.A_XQuadrat.Text;
    B.Text:=MainForm.B_X.Text;
    C.Text:=MainForm.C_Zahl.Text;
  end;

end.
