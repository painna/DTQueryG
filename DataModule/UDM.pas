unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.PGDef,
  FireDAC.Phys.MySQLDef, ZAbstractConnection, ZConnection, FireDAC.Phys.MySQL,
  FireDAC.Phys.PG, FireDAC.Phys.IBBase, FireDAC.Comp.UI, uDWAbout,
  uRESTDWPoolerDB, Data.DB, FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    FDConnection: TFDConnection;
    RESTDWDataBase: TRESTDWDataBase;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    ZConnection1: TZConnection;
  private
    { Private declarations }
  public
  Tipo_Conector:TComponent;

  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDataModule1 }

end.
