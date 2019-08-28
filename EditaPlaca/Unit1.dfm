object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Editar Placa'
  ClientHeight = 476
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 457
    Width = 800
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Alignment = taRightJustify
        Text = 'Splice Ltda - 2019'
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 122
    Width = 800
    Height = 335
    Align = alClient
    Caption = 'Registros Cadastrados'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 796
      Height = 318
      Align = alClient
      DataSource = dsqrygrid
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'mnt_chr_placa'
          Title.Caption = 'Placa'
          Width = 51
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'mmn_tyi_id'
          Title.Alignment = taCenter
          Title.Caption = 'ID'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mmn_vch_dsc'
          Title.Caption = 'Motivo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mnt_dtt_dataHoratrm'
          Title.Caption = 'Data/Hora'
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 50
    Width = 800
    Height = 72
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 3
      Top = 16
      Width = 25
      Height = 13
      Caption = 'Placa'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 104
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label3: TLabel
      Left = 332
      Top = 13
      Width = 64
      Height = 13
      Caption = 'Data Termino'
    end
    object DBEdit1: TDBEdit
      Left = 3
      Top = 32
      Width = 95
      Height = 21
      CharCase = ecUpperCase
      DataField = 'mnt_chr_Placa'
      DataSource = dsTab_Monitoramento
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 32
      Width = 222
      Height = 21
      DropDownCount = 10
      TabOrder = 1
      Text = '...'
    end
    object JvDBMaskEdit1: TJvDBMaskEdit
      Left = 332
      Top = 32
      Width = 122
      Height = 21
      DataField = 'mnt_dtt_DataHoraTrm'
      DataSource = dsTab_Monitoramento
      MaxLength = 19
      TabOrder = 2
      EditMask = '!99/99/0000 99:99:99;1; '
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 800
    Height = 50
    Align = alTop
    TabOrder = 3
    object DBNavigator1: TDBNavigator
      Left = 3
      Top = 18
      Width = 200
      Height = 25
      DataSource = dsqrygrid
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Kind = dbnHorizontal
      TabOrder = 0
    end
    object Button1: TButton
      Left = 377
      Top = 18
      Width = 78
      Height = 25
      Caption = '&Salvar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 209
      Top = 18
      Width = 78
      Height = 25
      Caption = '&Novo'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 293
      Top = 18
      Width = 78
      Height = 25
      Caption = '&Delete'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 461
      Top = 18
      Width = 78
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 4
      OnClick = Button4Click
    end
    object btnLocalizar: TBitBtn
      Left = 545
      Top = 18
      Width = 78
      Height = 25
      Caption = '&Localizar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFDFDFD
        E9E9E9BCBCBC9E9E9EA1A1A1B2B2B2C5C5C5D6D6D6E3E3E3E6E6E6DDDDDDC9C9
        C9ACACAC9F9F9FBCBCBCFFFFFFF7F7F7DFB8A6EFB596D2A58BBA957E9C897E7F
        8187939393A3A3A3A4A5A8868A93465D861177CA3474A89E9E9EFEFEFEE9DBD5
        F2BBA2FFFFFFFFFBF7D2CBCF64B7C931A5CA3186B4336DA61783CD1872AD3C66
        A04192CB25CAEAB5B5B5FBFBFBE3B19BFBECE4FFF3ECAAB5D70CB9FD74B6BDE2
        B18CE3B9916EB4C100ABF213D7FB3F96DE3C72B46893BDE2E2E2F3ECE9EBAD94
        FFFFFFF5C9BC2295D824D2F7E99278FF9066FF9870FF9F715CA6C104B7FD3A92
        C2898995E0E0E0FBFBFBEACDC2F5CABAFFFEF9E9ADA009C3EB2DE4F3E8B297FF
        CCA0FAAA83FF956CB7A1921E86D7AEA09DCECECEF7F7F7FFFFFFE4AD9AF8DCD1
        FFFDF5F9B5A350C7D32AFFFFA5BBB8FFE8B7FFEFBDFFCD96B2A79C7FA1AFAFA8
        A4E5E5E5FEFEFEFFFFFFE29983FBE9DFFEEADCFFBB9EBAA4A471F3F95FEBF9AB
        B1AEF7BC92E9B08A4CB4CA919696BCBCBCF1F1F1FFFFFFFFFFFFE4927AFFEBDE
        FFEADAFFDDCAFBAF96ADA9AE41E5F10EE4FC22BEE933BAE771ADC7AD9083CDCD
        CDF8F8F8FFFFFFFFFFFFE59179FCC8ADFBBC9DFBC3A9FFDBC6FFC5ABCDB5AF98
        BAC99ABAD2DAE5EFFCBEA5A2948EDADADAFDFDFDFFFFFFFFFFFFFCF7F6FEEDDE
        FCE4D7F2AD94F39877FDC2A7FFC0A4FFCCB1FFEBD5FFFCF2DDA38D9E9B9AE0E0
        E0FEFEFEFFFFFFFFFFFFFFFFFFFDEFE3FFF2E6FDF4EEF6AD8EFFDCC3FEDEC6FD
        CEB6FED4BEFFF4EACF8F77A2A2A1E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDE9D9FFF1E5FCBE9DFFD1B0FFDEC2FFE4CCFFE6D0FFF3E9CC8C75A9A8A8E6E6
        E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF3EDF6AF91FDD6BEFFE7CEFF
        E2C5FFE2C5FCE1D0BA7E6BAFAFAFE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEFB5A4E38C75E59881F1B9A6F8D7C6F7D5C5CA8772C7C7C7F0F0
        F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EAE6EE
        BEB1E59E8BE08268E1A695EEEEEEFAFAFAFFFFFFFFFFFFFFFFFF}
      TabOrder = 5
      OnClick = btnLocalizarClick
    end
  end
  object dsTab_Monitoramento: TDataSource
    DataSet = tb_monitoramento
    Left = 144
    Top = 256
  end
  object dsqrygrid: TDataSource
    DataSet = Zqrygrid
    Left = 144
    Top = 208
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    UTF8StringsAsWideField = True
    Connected = True
    HostName = 'localhost'
    Port = 0
    Database = 'basefixa_eqp'
    User = 'root'
    Protocol = 'mysql-5'
    Left = 336
    Top = 208
  end
  object Zqrygrid: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      
        'SELECT tb.mnt_chr_placa, tb.mmn_tyi_id, tm.mmn_vch_dsc, tb.mnt_d' +
        'tt_dataHoratrm FROM tbl_mnt tb'
      'INNER JOIN tbl_mtvmnt tm ON tm.mmn_tyi_id = tb.mmn_tyi_id')
    Params = <>
    Left = 248
    Top = 208
    object Zqrygridmnt_chr_placa: TWideStringField
      FieldName = 'mnt_chr_placa'
      Required = True
      Size = 7
    end
    object Zqrygridmmn_tyi_id: TSmallintField
      FieldName = 'mmn_tyi_id'
      Required = True
    end
    object Zqrygridmmn_vch_dsc: TWideStringField
      FieldName = 'mmn_vch_dsc'
      Required = True
      Size = 60
    end
    object Zqrygridmnt_dtt_dataHoratrm: TDateTimeField
      FieldName = 'mnt_dtt_dataHoratrm'
    end
  end
  object qryCombo: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 408
    Top = 208
  end
  object tb_monitoramento: TZTable
    Connection = ZConnection1
    TableName = 'tbl_mnt'
    Left = 248
    Top = 256
    object tb_monitoramentomnt_chr_Placa: TWideStringField
      FieldName = 'mnt_chr_Placa'
      Required = True
      Size = 7
    end
    object tb_monitoramentommn_tyi_ID: TSmallintField
      FieldName = 'mmn_tyi_ID'
      Required = True
    end
    object tb_monitoramentomnt_dtt_DataHoraTrm: TDateTimeField
      FieldName = 'mnt_dtt_DataHoraTrm'
    end
  end
end
