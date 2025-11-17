unit U_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, System.IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  IdHash, IdHashMessageDigest, IdGlobal;

type
  TF_Login = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    edtLogin: TEdit;
    Panel4: TPanel;
    Label4: TLabel;
    edtSenha: TEdit;
    Panel5: TPanel;
    btnAcessar: TButton;
    dsAcesso: TDataSource;
    procedure btnAcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    tentativas: Integer;
  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;

implementation

uses U_DataM, U_Principal;

{$R *.dfm}

function HashMD5(const Texto: string): string;
var
  MD5: TIdHashMessageDigest5;
begin
  MD5 := TIdHashMessageDigest5.Create;
  try
    Result := MD5.HashStringAsHex(Texto, IndyTextEncoding_UTF8);
  finally
    MD5.Free;
  end;
end;

procedure TF_Login.btnAcessarClick(Sender: TObject);
begin
  if not Assigned(DataM) then
    Application.CreateForm(TDataM, DataM);

  if Trim(edtLogin.Text) = '' then
  begin
    ShowMessage('É necessário inserir o login para prosseguir!');
    edtLogin.SetFocus;
    Abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    ShowMessage('É necessário inserir a senha para prosseguir!');
    edtSenha.SetFocus;
    Abort;
  end;

  dsAcesso.DataSet.Close;
  DataM.cdsUsuarios.ParamByName('us_login').AsString := Trim(edtLogin.Text);
  DataM.cdsUsuarios.ParamByName('us_senha').AsString := HashMD5(Trim(edtSenha.Text));
  dsAcesso.DataSet.Open;

  if dsAcesso.DataSet.RecordCount > 0 then
  begin
    ModalResult := mrOk;
  end
  else
  begin
    ModalResult := mrNone;
    if(tentativas = 1) then
    begin
      inc(tentativas);
      ShowMessage('Acesso negado, você só tem mais 1 chance!');
    end
    else
    begin
      ShowMessage('Você não terá mais chances!');
      close;
    end;
  end;
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_Login := nil;
end;

procedure TF_Login.FormCreate(Sender: TObject);
begin
  tentativas := 1;
end;

end.
