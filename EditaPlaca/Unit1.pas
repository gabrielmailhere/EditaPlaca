unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.DBXMSSQL, Data.FMTBcd, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Datasnap.Provider, Datasnap.DBClient, Vcl.ExtCtrls, Vcl.DBLookup,
  Vcl.Buttons, JvExControls, JvDBLookup, ZAbstractConnection, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractTable, JvExMask,
  JvToolEdit, JvMaskEdit, JvDBControls, DateUtils, Vcl.ComCtrls, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker;

type
  TForm1 = class(TForm)
    dsTab_Monitoramento: TDataSource;
    dsqrygrid: TDataSource;
    ZConnection1: TZConnection;
    Zqrygrid: TZQuery;
    Zqrygridmnt_chr_placa: TWideStringField;
    Zqrygridmmn_tyi_id: TSmallintField;
    Zqrygridmmn_vch_dsc: TWideStringField;
    Zqrygridmnt_dtt_dataHoratrm: TDateTimeField;
    qryCombo: TZQuery;
    tb_monitoramento: TZTable;
    tb_monitoramentomnt_chr_Placa: TWideStringField;
    tb_monitoramentommn_tyi_ID: TSmallintField;
    tb_monitoramentomnt_dtt_DataHoraTrm: TDateTimeField;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    btnLocalizar: TBitBtn;
    JvDBMaskEdit1: TJvDBMaskEdit;
    procedure Button1Click(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    function combomotivo(campo:string ): string;
    procedure habilitaBotoes(valor: bool);
    procedure habilitaControles(valor: bool);
    function GeraDataComDefault(Valor: String): TDateTime;
  public
  var NovoRegistro : bool;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
///habilita/desabilita os botões de crud de registro
procedure TForm1.habilitaBotoes(valor: bool);
begin
  Button1.Enabled := valor;
  Button3.Enabled := valor;
  Button4.Enabled := valor;
end;

//habilita/desabilita os controles de crud do registro
procedure TForm1.habilitaControles(valor: bool);
begin
  DBEdit1.Enabled := valor;
  ComboBox1.Enabled := valor;
  JvDBMaskEdit1.Enabled := valor;
end;

//gera os itens da combo de motivo
function TForm1.combomotivo(campo:string ): string;
begin
  qryCombo.Active := false;
  qryCombo.SQL.Clear;
  qryCombo.SQL.Text := 'select mmn_tyi_ID from tbl_mtvmnt where mmn_vch_Dsc =' + QuotedStr(trim(ComboBox1.Text));
  qryCombo.Active := true;

  Result := qryCombo.FieldByName('mmn_tyi_ID').AsString;
end;

//gera uma data com hora default caso o usuário tenha apenas digitado data
function TForm1.GeraDataComDefault(Valor: String ): TDateTime;
var
  EdataSemHora : bool;
  DataRetorno  : TDateTime;
begin
  EdataSemHora := false;
  DataRetorno := -700000 + 1;

  EdataSemHora := TryStrToDate(Valor, DataRetorno);

  if(EdataSemHora) then
    begin
      ReplaceTime(DataRetorno, StrToDateTime(Valor + '23:59:59'));
      Result := DataRetorno;
    end
      else Result := StrToDateTime(Valor);
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  if Zqrygrid.RecordCount > 0 then
  begin
    tb_monitoramento.Active := true;

    habilitaBotoes(true);
    habilitaControles(true);

    ComboBox1.Text := Zqrygridmmn_vch_dsc.AsString;
    tb_monitoramento.Locate('mnt_chr_placa', Zqrygridmnt_chr_placa.AsString,[loPartialKey]);

    DBEdit1.SetFocus;
  end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  if Zqrygrid.RecordCount > 0
   then Zqrygrid.SortedFields := Column.FieldName;
end;

procedure TForm1.btnLocalizarClick(Sender: TObject);
var
  placa : string;
begin
  placa := InputBox('Localizar Placa','Placa', '');
  if Length(trim(placa)) > 0 then
    begin
      Zqrygrid.Locate('mnt_chr_placa', placa, [loPartialKey, loCaseInsensitive]);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
  var
    EncontrouPlaca: bool;
begin
try
  begin
    EncontrouPlaca := Zqrygrid.Locate('mnt_chr_Placa', trim(DBEdit1.Text),[loCaseInsensitive]);
    if(EncontrouPlaca and NovoRegistro)
    then
      begin
        showmessage('A placa [' +trim(DBEdit1.Text)+ '] já está cadastrada!');
        Button4.Click;
        exit;
      end;
  end;

  begin
    tb_monitoramento.Edit;
    tb_monitoramentommn_tyi_ID.AsString := combomotivo('mmn_tyi_ID');

    if Length(trim(DBEdit1.Text)) = 0
    then
      begin
        ShowMessage('Placa Não pode estar em branco!');
        Exit;
      end;

    if Length(trim(tb_monitoramentommn_tyi_ID.AsString)) = 0
    then
      begin
        ShowMessage('Selecione um Motivo!');
        ComboBox1.DroppedDown := true;
        Exit;
      end;

    If (NovoRegistro) and ((Length(trim(tb_monitoramentomnt_dtt_DataHoraTrm.AsString))) > 0)
      then tb_monitoramentomnt_dtt_DataHoraTrm.AsDateTime := GeraDataComDefault(tb_monitoramentomnt_dtt_DataHoraTrm.AsString);

    tb_monitoramento.ApplyUpdates;

    tb_monitoramento.Active := false;
    habilitaBotoes(false);
    habilitaControles(false);

    ComboBox1.Text := '...';
    NovoRegistro := false;

    Zqrygrid.Refresh;
    StatusBar1.Panels[0].Text := 'Registros Cadastrados: ' + IntToStr(Zqrygrid.RecordCount);
  end;
  except on E: Exception do
    ShowMessage('Erro ao salvar o registro: '+ e.Message);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  habilitaBotoes(true);
  habilitaControles(true);

  tb_monitoramento.Active := true;
  tb_monitoramento.Insert;

  DBEdit1.SetFocus;

  NovoRegistro := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar o registro', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      if tb_monitoramento.Active = false
        then tb_monitoramento.Active := true;

      tb_monitoramento.Delete;
      tb_monitoramento.ApplyUpdates;
      Zqrygrid.Refresh;

      habilitaBotoes(false);
      habilitaControles(false);
      tb_monitoramento.Active := false;

      StatusBar1.Panels[0].Text := 'Registros Cadastrados: ' + IntToStr(Zqrygrid.RecordCount);
    end
    else
      habilitaBotoes(false);
      habilitaControles(false);
      tb_monitoramento.Active := false;
      NovoRegistro := false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  habilitaBotoes(false);
  habilitaControles(false);

  tb_monitoramento.Cancel;

  ComboBox1.Text:= '...';
  tb_monitoramento.Active := false;
  NovoRegistro := false;
end;

procedure TForm1.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  ComboBox1.Text := '...';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  habilitaBotoes(false);
  habilitaControles(false);

  NovoRegistro := false;

  qryCombo.Active := false;
  qryCombo.SQL.Clear;
  qryCombo.SQL.Text := 'select mmn_vch_Dsc from tbl_mtvmnt';
  qryCombo.Active := true;

   while not qryCombo.Eof do
    begin
      ComboBox1.Items.Add(qryCombo.FieldByName('mmn_vch_Dsc').AsString);
      qryCombo.Next;
    end;
    qryCombo.Active := false;

    StatusBar1.Panels[0].Text := 'Registros Cadastrados: ' + IntToStr(Zqrygrid.RecordCount);
end;

end.
