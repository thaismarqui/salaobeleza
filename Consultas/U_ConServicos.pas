unit U_ConServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, System.ImageList, Vcl.ImgList;

type
  TF_ConServicos = class(TForm)
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
  F_ConServicos: TF_ConServicos;

implementation

uses U_DataM, U_CadServicos;

{$R *.dfm}

function GetCodigo: Integer;
begin
  DataM.qryAux.Close;
  DataM.qryAux.SQL.Text := 'select max(serv_codigo) as codigo from servicos';
  DataM.qryAux.Open;

  Result := DataM.qryAux.FieldByName('codigo').AsInteger + 1;
end;

procedure TF_ConServicos.btnEditarClick(Sender: TObject);
begin
  F_CadServicos := TF_CadServicos.Create(Self);
  begin
    DataM.cdsCadServicos.Close;
    DataM.cdsCadServicos.ParamByName('codigo').AsInteger := dsGrid.DataSet.FieldByName('serv_codigo').AsInteger;
    DataM.cdsCadServicos.Open;

    F_CadServicos.DataItem.DataSet := DataM.cdsCadServicos;

    with F_CadServicos do
    begin
      DataItem.DataSet.Edit;

      dtTime.DateTime := DataItem.DataSet.FieldByName('serv_tempo').AsDateTime;
    end;

    F_CadServicos.ShowModal;
  end;
end;

procedure TF_ConServicos.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente remover o cadastro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DataM.cdsCadServicos.Close;
    DataM.cdsCadServicos.ParamByName('codigo').AsInteger := dsGrid.DataSet.FieldByName('serv_codigo').AsInteger;
    DataM.cdsCadServicos.Open;

    DataM.cdsCadServicos.Delete;
    DataM.cdsCadServicos.ApplyUpdates(0);

    ShowMessage('Cadastro removido com sucesso!');

    dsGrid.DataSet.Refresh;
  end;
end;

procedure TF_ConServicos.btnInserirClick(Sender: TObject);
begin
  F_CadServicos := TF_CadServicos.Create(Self);
  begin
    DataM.cdsCadServicos.Close;
    DataM.cdsCadServicos.ParamByName('codigo').AsInteger := -1;
    DataM.cdsCadServicos.Open;

    F_CadServicos.DataItem.DataSet := DataM.cdsCadServicos;

    with F_CadServicos do
    begin
      DataItem.DataSet.Append;
      DataItem.DataSet.FieldByName('serv_codigo').AsInteger := GetCodigo;
      DataItem.DataSet.FieldByName('serv_status').AsString := 'Ativo';
    end;

    F_CadServicos.ShowModal;
  end;
end;

procedure TF_ConServicos.btnPesquisarClick(Sender: TObject);
begin
  if edtPesquisa.Text <> '' then
  begin
    dsGrid.DataSet.Filtered := False;
    dsGrid.DataSet.Filter := 'upper(SERV_DESCRICAO) like upper(''%'+trim(edtPesquisa.Text)+'%'')';
    dsGrid.DataSet.Filtered := True;
  end
  else
  begin
    dsGrid.DataSet.Close;
    dsGrid.DataSet.Filtered := False;
    dsGrid.DataSet.Open;
  end;
end;

procedure TF_ConServicos.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TF_ConServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_ConServicos := nil;
end;

procedure TF_ConServicos.FormShow(Sender: TObject);
begin
  dsGrid.DataSet.Close;
  dsGrid.DataSet.Open;
end;

end.
