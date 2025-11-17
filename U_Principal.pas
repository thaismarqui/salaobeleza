unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Data.DB, Vcl.Imaging.pngimage;

type
  TF_Principal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAgendamento: TButton;
    btnAgendamentos: TButton;
    Button3: TButton;
    Button5: TButton;
    Image1: TImage;
    ImageList1: TImageList;
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAgendamentoClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnAgendamentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_DataM, U_ConServicos, U_ConClientes, U_ConAgenda;

{$R *.dfm}

procedure TF_Principal.btnAgendamentoClick(Sender: TObject);
begin
  Application.CreateForm(TF_ConServicos, F_ConServicos);
  F_ConServicos.Show;
end;

procedure TF_Principal.btnAgendamentosClick(Sender: TObject);
begin
  Application.CreateForm(TF_ConAgenda, F_ConAgenda);
  F_ConAgenda.Show;
end;

procedure TF_Principal.Button3Click(Sender: TObject);
begin
  Application.CreateForm(TF_ConClientes, F_ConClientes);
  F_ConClientes.Show;
end;

procedure TF_Principal.Button5Click(Sender: TObject);
begin
  F_Principal := nil;
  close;
end;

procedure TF_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_Principal := nil;
end;

end.
