unit UPQuerys;

interface

uses
FireDAC.Stan.Intf,stdctrls,
FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param,System.SysUtils,
FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
System.Classes,DTQueryG;

type
  TFDQuery = class(FireDAC.Comp.Client.TFDQuery)
  private
      procedure SetSQL(const AValue: TStrings);
      function GetSQL: TStrings;
  public
      property SQL: TStrings read GetSQL write SetSQL;
      procedure ExecSQL; overload;
  published

end;

implementation


{ TFDQuery }

procedure TFDQuery.ExecSQL;
VAR
Transac:TFDTransaction;
Qry:TDTQueryG;
begin
     try
             Qry := TDTQueryG.Create(nil);
             Qry.TipoConector := tpFireDAC;
             Qry.FireDACConection := TFDConnection(Connection);
             //Qry.ExecSQL := ExecSQL;

//             Transac := TFDTransaction.Create(nil);
//             Transac.Connection := Connection;
//             Connection.Transaction := Transac;
//             Transac.StartTransaction;

         try
           //  Execute;

           //  Transac.Commit;
         except on e:Exception do
         begin

          //   Transac.Rollback;

             raise Exception.Create(e.Message);
         end;
         end;
     finally

       //  Transac.Free;
     end;
end;

function TFDQuery.GetSQL: TStrings;
VAR
Transac:TFDTransaction;
Qry:TDTQueryG;
begin
     try
             Qry := TDTQueryG.Create(nil);
             Qry.TipoConector := tpFireDAC;
             Qry.FireDACConection := TFDConnection(Connection);
             Qry.SQL.Text := SQL.Text;
            // Result := Qry.Open;
         try
//             Result := Command.CommandText;
//
//             Transac.Commit;
         except on e:Exception do
         begin

//             Transac.Rollback;
//
//             raise Exception.Create(e.Message);
         end;
         end;
     finally

         //Transac.Free;
     end;
end;

procedure TFDQuery.SetSQL(const AValue: TStrings);
VAR
Transac:TFDTransaction;
begin
     try
             Transac := TFDTransaction.Create(nil);
             Transac.Connection := Connection;
             Connection.Transaction := Transac;
             Transac.StartTransaction;
         try
             Command.CommandText := AValue;

             Transac.Commit;
         except on e:Exception do
         begin

             Transac.Rollback;

             raise Exception.Create(e.Message);
         end;
         end;
     finally

         Transac.Free;
     end;
end;

end.
