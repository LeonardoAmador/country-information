program country;

uses
  Vcl.Forms,
  uCountry in '..\uCountry.pas' {frmCountries};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCountries, frmCountries);
  Application.Run;
end.
