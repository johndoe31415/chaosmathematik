unit ColorUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TColorForm = class(TForm)
    ParabelDialog: TColorDialog;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    ParabelTestFeld: TPanel;
    ParabelChange: TBitBtn;
    OkayButton: TBitBtn;
    Label3: TLabel;
    KoordinatensystemDialog: TColorDialog;
    KoordinatenSystemTestFeld: TPanel;
    KoordinatenSystemChange: TBitBtn;
    Label4: TLabel;
    WinkelhalbierendeDialog: TColorDialog;
    WinkelhalbierendeTestFeld: TPanel;
    WinkelhalbierendeChange: TBitBtn;
    Label5: TLabel;
    IterationStep1Dialog: TColorDialog;
    IterationStep1TestFeld: TPanel;
    IterationStep1Change: TBitBtn;
    Label6: TLabel;
    IterationStep2Dialog: TColorDialog;
    IterationStep2TestFeld: TPanel;
    IterationStep2Change: TBitBtn;
    Label7: TLabel;
    ZahlenDialog: TColorDialog;
    ZahlenTestFeld: TPanel;
    ZahlenChange: TBitBtn;
    Bevel2: TBevel;
    Label8: TLabel;
    EditierFelderTestFeld: TPanel;
    EditierFelderChange: TBitBtn;
    EditierFelderDialog: TColorDialog;
    StandardEinstellungen: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    FParabelChange: TBitBtn;
    FParabelTest: TImage;
    FKoordinatensystemChange: TBitBtn;
    FWinkelhalbierendeChange: TBitBtn;
    FIterationStep1Change: TBitBtn;
    FIterationStep2Change: TBitBtn;
    FKoordinatensystemTest: TImage;
    FWinkelhalbierendeTest: TImage;
    FIterationStep1Test: TImage;
    FIterationStep2Test: TImage;
    Bevel3: TBevel;
    procedure StartUp(Sender: TObject);
    procedure ParabelChangeClick(Sender: TObject);
    procedure KoordinatenSystemChangeClick(Sender: TObject);
    procedure WinkelhalbierendeChangeClick(Sender: TObject);
    procedure IterationStep1ChangeClick(Sender: TObject);
    procedure IterationStep2ChangeClick(Sender: TObject);
    procedure ZahlenChangeClick(Sender: TObject);
    procedure OkayButtonClick(Sender: TObject);
    procedure EditierFelderChangeClick(Sender: TObject);
    procedure StandardEinstellungenClick(Sender: TObject);
    procedure FParabelChangeClick(Sender: TObject);
    procedure FKoordinatensystemChangeClick(Sender: TObject);
    procedure FWinkelhalbierendeChangeClick(Sender: TObject);
    procedure FIterationStep1ChangeClick(Sender: TObject);
    procedure FIterationStep2ChangeClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  ColorForm: TColorForm;

implementation

uses MainUnit, PenUnit, TextUnit;

{$R *.DFM}

Procedure TestFelderAktualisieren;
  begin
    with ColorForm do begin
      ParabelTestFeld.Color:=ParabelFarbe;
      WinkelhalbierendeTestFeld.Color:=WinkelhalbierendeFarbe;
      KoordinatensystemTestFeld.Color:=KoordinatensystemFarbe;
      IterationStep1TestFeld.Color:=IterationStep1Farbe;
      IterationStep2TestFeld.Color:=IterationStep2Farbe;
      ZahlenTestFeld.Color:=ZahlenFarbe;
      EditierFelderTestFeld.Color:=EditierFelderFarbe;


      with FParabelTest.Canvas do begin
        Pen.Color:=ParabelFarbe;
        Pen.Style:=ParabelForm;
        Moveto(0,12);
        LineTo(50,12);
      end;

      With FKoordinatensystemTest.Canvas do begin
        Pen.Color:=KoordinatensystemFarbe;
        Pen.Style:=KoordinatensystemForm;
        Moveto(0,12);
        LineTo(50,12);
      end;

      With FWinkelhalbierendeTest.Canvas do begin
        Pen.Color:=WinkelhalbierendeFarbe;
        Pen.Style:=WinkelhalbierendeForm;
        Moveto(0,12);
        LineTo(50,12);
      end;

      With FIterationStep1Test.Canvas do begin
        Pen.Color:=IterationStep1Farbe;
        Pen.Style:=IterationStep1Form;
        Moveto(0,12);
        LineTo(50,12);
      end;

      With FIterationStep2Test.Canvas do begin
        Pen.Color:=IterationStep2Farbe;
        Pen.Style:=IterationStep2Form;
        Moveto(0,12);
        LineTo(50,12);
      end;

    end;
  end;

