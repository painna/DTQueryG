unit Engine.Interfaces;

interface

uses
  System.Classes, Data.DB;

type
  IEngineBase = interface
    ['{B477D5A4-F035-47DC-8FC6-B6DB98C9C198}']
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
    function Activex(const value:boolean): Boolean;
  end;

  IEngine = interface
    ['{D8D0E1B9-8E1F-47E4-8F9A-66DC15446DC3}']
    function Qry: IEngineBase;
  end;

implementation

end.
