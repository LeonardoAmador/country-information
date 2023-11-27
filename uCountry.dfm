object frmCountries: TfrmCountries
  Left = 0
  Top = 0
  Caption = 'Countries'
  ClientHeight = 432
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object lblCountry: TLabel
    Left = 24
    Top = 16
    Width = 83
    Height = 24
    Caption = 'Country:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Roboto Lt'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCapital: TLabel
    Left = 24
    Top = 56
    Width = 76
    Height = 24
    Caption = 'Capital:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Roboto Lt'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblContinent: TLabel
    Left = 24
    Top = 128
    Width = 101
    Height = 24
    Caption = 'Continent:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Roboto Lt'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPopulation: TLabel
    Left = 24
    Top = 168
    Width = 112
    Height = 24
    Caption = 'Population:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Roboto Lt'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblArea: TLabel
    Left = 24
    Top = 91
    Width = 51
    Height = 24
    Caption = 'Area:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Roboto Lt'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDensity: TLabel
    Left = 24
    Top = 209
    Width = 79
    Height = 24
    Caption = 'Density:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Roboto Lt'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbCountry: TDBEdit
    Left = 144
    Top = 20
    Width = 121
    Height = 23
    DataField = 'NAME'
    DataSource = dsCountries
    TabOrder = 0
  end
  object dbCapital: TDBEdit
    Left = 144
    Top = 60
    Width = 121
    Height = 23
    DataField = 'CAPITAL'
    DataSource = dsCountries
    TabOrder = 1
  end
  object dbContinent: TDBEdit
    Left = 144
    Top = 132
    Width = 121
    Height = 23
    DataField = 'CONTINENT'
    DataSource = dsCountries
    TabOrder = 2
  end
  object dbnCountries: TDBNavigator
    Left = 24
    Top = 256
    Width = 240
    Height = 25
    DataSource = dsCountries
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 3
  end
  object dbPopulation: TDBEdit
    Left = 144
    Top = 172
    Width = 121
    Height = 23
    DataField = 'POPULATION'
    DataSource = dsCountries
    TabOrder = 4
  end
  object dbArea: TDBEdit
    Left = 144
    Top = 95
    Width = 121
    Height = 23
    DataField = 'AREA'
    DataSource = dsCountries
    TabOrder = 5
  end
  object dbDensity: TDBEdit
    Left = 144
    Top = 213
    Width = 121
    Height = 23
    DataField = 'Density'
    DataSource = dsCountries
    ImeName = 'Portuguese (Brazilian ABNT)'
    TabOrder = 6
  end
  object rdbContinent: TRadioGroup
    Left = 288
    Top = 20
    Width = 240
    Height = 216
    Caption = 'Search by Continent:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Roboto'
    Font.Style = []
    Items.Strings = (
      'All'
      'Am'#233'rica do Sul'
      'Am'#233'rica do Norte'
      #193'sia'
      'Europa/'#193'sia'
      #193'frica'
      'Oceania')
    ParentFont = False
    TabOrder = 7
    OnClick = rdbContinentClick
  end
  object fdConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\amado\Documents\Embarcadero\Studio\Projects\db' +
        '\COUNTRY.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=Localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 152
    Top = 328
  end
  object fdTransaction: TFDTransaction
    Connection = fdConnection
    Left = 256
    Top = 328
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 368
    Top = 328
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 488
    Top = 328
  end
  object qCountries: TFDQuery
    OnCalcFields = qCountriesCalcFields
    ChangeAlertName = 'qCountries'
    Connection = fdConnection
    SQL.Strings = (
      'SELECT * FROM country'
      'ORDER BY CountryId;')
    Left = 152
    Top = 384
    object qCountriesCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCountriesNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 100
    end
    object qCountriesCAPITAL: TStringField
      FieldName = 'CAPITAL'
      Origin = 'CAPITAL'
      Size = 100
    end
    object qCountriesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      Origin = 'CONTINENT'
      Size = 50
    end
    object qCountriesPOPULATION: TIntegerField
      FieldName = 'POPULATION'
      Origin = 'POPULATION'
    end
    object qCountriesAREA: TFMTBCDField
      FieldName = 'AREA'
      Origin = 'AREA'
      Precision = 18
      Size = 2
    end
    object qCountriesDensity: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Density'
      Calculated = True
    end
  end
  object dsCountries: TDataSource
    DataSet = qCountries
    Left = 256
    Top = 384
  end
end