procedure Beginn;
  begin
    with ColorForm do begin
      Label7.Caption:=Cr(Label7.Caption);
      ParabelDialog.Color:=ParabelFarbe;
      WinkelhalbierendeDialog.Color:=WinkelhalbierendeFarbe;
      KoordinatensystemDialog.Color:=KoordinatensystemFarbe;
      IterationStep1Dialog.Color:=IterationStep1Farbe;
      IterationStep2Dialog.Color:=IterationStep2Farbe;
      ZahlenDialog.Color:=ZahlenFarbe;
      EditierFelderDialog.Color:=EditierFelderFarbe;
      TestFelderAktualisieren;
    end;
  end;

procedure TColorForm.StartUp(Sender: TObject);
  begin
    Beginn;
  end;

procedure TColorForm.ParabelChangeClick(Sender: TObject);
  begin
    If ParabelDialog.Execute then ParabelFarbe:=ParabelDialog.Color;
    TestFelderAktualisieren;
  end;

procedure TColorForm.KoordinatenSystemChangeClick(Sender: TObject);
  begin
    If KoordinatensystemDialog.Execute then KoordinatensystemFarbe:=KoordinatensystemDialog.Color;
    TestFelderAktualisieren;
  end;

procedure TColorForm.WinkelhalbierendeChangeClick(Sender: TObject);
  begin
    If WinkelhalbierendeDialog.Execute then WinkelhalbierendeFarbe:=WinkelhalbierendeDialog.Color;
    TestFelderAktualisieren;
  end;

procedure TColorForm.IterationStep1ChangeClick(Sender: TObject);
  begin
    If IterationStep1Dialog.Execute then IterationStep1Farbe:=IterationStep1Dialog.Color;
    TestFelderAktualisieren;
  end;

procedure TColorForm.IterationStep2ChangeClick(Sender: TObject);
  begin
    If IterationStep2Dialog.Execute then IterationStep2Farbe:=IterationStep2Dialog.Color;
    TestFelderAktualisieren;
  end;

procedure TColorForm.ZahlenChangeClick(Sender: TObject);
  begin
    If ZahlenDialog.Execute then ZahlenFarbe:=ZahlenDialog.Color;
    TestFelderAktualisieren;
  end;


procedure TColorForm.EditierFelderChangeClick(Sender: TObject);
  begin
    If EditierFelderDialog.Execute then EditierFelderFarbe:=EditierFelderDialog.Color;
    TestFelderAktualisieren;
  end;

procedure TColorForm.OkayButtonClick(Sender: TObject);
  begin
    writeinreg(1);
    writeinreg(4);
    close;
  end;

procedure TColorForm.StandardEinstellungenClick(Sender: TObject);
Var I : Byte;
  begin
    i:=application.messagebox('Sind sie sicher dass sie alles auf den Standard zurücksetzten wollen?','Original-Einstellung wiederherstellen',4);
    if (i=idno) then exit;

    EditierFelderFarbe:=StandardFarben[1];
    IterationStep1Farbe:=StandardFarben[2];
    IterationStep2Farbe:=StandardFarben[3];
    KoordinatensystemFarbe:=StandardFarben[4];
    ZahlenFarbe:=StandardFarben[5];
    ParabelFarbe:=StandardFarben[6];
    WinkelhalbierendeFarbe:=StandardFarben[7];

    IterationStep1Form:=Byte2PenStyle(StandardPens[1]);
    IterationStep2Form:=Byte2PenStyle(StandardPens[2]);
    KoordinatenSystemForm:=Byte2PenStyle(StandardPens[3]);
    ParabelForm:=Byte2PenStyle(StandardPens[4]);
    WinkelhalbierendeForm:=Byte2PenStyle(StandardPens[5]);

    TestFelderAktualisieren;
    Beginn;
  end;

function SelectForm:TPenStyle;
Var F : TPenStyle;
    O : Byte;
  begin
    penform.showmodal;
    o:=back;
    f:=byte2penstyle(o);
    SelectForm:=f;
  end;

procedure TColorForm.FParabelChangeClick(Sender: TObject);
Var F: TPenStyle;
  begin
    f:=SelectForm;
    if back<>4 then ParabelForm:=f;
    TestFelderAktualisieren;
  end;

procedure TColorForm.FKoordinatensystemChangeClick(Sender: TObject);
Var F: TPenStyle;
  begin
    f:=SelectForm;
    if back<>4 then KoordinatensystemForm:=f;
    TestFelderAktualisieren;
  end;

procedure TColorForm.FWinkelhalbierendeChangeClick(Sender: TObject);
Var F: TPenStyle;
  begin
    f:=SelectForm;
    if back<>4 then WinkelhalbierendeForm:=f;
    TestFelderAktualisieren;
  end;

procedure TColorForm.FIterationStep1ChangeClick(Sender: TObject);
Var F: TPenStyle;
  begin
    f:=SelectForm;
    if back<>4 then IterationStep1Form:=f;
    TestFelderAktualisieren;
  end;

procedure TColorForm.FIterationStep2ChangeClick(Sender: TObject);
Var F: TPenStyle;
  begin
    f:=SelectForm;
    if back<>4 then IterationStep2Form:=f;
    TestFelderAktualisieren;
  end;

end.
