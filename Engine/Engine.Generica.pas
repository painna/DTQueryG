unit Engine.Generica;

interface

uses Engine.Interfaces;

type
  TEngine = class(TInterfacedObject, IEngine)
  private
    FQry: IEngineBase;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IEngine;

    function Qry: IEngineBase;
  end;

implementation

uses
  System.Classes, FireDAC.Comp.Client, Engine.FireDAC, Engine.RestDataware,
  Engine.Zeos, uRESTDWPoolerDB, ZConnection,UDM;

{ TEngine }

constructor TEngine.Create;
var
  lConexao: TComponent;
begin
  lConexao := DataModule1.Tipo_Conector;

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

class function TEngine.New: IEngine;
begin
  Result := Self.Create;
end;

function TEngine.Qry: IEngineBase;
begin
  Result := FQry;
end;

end.
