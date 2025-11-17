unit U_ConClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, System.ImageList, Vcl.ImgList;

type
  TF_ConClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    edtPesquisa: TEdit;
    btnPesquisar: TButton;
    btnSair: TButton;
    btnEditar: TButton;
    DBGrid1: TDBGrid;
    dsGrid: TDataSource;
    btnInserir: TButton;
    btnExcluir: TButton;
    ImageList1: TImageList;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ConClientes: TF_ConClientes;

implementation

uses U_DataM, U_CadClientes;

{$R *.dfm}

function GetCodigo: Integer;
begin
  DataM.qryAux.Close;
  DataM.qryAux.SQL.Text := 'select max(cli_codigo) as codigo from clientes';
  DataM.qryAux.Open;

  Result := DataM.qryAux.FieldByName('codigo').AsInteger + 1;
end;

procedure TF_ConClientes.btnEditarClick(Sender: TObject);
begin
  F_CadClientes := TF_CadClientes.Create(Self);
  begin
    DataM.cdsCadClientes.Close;
    DataM.cdsCadClientes.ParamByName('codigo').AsInteger := dsGrid.DataSet.FieldByName('cli_codigo').AsInteger;
    DataM.cdsCadClientes.Open;

    F_CadClientes.DataItem.DataSet := DataM.cdsCadClientes;
    with F_CadClientes do
    begin
      DataItem.DataSet.Edit;
    end;

    F_CadClientes.ShowModal;
  end;
end;

procedure TF_ConClientes.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente remover o cadastro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DataM.cdsCadClientes.Close;
    DataM.cdsCadClientes.ParamByName('codigo').AsInteger := dsGrid.DataSet.FieldByName('cli_codigo').AsInteger;
    DataM.cdsCadClientes.Open;

    DataM.cdsCadClientes.Delete;
    DataM.cdsCadClientes.ApplyUpdates(0);

    ShowMessage('Cadastro removido com sucesso!');

    dsGrid.DataSet.Refresh;
  end;
end;

procedure TF_ConClientes.btnInserirClick(Sender: TObject);
begin
  F_CadClientes := TF_CadClientes.Create(Self);
  begin
    DataM.cdsCadClientes.Close;
    DataM.cdsCadClientes.ParamByName('codigo').AsInteger := -1;
    DataM.cdsCadClientes.Open;

    F_CadClientes.DataItem.DataSet := DataM.cdsCadClientes;

    with F_CadClientes do
    begin
      DataItem.DataSet.Append;
      DataItem.DataSet.FieldByName('cli_codigo').AsInteger := GetCodigo;
      DataItem.DataSet.FieldByName('cli_status').AsString := 'Ativo';
    end;

    F_CadClientes.ShowModal;
  end;
end;

procedure TF_ConClientes.btnPesquisarClick(Sender: TObject);
begin
  if edtPesquisa.Text <> '' then
  begin
    dsGrid.DataSet.Filtered := False;
    dsGrid.DataSet.Filter := 'upper(CLI_NOME) like upper(''%'+trim(edtPesquisa.Text)+'%'')';
    dsGrid.DataSet.Filtered := True;
  end
  else
  begin
    dsGrid.DataSet.Close;
    dsGrid.DataSet.Filtered := False;
    dsGrid.DataSet.Open;
  end;
end;

procedure TF_ConClientes.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TF_ConClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_ConClientes := nil;
end;

procedure TF_ConClientes.FormShow(Sender: TObject);
begin
  dsGrid.DataSet.Close;
  dsGrid.DataSet.Open;
end;

end.
