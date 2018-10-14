unit TextUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TTextForm = class(TForm)
    Label1: TLabel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TextForm: TTextForm;

const Texte : Array[1..21] of String =
('Wenn dieses Feld aktiviert ist, wird A in Abhängigkeit von B und'+#13+
 'B in Abhängkeit von A berechnet, und zwar nach der Formel b=/a/+1',

 'Wert von a in der Parabelfunktion f(x)=ax²+bx+c',

 'Wert von b in der Parabelfunktion f(x)=ax²+bx+c',

 'Wert von c in der Parabelfunktion f(x)=ax²+bx+c',

 'Anzahl der Wiederholungen (=Iterationen) bis zum Ende der Chaos-'+#13+
 'grafik',

 'An diesem Wert der x-Achse wird bei n=0 begonnen (nach oben zur'+#13+
 'Parabel gezeichnet',

 'Der X-Wert der Koordinate links unten',

 'Der Y-Wert der Koordinate links unten',

 'Der X-Wert der Koordinate rechts oben',

 'Der Y-Wert der Koordinate rechts oben',

 'Weiter nach oben schauen',

 'Weiter nach unten schauen',

 'Weiter nach links schauen',

 'Weiter nach rechts schauen',

 'Hereinzoomen',

 'Herauszoomen',

 'Zeigt den aktuellen X-Wert an',

 'Zeigt eine Iteration weniger an',

 'Zeigt eine Iteration mehr an',

 'Zeigt an, welche die aktuelle Iteration ist (änderbar)',

 'Parabel zentieren'

 );

Const StandardFarben : Array [1..7] of TColor =
( 33612032,               { 1=Editierfelder                 }
  16384,                  { 2=Iteration 1                   }
  8421376,                { 3=Iteration 2                   }
  128,                    { 4=Koordinatensystem             }
  4194432,                { 5=Koordinatensystembeschriftung }
  32768,                  { 6=Parabel                       }
  12632256                { 7=Winkelhalbierende             });

Const StandardPens    : Array[1..6] of Byte =
( 1,
  3,
  2,
  1,
  3,
  1);

implementation


{$R *.DFM}

end.
