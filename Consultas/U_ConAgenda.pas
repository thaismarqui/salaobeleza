unit U_ConAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList;

type
  TF_ConAgenda = class(TForm)
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
  F_ConAgenda: TF_ConAgenda;

implementation

uses U_DataM, U_CadAgenda;

{$R *.dfm}

function GetCodigo: Integer;
begin
  DataM.qryAux.Close;
  DataM.qryAux.SQL.Text := 'select max(ag_codigo) as codigo from agendamentos';
  DataM.qryAux.Open;

  Result := DataM.qryAux.FieldByName('codigo').AsInteger + 1;
end;

procedure TF_ConAgenda.btnEditarClick(Sender: TObject);
begin
  F_CadAgenda := TF_CadAgenda.Create(Self);
  begin
    DataM.cdsCadAgenda.Close;
    DataM.cdsCadAgenda.ParamByName('codigo').AsInteger := dsGrid.DataSet.FieldByName('ag_codigo').AsInteger;
    DataM.cdsCadAgenda.Open;

    F_CadAgenda.DataItem.DataSet := DataM.cdsCadAgenda;
    with F_CadAgenda do
    begin
      DataItem.DataSet.Edit;
    end;

    F_CadAgenda.ShowModal;
  end;
end;

procedure TF_ConAgenda.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente remover o cadastro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DataM.cdsCadAgenda.Close;
    DataM.cdsCadAgenda.ParamByName('codigo').AsInteger := dsGrid.DataSet.FieldByName('ag_codigo').AsInteger;
    DataM.cdsCadAgenda.Open;

    DataM.cdsCadAgenda.Delete;
    DataM.cdsCadAgenda.ApplyUpdates(0);

    ShowMessage('Cadastro removido com sucesso!');

    dsGrid.DataSet.Refresh;
  end;
end;

procedure TF_ConAgenda.btnInserirClick(Sender: TObject);
begin
  F_CadAgenda := TF_CadAgenda.Create(Self);
  begin
    DataM.cdsCadAgenda.Close;
    DataM.cdsCadAgenda.ParamByName('codigo').AsInteger := -1;
    DataM.cdsCadAgenda.Open;

    F_CadAgenda.DataItem.DataSet := DataM.cdsCadAgenda;

    with F_CadAgenda do
    begin
      DataItem.DataSet.Append;
      DataItem.DataSet.FieldByName('ag_codigo').AsInteger := GetCodigo;
      DataItem.DataSet.FieldByName('ag_status').AsString := 'Agendado';
    end;

    F_CadAgenda.data.DateTime := now;
    F_CadAgenda.hora.DateTime := now;
    F_CadAgenda.ShowModal;
  end;
end;

procedure TF_ConAgenda.btnPesquisarClick(Sender: TObject);
begin
  if edtPesquisa.Text <> '' then
  begin
    dsGrid.DataSet.Filtered := False;
    dsGrid.DataSet.Filter := 'upper(CLI_NOME) like upper(''%'+trim(edtPesquisa.Text)+'%'')';
    dsGrid.DataSet.Filtered := True;
  end
  else
  begin
    dsGrid.DataSet.Filtered := False;
  end;
end;

procedure TF_ConAgenda.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TF_ConAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_ConAgenda := nil;
end;

procedure TF_ConAgenda.FormShow(Sender: TObject);
begin
  dsGrid.DataSet.Close;
  dsGrid.DataSet.Open;
end;

end.
