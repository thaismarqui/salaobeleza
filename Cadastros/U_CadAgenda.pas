unit U_CadAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, DBClient;

type
  TF_CadAgenda = class(TForm)
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
    Panel5: TPanel;
    Label5: TLabel;
    cbServico: TComboBox;
    Label6: TLabel;
    data: TDateTimePicker;
    Label7: TLabel;
    hora: TDateTimePicker;
    cbCliente: TComboBox;
    dsServico: TDataSource;
    dsClientes: TDataSource;
    ImageList1: TImageList;
    procedure btnEditarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbServicoChange(Sender: TObject);
    procedure cbClienteChange(Sender: TObject);
    procedure dataChange(Sender: TObject);
    procedure horaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadAgenda: TF_CadAgenda;

implementation

uses U_DataM, U_ConClientes, U_CadClientes, U_ConAgenda;

{$R *.dfm}

procedure TF_CadAgenda.btnEditarClick(Sender: TObject);
begin
  DataM.qryAux.Close;
  DataM.qryAux.SQL.Text :=
  'select serv.serv_descricao,       '+#13+
  '       cli.cli_nome               '+#13+
  'from agendamentos ag              '+#13+
  'inner join clientes cli on        '+#13+
  'cli.cli_codigo = ag.cli_codigo    '+#13+
  'inner join servicos serv on       '+#13+
  'serv.serv_codigo = ag.serv_codigo '+#13+
  'where ag.ag_data = :data and      '+#13+
  '      ag.ag_hora = :hora          ';
  DataM.qryAux.ParamByName('data').AsDateTime := DataItem.DataSet.FieldByName('ag_data').AsDateTime;
  DataM.qryAux.ParamByName('hora').AsDateTime := DataItem.DataSet.FieldByName('ag_hora').AsDateTime;
  DataM.qryAux.Open;

  if ((DataM.qryAux.RecordCount > 0) and (DataItem.DataSet.State = dsInsert)) then
  begin
    ShowMessage('Já existe agendamento para essa data para a '+DataM.qryAux.FieldByName('cli_nome').AsString+' que irá fazer '+DataM.qryAux.FieldByName('cli_nome').AsString+'. Agende outra data!.');
    Abort;
  end;

  DataM.cdsCadAgenda.ApplyUpdates(0);
  close;

  if Assigned(F_ConAgenda) then
    F_ConAgenda.dsGrid.DataSet.Refresh;
end;

procedure TF_CadAgenda.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TF_CadAgenda.cbClienteChange(Sender: TObject);
begin
  if not (DataItem.DataSet.State in [dsEdit, dsInsert]) then
    DataItem.DataSet.Edit;

  DataItem.DataSet.FieldByName('cli_codigo').AsInteger := Integer(cbCliente.Items.Objects[cbCliente.ItemIndex]);
end;

procedure TF_CadAgenda.cbServicoChange(Sender: TObject);
begin
  if not (DataItem.DataSet.State in [dsEdit, dsInsert]) then
    DataItem.DataSet.Edit;

  DataItem.DataSet.FieldByName('serv_codigo').AsInteger := Integer(cbServico.Items.Objects[cbServico.ItemIndex]);
end;

procedure TF_CadAgenda.dataChange(Sender: TObject);
begin
  if not (DataItem.DataSet.State in [dsEdit, dsInsert]) then
    DataItem.DataSet.Edit;

  DataItem.DataSet.FieldByName('ag_data').AsDateTime := data.DateTime;
end;

procedure TF_CadAgenda.FormCreate(Sender: TObject);
begin
  cbServico.Items.Clear;

  dsServico.DataSet.Close;
  dsServico.DataSet.Open;

  dsServico.DataSet.First;
  while not dsServico.DataSet.Eof do
  begin
    cbServico.Items.AddObject(
      dsServico.DataSet.FieldByName('serv_descricao').AsString,
      TObject(dsServico.DataSet.FieldByName('serv_codigo').AsInteger)
    );
    dsServico.DataSet.Next;
  end;

  cbCliente.Items.Clear;

  dsClientes.DataSet.Close;
  dsClientes.DataSet.Open;

  dsClientes.DataSet.First;
  while not dsClientes.DataSet.Eof do
  begin
    cbCliente.Items.AddObject(
      dsClientes.DataSet.FieldByName('cli_nome').AsString,
      TObject(dsClientes.DataSet.FieldByName('cli_codigo').AsInteger)
    );
    dsClientes.DataSet.Next;
  end;
end;

procedure TF_CadAgenda.FormShow(Sender: TObject);
begin
  F_CadAgenda := nil;
end;

procedure TF_CadAgenda.horaChange(Sender: TObject);
begin
  if not (DataItem.DataSet.State in [dsEdit, dsInsert]) then
    DataItem.DataSet.Edit;

  DataItem.DataSet.FieldByName('ag_hora').AsDateTime := hora.DateTime;
end;

end.
