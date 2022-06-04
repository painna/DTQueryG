unit DTQueryG;

interface

uses
  System.SysUtils, System.Classes, Engine.Interfaces, Data.DB,
  FireDAC.Comp.Client, ZConnection, uRESTDWPoolerDB;

var
lconexao:Tcomponent;

type
  TTipoEngine = (tpRDW, tpFireDAC, tpZeos);
  TTipoBanco = (tpFB, tpPG, tpMySQL);

type
  TEngine = class(TInterfacedObject, IEngine)
  private
    FQry: IEngineBase;
  public
    constructor Create(tipo:TComponent);
    destructor Destroy; override;
    class function New(Tipo:TComponent): IEngine;

    function Qry: IEngineBase;

  end;

type
  TDTQueryG = class(TComponent , IEngineBase)
  private
    FQryG:IEngineBase;
    FPassword: string;
    FUser: string;
    FPot: String;
    FDataBase: string;
    FTipoConector: TTipoEngine;
    FCaminhoVendorLib: string;
    FZeosConection: TZconnection;
    FRDWConection: TRESTDWDataBase;
    FireConection: TFDConnection;
    FActive: Boolean;
    procedure setPassword(const Value: string);
    procedure setUser(const Value: string);
    procedure setPort(const Value: String);
    procedure setDataBase(const Value: string);
    procedure setTipoConector(const Value: TTipoEngine);
    procedure setCaminhoVendorLib(const Value: string);
    procedure setFireConection(const Value: TFDConnection);
    procedure setFRDWConection(const Value: TRESTDWDataBase);
    procedure setFZeosConection(const Value: TZconnection);
    procedure SetActive(const Value: Boolean);
    function Activex(const value:boolean):Boolean;
  protected

  public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;

  function SQL: TStrings;
  function Params: TParams;
  function ParamByName(const Value: string): TParam;
  function ExecSQL: IEngineBase;
  function DataSet: TDataSet;
  function Open(aSQL: string): IEngineBase; overload;
  function Open: IEngineBase; overload;
  function Close: IEngineBase;
  function TableName(aValue: string): IEngineBase;
  function StartTransaction: IEngineBase;
  function Commit: IEngineBase;
  function Rollback: IEngineBase;
  function InTransaction: Boolean;
  function Eof: Boolean;
  function Next: IEnginebase;
  function Prior: IEnginebase;
  function First: IEnginebase;
  function Last: IEngineBase;
  function RecordCount: Integer;
  function Fields: TFields;
  function FieldByName(const FieldName: string): TField;
  function isEmpty: Boolean;
  function GetTipoConexao:TComponent;

  published
  property TipoConector:TTipoEngine read FTipoConector write setTipoConector;
  property FireDACConection:TFDConnection read FireConection write setFireConection;
  property ZeosConection:TZconnection read FZeosConection write setFZeosConection;
  property RDWConnection:TRESTDWDataBase read FRDWConection write setFRDWConection;
  property Active: Boolean read FActive write SetActive default False;

  end;

procedure Register;

implementation

uses
  Engine.FireDAC, Engine.Zeos,
  Engine.RestDataware;

procedure Register;
begin
  RegisterComponents('DT Inovacao', [TDTQueryG]);
end;

{ TDTQueryG }

function TDTQueryG.Activex(const value: boolean): Boolean;
begin
    FQryG.Activex(value);
    result := value;
end;

function TDTQueryG.Close: IEngineBase;
begin
   Result := FQryG.Close;
end;

function TDTQueryG.Commit: IEngineBase;
begin
  Result := FQryG.Commit;
end;

constructor TDTQueryG.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
//  FUser             := 'SYSDBA';
//  FPassword         := 'masterkey';
//  FPot              := '3050';
//  FDataBase         := 'C:\SUPERSYS10\DADOS\SUPERSYS.FDB';
//  FCaminhoVendorLib := 'C:\SUPERSYS10\FBCLIENT.DLL';
end;

function TDTQueryG.DataSet: TDataSet;
begin
    result := FQryG.DataSet;
end;

destructor TDTQueryG.Destroy;
begin

  inherited Destroy;
end;

function TDTQueryG.Eof: Boolean;
begin
   result := FQryG.Eof;
end;

function TDTQueryG.ExecSQL: IEngineBase;
begin
    result := FQryG.ExecSQL;
