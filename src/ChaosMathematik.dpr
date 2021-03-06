program ChaosMathematik;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ColorUnit in 'ColorUnit.pas' {ColorForm},
  TextUnit in 'TextUnit.pas' {TextForm},
  InfoUnit in 'InfoUnit.pas' {InfoForm},
  UserInformationenUnit in 'UserInformationenUnit.pas' {BenutzerInfoForm},
  PenUnit in 'PenUnit.pas' {PenForm},
  RasterungUnit in 'RasterungUnit.pas' {RasterungForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Chaos-Mathematik';
  Application.HelpFile := 'C:\Win95\utils\Delphi 3\Projekte\ChaosMathematik\Chaos-Mathematik.hlp';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TColorForm, ColorForm);
  Application.CreateForm(TTextForm, TextForm);
  Application.CreateForm(TInfoForm, InfoForm);
  Application.CreateForm(TBenutzerInfoForm, BenutzerInfoForm);
  Application.CreateForm(TPenForm, PenForm);
  Application.CreateForm(TRasterungForm, RasterungForm);
  Application.Run;
end.
