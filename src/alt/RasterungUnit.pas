unit RasterungUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TRasterungForm = class(TForm)
    Horizontal: TTrackBar;
    Vertikal: TTrackBar;
    HorizontalNr: TGroupBox;
    VertikalNr: TGroupBox;
    FarbPanel: TPanel;
    Farbbutton: TBitBtn;
    GroupBox4: TGroupBox;
    FormButton: TBitBtn;
    GroupBox5: TGroupBox;
    OkayButton: TBitBtn;
    RasAktiv: TRadioGroup;
    RasTyp: TRadioGroup;
    FormPanel: TImage;
    Bevel1: TBevel;
    Grau: TImage;
    Weiss: TImage;
    FarbDialog: TColorDialog;
    Bevel2: TBevel;
    Label1: TLabel;
    Bevel3: TBevel;
    StandardEinstellungen: TBitBtn;
    procedure StartUp(Sender: TObject);
    procedure ActiveChange(Sender: TObject);
    procedure RasTypChange(Sender: TObject);
    procedure HorChg(Sender: TObject);
    procedure VerChg(Sender: TObject);
    procedure FarbbuttonClick(Sender: TObject);
    procedure OkayButtonClick(Sender: TObject);
    procedure FormButtonClick(Sender: TObject);
    procedure StandardEinstellungenClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  RasterungForm: TRasterungForm;

implementation

uses MainUnit, PenUnit;

{$R *.DFM}

procedure PruefeAktivitaet;
  begin
    with RasterungForm do begin
      RasTyp.Enabled:=true;
      Farbbutton.Enabled:=true;
      FormButton.Enabled:=true;
      Horizontal.Enabled:=true;
      Vertikal.Enabled:=true;

      if not (RasAktiv.Itemindex=0) then begin
        RasTyp.Enabled:=false;
        Farbbutton.Enabled:=false;
        FarbPanel.Color:=clSilver;
        FormButton.Enabled:=false;
//        FormPanel.Color:=clSilver;
        Horizontal.Enabled:=false;
        Vertikal.Enabled:=false;
      end;
      if not (RasTyp.ItemIndex=1) then begin
        FormButton.Enabled:=false;
//        FormPanel.Color:=clSilver;
      end;

      try
        HorizontalNr.Caption:='Anzahl horizontaler '+RasTyp.Items[RasTyp.ItemIndex]+': '+inttostr(horizontal.position);
        VertikalNr.Caption:='Anzahl vertikaler '+RasTyp.Items[RasTyp.ItemIndex]+': '+inttostr(vertikal.position);
      except end;

    if (RasTyp.ItemIndex=1) then begin
    FormPanel.Picture:=Weiss.Picture;
      with FormPanel.Canvas do begin
        Pen.Color:=RasterungFarbe;
        Pen.Style:=Byte2PenStyle(rasterungstil);
        Moveto(0,16);
        LineTo(81,16);
      end;
    end else begin
      FormPanel.Picture:=Grau.Picture;
    end;

    FarbPanel.Color:=RasterungFarbe;

    end;
  end;

procedure TRasterungForm.StartUp(Sender: TObject);
  begin
    if MainForm.Optionen_Rasterung_AnAus.Checked then
                           RasAktiv.Itemindex:=0 else
                           RasAktiv.Itemindex:=1;
    if Linien then RasTyp.ItemIndex:=1 else
                   RasTyp.ItemIndex:=0;

    Horizontal.Position:=horizontall;
    vertikal.Position:=vertikall;


    pruefeaktivitaet;

  end;

procedure TRasterungForm.ActiveChange(Sender: TObject);
  begin
    PruefeAktivitaet;
  end;

procedure TRasterungForm.RasTypChange(Sender: TObject);
  begin
    PruefeAktivitaet;
  end;

procedure TRasterungForm.HorChg(Sender: TObject);
  begin
    PruefeAktivitaet;
  end;

procedure TRasterungForm.VerChg(Sender: TObject);
  begin
    PruefeAktivitaet;
  end;

procedure TRasterungForm.FarbbuttonClick(Sender: TObject);
  begin
    FarbDialog.Color:=rasterungfarbe;
    If FarbDialog.Execute then RasterungFarbe:=FarbDialog.Color;
    PruefeAktivitaet;
  end;

procedure TRasterungForm.OkayButtonClick(Sender: TObject);
  begin
    Linien:=(RasTyp.ItemIndex=1);
    MainForm.Optionen_Rasterung_AnAus.Checked:=(RasAktiv.ItemIndex=0);
    HorizontalL:=Horizontal.Position;
    VertikalL:=Vertikal.Position;
    Close;
  end;

procedure TRasterungForm.FormButtonClick(Sender: TObject);
  begin
    PenForm.ShowModal;
    if Back<>4 then RasterungStil:=Back;
    PruefeAktivitaet;
  end;

procedure TRasterungForm.StandardEinstellungenClick(Sender: TObject);
Var I : Byte;
  begin
    i:=application.messagebox('Wollen sie wirklich die Standardeinstellungen wiederherstellen?', 'Sicherheitsbestätigung', 4);
    if (i=idno) then exit;
    MainForm.Optionen_Rasterung_AnAus.Checked:=true;
    VertikalL:=10;
    HorizontalL:=10;
    Horizontal.Position:=10;
    Vertikal.Position:=10;
    RasterungStil:=penstyle2byte(psdot);
    RasterungFarbe:=clsilver;
    Linien:=true;
    RasTyp.ItemIndex:=1;
    PruefeAktivitaet;
  end;

end.
