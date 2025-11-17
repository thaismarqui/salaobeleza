object F_Login: TF_Login
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 163
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 163
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 600
      Height = 32
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 6
        Width = 592
        Height = 22
        Margins.Top = 5
        Align = alClient
        Alignment = taCenter
        Caption = 'Sistema de Sal'#227'o de Beleza'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 166
        ExplicitHeight = 17
      end
    end
    object TPanel
      Left = 1
      Top = 138
      Width = 600
      Height = 24
      Align = alBottom
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 592
        Height = 16
        Align = alClient
        Alignment = taCenter
        Caption = #169' Copyright 2025 - Thais Marqui Guilherme'
        ExplicitWidth = 232
        ExplicitHeight = 15
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 33
      Width = 600
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label3: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 33
        Height = 26
        Margins.Right = 16
        Align = alLeft
        Caption = 'Login:'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object edtLogin: TEdit
        AlignWithMargins = True
        Left = 55
        Top = 3
        Width = 542
        Height = 26
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 23
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 65
      Width = 600
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Label4: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 38
        Height = 26
        Margins.Right = 10
        Align = alLeft
        Caption = 'Senha: '
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object edtSenha: TEdit
        AlignWithMargins = True
        Left = 54
        Top = 3
        Width = 543
        Height = 26
        Align = alClient
        PasswordChar = '*'
        TabOrder = 0
        ExplicitHeight = 23
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 97
      Width = 600
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object btnAcessar: TButton
        AlignWithMargins = True
        Left = 200
        Top = 3
        Width = 200
        Height = 26
        Margins.Left = 200
        Margins.Right = 200
        Align = alClient
        Caption = 'ACESSAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnAcessarClick
      end
    end
  end
  object dsAcesso: TDataSource
    DataSet = DataM.cdsUsuarios
    Left = 25
    Top = 105
  end
end
