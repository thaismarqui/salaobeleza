program SistemaSalao;

uses
  Vcl.Forms,
  Sysutils,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_DataM in 'U_DataM.pas' {DataM: TDataModule},
  U_Login in 'U_Login.pas' {F_Login},
  U_ConServicos in 'Consultas\U_ConServicos.pas' {F_ConServicos},
  U_CadServicos in 'Cadastros\U_CadServicos.pas' {F_CadServicos},
  U_ConClientes in 'Consultas\U_ConClientes.pas' {F_ConClientes},
  U_CadClientes in 'Cadastros\U_CadClientes.pas' {F_CadClientes},
  U_ConAgenda in 'Consultas\U_ConAgenda.pas' {F_ConAgenda},
  U_CadAgenda in 'Cadastros\U_CadAgenda.pas' {F_CadAgenda};

{$R *.res}

begin
  F_Login := TF_Login.Create(Application);
  try
    if F_Login.ShowModal = 1 then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.Title := 'Salão de Beleza';
      Application.CreateForm(TDataM, DataM);
      Application.CreateForm(TF_Principal, F_Principal);
      Application.Run;
    end;
  finally
    F_Login.Free;
  end;
end.