end;

function TDTQueryG.FieldByName(const FieldName: string): TField;
begin
   Result := FQryG.FieldByName(FieldName);
end;

function TDTQueryG.Fields: TFields;
begin
   result := FQryG.Fields;
end;

function TDTQueryG.First: IEnginebase;
begin
   Result := FQryG.First;
end;


function TDTQueryG.GetTipoConexao: TComponent;
begin
  if FTipoConector = tpFireDAC then
  begin
       lConexao := FireDACConection;
  end else if FTipoConector = tpZeos then
  begin
       lConexao := FZeosConection;
  end else if FTipoConector = tpRDW then
  begin
       lConexao := FRDWConection;
  end;
  FQryG         := TEngine.New(lConexao).Qry;
end;

function TDTQueryG.InTransaction: Boolean;
begin
   Result := FQryG.InTransaction;
end;

function TDTQueryG.isEmpty: Boolean;
begin
   Result := FQryG.isEmpty;
end;

function TDTQueryG.Last: IEngineBase;
begin
   Result := FQryG.Last;
end;

function TDTQueryG.Next: IEnginebase;
begin
   result := FQryG.Next;
end;

function TDTQueryG.Open: IEngineBase;
begin
   Result := FQryG.Open;
end;

function TDTQueryG.Open(aSQL: string): IEngineBase;
begin
   Result := FQryG.Open(aSQL);
end;

function TDTQueryG.ParamByName(const Value: string): TParam;
begin
   result := FQryG.ParamByName(Value);
end;

function TDTQueryG.Params: TParams;
begin
   result := FQryG.Params;
end;

function TDTQueryG.Prior: IEnginebase;
begin
   result := FQryG.Prior;
end;

function TDTQueryG.RecordCount: Integer;
begin
   Result := FQryG.RecordCount;
end;

function TDTQueryG.Rollback: IEngineBase;
begin
   result := FQryG.Rollback;
end;

procedure TDTQueryG.SetActive(const Value: Boolean);
begin
  try
        FActive := Value;
        FQryG.Activex(value);
  except on e:Exception do
  begin
        FActive := false;
       // raise Exception.Create(e.Message);
  end;
  end;
end;

procedure TDTQueryG.setCaminhoVendorLib(const Value: string);
begin
    FCaminhoVendorLib := VALUE;
end;

procedure TDTQueryG.setDataBase(const Value: string);
begin
  FDataBase := Value;
end;

procedure TDTQueryG.setFireConection(const Value: TFDConnection);
begin
  FireConection := Value;
end;

procedure TDTQueryG.setFRDWConection(const Value: TRESTDWDataBase);
begin
  FRDWConection := Value;
end;

procedure TDTQueryG.setFZeosConection(const Value: TZconnection);
begin
  FZeosConection := Value;
end;

procedure TDTQueryG.setPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TDTQueryG.setPort(const Value: String);
begin
  FPot := Value;
end;

procedure TDTQueryG.setTipoConector(const Value: TTipoEngine);
begin
  FTipoConector := Value;
  GetTipoConexao;
end;

procedure TDTQueryG.setUser(const Value: string);
begin
  FUser := Value;
end;

function TDTQueryG.SQL: TStrings;
begin
    result := FQryG.SQL;
end;

function TDTQueryG.StartTransaction: IEngineBase;
begin
    Result := FQryG.StartTransaction;
end;

function TDTQueryG.TableName(aValue: string): IEngineBase;
begin
    Result := FQryG.TableName(aValue);
end;

{ TEngine }

constructor TEngine.Create(Tipo:TComponent);
begin
  lConexao := tipo;
  if ( lConexao is TFDConnection ) then
    FQry := TEngineFireDAC.New( lConexao as TFDConnection )
  else if ( lConexao is TRESTDWDataBase ) then
    FQry := TEngineRestDataware.New( lConexao as TRESTDWDataBase )
  else if ( lConexao is TZConnection ) then
    FQry := TEngineZeos.New( lConexao as TZConnection );
end;

destructor TEngine.Destroy;
begin

  inherited;
end;

class function TEngine.New(Tipo:TComponent): IEngine;
begin
   Result := Self.Create(Tipo);
end;

function TEngine.Qry: IEngineBase;
begin
   Result := FQry;
end;

end.
