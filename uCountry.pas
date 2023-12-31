unit uCountry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.FMTBcd, Data.DB,
  Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  TfrmCountries = class(TForm)
    lblCountry: TLabel;
    lblCapital: TLabel;
    lblContinent: TLabel;
    fdConnection: TFDConnection;
    fdTransaction: TFDTransaction;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qCountries: TFDQuery;
    dsCountries: TDataSource;
    qCountriesCOUNTRYID: TIntegerField;
    qCountriesNAME: TStringField;
    qCountriesCAPITAL: TStringField;
    qCountriesCONTINENT: TStringField;
    qCountriesPOPULATION: TIntegerField;
    dbCountry: TDBEdit;
    dbCapital: TDBEdit;
    dbContinent: TDBEdit;
    dbnCountries: TDBNavigator;
    lblPopulation: TLabel;
    dbPopulation: TDBEdit;
    dbArea: TDBEdit;
    lblArea: TLabel;
    qCountriesAREA: TFMTBCDField;
    lblDensity: TLabel;
    dbDensity: TDBEdit;
    qCountriesDensity: TFloatField;
    rdbContinent: TRadioGroup;
    grbSearch: TGroupBox;
    cmbSearch: TComboBox;
    lblSearch: TLabel;
    dbSearch: TEdit;
    lblChooseOption: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qCountriesCalcFields(DataSet: TDataSet);
    procedure rdbContinentClick(Sender: TObject);
    procedure dbSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCountries: TfrmCountries;

implementation

{$R *.dfm}

procedure TfrmCountries.dbSearchChange(Sender: TObject);
begin
  if cmbSearch.ItemIndex <> -1 then
    begin
      qCountries.Close;
      qCountries.SQL.Clear;
      qCountries.SQL.Add('SELECT * FROM COUNTRY');
      qCountries.SQL.Add(' WHERE ' + cmbSearch.Text + ' LIKE ' + #39 + '%' + dbSearch.Text + '%' + #39);

      if rdbContinent.ItemIndex <> 0 then
        begin
          qCountries.SQL.Add(' AND CONTINENT = ' + #39 + rdbContinent.Items[rdbContinent.ItemIndex] + #39);
        end;

      qCountries.Open;
    end;
end;

procedure TfrmCountries.FormActivate(Sender: TObject);
begin
  qCountries.Open;
end;

procedure TfrmCountries.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qCountries.Close;
end;

procedure TfrmCountries.qCountriesCalcFields(DataSet: TDataSet);
begin
  qCountriesDensity.AsFloat := qCountriesPOPULATION.AsFloat / qCountriesAREA.AsFloat;
end;

procedure TfrmCountries.rdbContinentClick(Sender: TObject);
begin
  qCountries.Close;
  qCountries.SQL.Clear;

  qCountries.SQL.Add('SELECT * FROM COUNTRY');

  if rdbContinent.ItemIndex <> 0 then
    qCountries.SQL.Add(' WHERE CONTINENT = ' + #39 + rdbContinent.Items[rdbContinent.ItemIndex] + #39);

  qCountries.Open;
end;

end.
