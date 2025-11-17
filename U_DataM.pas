unit U_DataM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Datasnap.Provider, FireDAC.Comp.DataSet, Data.FMTBcd;

type
  TDataM = class(TDataModule)
    cdsUsuarios: TClientDataSet;
    conexao: TFDConnection;
    qryUsuarios: TFDQuery;
    dspUsuarios: TDataSetProvider;
    qryUsuariosUS_CODIGO: TIntegerField;
    qryUsuariosUS_LOGIN: TStringField;
    qryUsuariosUS_NOME: TStringField;
    qryUsuariosUS_SENHA: TStringField;
    qryUsuariosUS_STATUS: TStringField;
    cdsUsuariosUS_CODIGO: TIntegerField;
    cdsUsuariosUS_LOGIN: TStringField;
    cdsUsuariosUS_NOME: TStringField;
    cdsUsuariosUS_SENHA: TStringField;
    cdsUsuariosUS_STATUS: TStringField;
    dspConServicos: TDataSetProvider;
    cdsConServicos: TClientDataSet;
    qryConServicos: TFDQuery;
    qryConServicosSERV_CODIGO: TIntegerField;
    qryConServicosSERV_DESCRICAO: TStringField;
    qryConServicosSERV_VALOR: TFloatField;
    qryConServicosSERV_TEMPO: TTimeField;
    qryConServicosSERV_STATUS: TStringField;
    cdsConServicosSERV_CODIGO: TIntegerField;
    cdsConServicosSERV_DESCRICAO: TStringField;
    cdsConServicosSERV_VALOR: TFloatField;
    cdsConServicosSERV_TEMPO: TTimeField;
    cdsConServicosSERV_STATUS: TStringField;
    cdsCadServicos: TClientDataSet;
    dspCadServicos: TDataSetProvider;
    FDTransaction1: TFDTransaction;
    FDTransaction2: TFDTransaction;
    FDUpdateSQL1: TFDUpdateSQL;
    qryCadServicos: TFDQuery;
    qryCadServicosSERV_CODIGO: TIntegerField;
    qryCadServicosSERV_DESCRICAO: TStringField;
    qryCadServicosSERV_VALOR: TFloatField;
    qryCadServicosSERV_TEMPO: TTimeField;
    qryCadServicosSERV_STATUS: TStringField;
    cdsCadServicosSERV_CODIGO: TIntegerField;
    cdsCadServicosSERV_DESCRICAO: TStringField;
    cdsCadServicosSERV_VALOR: TFloatField;
    cdsCadServicosSERV_TEMPO: TTimeField;
    cdsCadServicosSERV_STATUS: TStringField;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    qryAux: TFDQuery;
    dspConClientes: TDataSetProvider;
    cdsConClientes: TClientDataSet;
    qryConClientes: TFDQuery;
    qryConClientesCLI_CODIGO: TIntegerField;
    qryConClientesCLI_NOME: TStringField;
    qryConClientesCLI_CPF: TStringField;
    qryConClientesCLI_CONTATO: TStringField;
    qryConClientesCLI_ENDERECO: TStringField;
    qryConClientesCLI_NUMERO: TIntegerField;
    qryConClientesCLI_EMAIL: TStringField;
    qryConClientesCLI_STATUS: TStringField;
    cdsConClientesCLI_CODIGO: TIntegerField;
    cdsConClientesCLI_NOME: TStringField;
    cdsConClientesCLI_CPF: TStringField;
    cdsConClientesCLI_CONTATO: TStringField;
    cdsConClientesCLI_ENDERECO: TStringField;
    cdsConClientesCLI_NUMERO: TIntegerField;
    cdsConClientesCLI_EMAIL: TStringField;
    cdsConClientesCLI_STATUS: TStringField;
    dspCadClientes: TDataSetProvider;
    cdsCadClientes: TClientDataSet;
    qryCadClientes: TFDQuery;
    FDUpdateSQL2: TFDUpdateSQL;
    qryCadClientesCLI_CODIGO: TIntegerField;
    qryCadClientesCLI_NOME: TStringField;
    qryCadClientesCLI_CPF: TStringField;
    qryCadClientesCLI_CONTATO: TStringField;
    qryCadClientesCLI_ENDERECO: TStringField;
    qryCadClientesCLI_NUMERO: TIntegerField;
    qryCadClientesCLI_EMAIL: TStringField;
    qryCadClientesCLI_STATUS: TStringField;
    cdsCadClientesCLI_CODIGO: TIntegerField;
    cdsCadClientesCLI_NOME: TStringField;
    cdsCadClientesCLI_CPF: TStringField;
    cdsCadClientesCLI_CONTATO: TStringField;
    cdsCadClientesCLI_ENDERECO: TStringField;
    cdsCadClientesCLI_NUMERO: TIntegerField;
    cdsCadClientesCLI_EMAIL: TStringField;
    cdsCadClientesCLI_STATUS: TStringField;
    cdsCadAgenda: TClientDataSet;
    dspCadAgenda: TDataSetProvider;
    qryCadAgenda: TFDQuery;
    FDUpdateSQL3: TFDUpdateSQL;
    cdsConAgenda: TClientDataSet;
    dspConAgenda: TDataSetProvider;
    qryConAgenda: TFDQuery;
    qryConAgendaAG_CODIGO: TIntegerField;
    qryConAgendaCLI_CODIGO: TIntegerField;
    qryConAgendaSERV_CODIGO: TIntegerField;
    qryConAgendaAG_DATA: TDateField;
    qryConAgendaAG_HORA: TTimeField;
    qryConAgendaAG_STATUS: TStringField;
    cdsConAgendaAG_CODIGO: TIntegerField;
    cdsConAgendaCLI_CODIGO: TIntegerField;
    cdsConAgendaSERV_CODIGO: TIntegerField;
    cdsConAgendaAG_DATA: TDateField;
    cdsConAgendaAG_HORA: TTimeField;
    cdsConAgendaAG_STATUS: TStringField;
    qryCadAgendaAG_CODIGO: TIntegerField;
    qryCadAgendaCLI_CODIGO: TIntegerField;
    qryCadAgendaSERV_CODIGO: TIntegerField;
    qryCadAgendaAG_DATA: TDateField;
    qryCadAgendaAG_HORA: TTimeField;
    qryCadAgendaAG_STATUS: TStringField;
    cdsCadAgendaAG_CODIGO: TIntegerField;
    cdsCadAgendaCLI_CODIGO: TIntegerField;
    cdsCadAgendaSERV_CODIGO: TIntegerField;
    cdsCadAgendaAG_DATA: TDateField;
    cdsCadAgendaAG_HORA: TTimeField;
    cdsCadAgendaAG_STATUS: TStringField;
    qryConAgendaSERV_DESCRICAO: TStringField;
    qryConAgendaSERV_TEMPO: TTimeField;
    qryConAgendaCLI_NOME: TStringField;
    cdsConAgendaSERV_DESCRICAO: TStringField;
    cdsConAgendaSERV_TEMPO: TTimeField;
    cdsConAgendaCLI_NOME: TStringField;
    procedure Atualizar(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataM: TDataM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataM.Atualizar(DataSet: TDataSet);
var
  vPonteiro: TBookmark;
begin
  with TClientDataSet(DataSet) do
  begin
    ApplyUpdates(0);
    vPonteiro := GetBookmark;
  end;

  try
    if not TClientDataSet(DataSet).IsEmpty then
      TClientDataSet(DataSet).GotoBookmark(vPonteiro);
    TClientDataSet(DataSet).FreeBookmark(vPonteiro);
  except on e: EDatabaseError do
    //Showmessage(e.Message);
  end;
end;

end.
