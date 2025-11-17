unit U_CadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, DBClient;

type
  TF_CadClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSair: TButton;
    btnEditar: TButton;
    DataItem: TDataSource;
    Panel3: TPanel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBComboBox1: TDBComboBox;
    Panel4: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Panel6: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Panel7: TPanel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    ImageList1: TImageList;
    procedure btnEditarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadClientes: TF_CadClientes;

implementation

uses U_DataM, U_ConClientes;

{$R *.dfm}

procedure TF_CadClientes.btnEditarClick(Sender: TObject);
begin
  DataM.qryAux.Close;
  DataM.qryAux.SQL.Text :=
  'select cli.cli_codigo    '+#13+
  'from clientes cli        '+#13+
  'where cli.cli_cpf = :cpf ';
  DataM.qryAux.ParamByName('cpf').AsString := DataItem.DataSet.FieldByName('cli_cpf').AsString;
  DataM.qryAux.Open;

  if ((DataM.qryAux.RecordCount > 0) and (DataItem.DataSet.State = dsInsert)) then
  begin
    ShowMessage('O cadastro de n° '+DataM.qryAux.FieldByName('cli_codigo').AsString+' já está usando esse CPF, sendo assim não poderá cadastrar com o mesmo.');
    Abort;
  end;

  DataM.cdsCadClientes.ApplyUpdates(0);
  close;

  if Assigned(F_ConClientes) then
    F_ConClientes.dsGrid.DataSet.Refresh;
end;

procedure TF_CadClientes.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TF_CadClientes.FormShow(Sender: TObject);
begin
  F_CadClientes := nil;
end;

end.
