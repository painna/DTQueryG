unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, ZAbstractConnection, ZConnection, uDWAbout,
  uRESTDWPoolerDB,UPQuerys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, DTQueryG, Firewall;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    ZConnection1: TZConnection;

    ComboBox1: TComboBox;
    RESTDWDataBase1: TRESTDWDataBase;
    DTQueryG1: TDTQueryG;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
         if ComboBox1.ItemIndex = 0 then
         begin
              DTQueryG1.TipoConector := tpFireDAC;
         END ELSE if ComboBox1.ItemIndex = 1 then
         begin
              DTQueryG1.TipoConector := tpZeos;
         END ELSE if ComboBox1.ItemIndex = 2 then
         begin
              DTQueryG1.TipoConector := tpRDW;
         end;

         DataSource1.DataSet := DTQueryG1.DataSet;

         DTQueryG1.SQL.Text := 'SELECT CODIGO, DESCRICAO, CAST(VENDA AS NUMERIC(15,2)) AS VALOR FROM TBPRODUTO ORDER BY DESCRICAO';
         DTQueryG1.Open;

         Panel1.Caption := 'Registros: ' + DTQueryG1.RecordCount.ToString;
end;

end.
