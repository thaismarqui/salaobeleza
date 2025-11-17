unit U_CadServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, DBClient;

type
  TF_CadServicos = class(TForm)
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
    dtTime: TDateTimePicker;
    ImageList1: TImageList;
    procedure btnEditarClick(Sender: TObject);
    procedure dtTimeChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadServicos: TF_CadServicos;

implementation

uses U_DataM, U_ConServicos;

{$R *.dfm}

procedure TF_CadServicos.btnEditarClick(Sender: TObject);
begin
  DataM.cdsCadServicos.ApplyUpdates(0);
  close;

  if Assigned(F_ConServicos) then
    F_ConServicos.dsGrid.DataSet.Refresh;
end;

procedure TF_CadServicos.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TF_CadServicos.dtTimeChange(Sender: TObject);
begin
  if not (DataItem.DataSet.State in [dsEdit, dsInsert]) then
    DataItem.DataSet.Edit;

  DataItem.DataSet.FieldByName('serv_tempo').AsDateTime := dtTime.DateTime;
end;

procedure TF_CadServicos.FormShow(Sender: TObject);
begin
  F_CadServicos := nil;
end;

end.
