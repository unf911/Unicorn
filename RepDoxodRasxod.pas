unit RepDoxodRasxod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RepDolgBuxPost, SettingsPlugin, untEx, untSettings, FMTBcd, DB,
  SqlExpr, ActnList, Menus, DbGridEh, DBClient, Provider,
  atsAssert, //AssertInternal
  SettingsDataset,  //TfmSettingsDataset
  QueryExtender

  ;

type
  TFormReportClass = class of TfrmRepDolgBuxPost;

  TfrmRepDoxodRasxod = class(TfrmRepDolgBuxPost)
    sdsDolgBux2: TSQLDataSet;
    dspDolgBux2: TDataSetProvider;
    cdsDolgBux2: TClientDataSet;
    MainMenu2: TMainMenu;
    mnuAction2: TMenuItem;
    ActionList2: TActionList;
    actSpisanieSebestRecount: TAction;
    N1: TMenuItem;
    sdsSpisanieSebestRecount: TSQLDataSet;

    procedure FormCreate(Sender: TObject);
    procedure actSpisanieSebestRecountExecute(Sender: TObject);

  private
    { Private declarations }
    SettingsDataset : TfmSettingsDataset;
    SettingsGroup : TfmSettingsPlugin;
    procedure SetDatasets;
    procedure FillGroup;
    procedure FillCurrency;
    procedure ProcessGroup(iMode: integer; qeDolgBux: TQueryExtender);
  protected
    procedure FillSettings;

    procedure Refresh; override;

    procedure ProcessSettings;override;

    procedure ShowDetail;override;
    function ShowDetailForm(
      iMode: integer;
      dat_from, dat_to: TDate;
      id_currency_to: integer;
      id_nakl, sub1_in, sub2_in, sub3_in: variant): integer;
    procedure UpdateCaption;
    procedure Debug;override;
    procedure ProcessColumns(DataSet:TDataSet; iMode :integer);
    procedure AddMenuItemSpisanieSebestRecount;
  public
    procedure  DefaultStartup; override;

  {  function Defaultopen:boolean;}

    { Public declarations }
  end;

var
  frmRepDoxodRasxod: TfrmRepDoxodRasxod;

implementation

uses 
  SkladAux, //OpenDocument
  DateUtils, // Today, StartOfTheMonth
  untRound //InIde
  ;

{$R *.dfm}

procedure TfrmRepDoxodRasxod.FormCreate(Sender: TObject);
begin
  SetDatasets;
  FillSettings;
  AddMenuItemSpisanieSebestRecount;
end;

procedure TfrmRepDoxodRasxod.AddMenuItemSpisanieSebestRecount;
begin

end;

procedure TfrmRepDoxodRasxod.FillSettings;
begin
  setT := TfrmSettings.Create(self);
  setT.actManagerOff.Execute;
  FillCurrency;
  FillGroup;
  FillCopy(DBGridEh1);
  //before was error on refresh about sub1
  qeDolgBux.KeyField:='';
  PropStorageEh1.section := 'TfrmRepDoxodRasxod';
end;

procedure TfrmRepDoxodRasxod.FillGroup;
begin
  SettingsGroup := setT.CreatePlugin('TfmSettingsTipDetail');
  SettingsGroup.AddDetailTip('�� �������');
  SettingsGroup.AddDetailTip('�� �������, �������');
  SettingsGroup.AddDetailTip('�� ����������');
  SettingsGroup.AddDetailTip('�� ����������, �������');
  setT.AddPlugin(SettingsGroup);
end;

procedure TfrmRepDoxodRasxod.FillCurrency;
begin
  SettingsDataset := TfmSettingsDataset.Create(self);
  SettingsDataset.SetLabelValue(
    '������','����� ������','�� ������� ������');
  SettingsDataset.SetListSource(dmdEx.dsCurrency,'name','oid');
  //������������ ���������� ������
  SettingsDataset.SetResultType(1);
  //SettingsDataset.SetKeyValue();
  setT.AddPlugin(SettingsDataset);
end;


procedure TfrmRepDoxodRasxod.Refresh;
begin
  dmdEx.startWaiting;
  if dsDolgBux.DataSet.active then begin
    if not actDebug.checked then begin
      PropStorageEh1.SaveProperties;
    end;
  end;
  if cdsDolgBux2.active then begin
    cdsDolgBux2.cancelupdates;
  end;
  qeDolgBux.Refresh;
  ProcessColumns(cdsDolgBux2, strtoint(setT.GetPluginResult('fmSettingsTipDetail')));
  PropStorageEh1.LoadProperties;
  dmdEx.stopWaiting;
end;

procedure TfrmRepDoxodRasxod.ShowDetail;
var
  frmRepDoxodRasxod: TfrmRepDoxodRasxod;
  iMode, iModeDetail : integer;
begin
  iMode := strtoint(setT.GetPluginResult('fmSettingsTipDetail'));
  if iMode in [0, 1, 2] then begin
    frmRepDoxodRasxod :=TfrmRepDoxodRasxod.Create(Self);
    if iMode=0 then begin
      iModeDetail := 2; //�� ���������
      frmRepDoxodRasxod.ShowDetailForm(iModeDetail,
        setT.DateFrom,setT.DateTo,
        strtoint(setT.GetPluginResult('fmSettingsDataset')),
        null,
        cdsDolgBux2.FieldByName('sub1').asInteger,
        cdsDolgBux2.FieldByName('sub2').asInteger,
        null);
    end;
    if iMode=1 then begin
      iModeDetail := 3; //�� ���������, ������
      frmRepDoxodRasxod.ShowDetailForm(iModeDetail,
        setT.DateFrom,setT.DateTo,
        strtoint(setT.GetPluginResult('fmSettingsDataset')),
        cdsDolgBux2.FieldByName('id_nakl').asInteger,
        cdsDolgBux2.FieldByName('sub1').asInteger,
        cdsDolgBux2.FieldByName('sub2').asInteger,
        cdsDolgBux2.FieldByName('sub3').asInteger);
    end;
    if iMode=2 then begin
      iModeDetail := 3; //�� ���������, ������
      frmRepDoxodRasxod.ShowDetailForm(iModeDetail,
        setT.DateFrom,setT.DateTo,
        strtoint(setT.GetPluginResult('fmSettingsDataset')),
        cdsDolgBux2.FieldByName('id_nakl').asInteger,
        cdsDolgBux2.FieldByName('sub1').asInteger,
        cdsDolgBux2.FieldByName('sub2').asInteger,
        null);
    end;
  end;
  if iMode = 3 then begin
    OpenDocument(
      self,
      cdsDolgBux2.FieldByName('id_nakl').asInteger,
      0,
      0);
  end;
  {
  frmRepDoxodRasxodDet :=TfrmRepDoxodRasxodDet.Create(Self);
  frmRepDoxodRasxodDet.ShowDetail(setT.DateFrom,setT.DateTo,
    //������ � ����������� ���������
    strtoint(setT.GetPluginResult('fmSettingsDataset')),
    cdsDolgBux2.FieldByName('sub1').asInteger,
    cdsDolgBux2.FieldByName('sub2').asInteger,
    cdsDolgBux2.FieldByName('sub3').asInteger,
    null);
  }
end;

function TfrmRepDoxodRasxod.ShowDetailForm(
  iMode: integer;
  dat_from, dat_to: TDate;
  id_currency_to: integer;
  id_nakl, sub1_in, sub2_in, sub3_in: variant): integer;
begin
  actSettings.Visible := false;

  SettingsGroup.SetKeyValue(iMode);
  setT.DateFrom := dat_from;
  setT.DateTo := dat_to;
  SettingsDataset.SetKeyValue(id_currency_to);

  cdsDolgBux2.Close;
  cdsDolgBux2.Params.ParamValues['id_nakl_in']:=id_nakl;
  cdsDolgBux2.Params.ParamValues['sub1_in']:=sub1_in;
  cdsDolgBux2.Params.ParamValues['sub2_in']:=sub2_in;
  cdsDolgBux2.Params.ParamValues['sub3_in']:=sub3_in;

  DefaultOpen;
  Result := 0;
end;

procedure TfrmRepDoxodRasxod.DefaultStartup;
var
  idCurrencyUSD : integer;
begin
  //���������� �����
  setT.SetPeriod(7);
  //����� ������� ��� ������ ������
  idCurrencyUSD:=dmdEx.GetParamCached('��� �����',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('��� �����')+',-100)',
    'oid');
  idCurrencyUSD :=dmdEx.GetParamCached('USD',
    'select oid from GET_OID_OBJECTS_PC('+quotedstr('USD')+','+inttostr(idCurrencyUSD)+')',
    'oid');
  SettingsDataset.setKeyValue(idCurrencyUSD);
  //�� �������
  SettingsGroup.SetKeyValue(0);
end;



procedure TfrmRepDoxodRasxod.UpdateCaption;
begin
  self.Caption := '������ ������ � ������� � ' +
    DateToStr(setT.DateFrom) +
    ' �� '+DateToStr(setT.DateTo)+
    '. ������ '+
    setT.GetPluginTextResult('fmSettingsDataset');
    ;
end;

procedure TfrmRepDoxodRasxod.Debug;
var
  iMode : integer;
begin
  actDebug.Checked := not actDebug.Checked;
  iMode := strtoint(setT.GetPluginResult('fmSettingsTipDetail'));
  if actDebug.Checked then begin
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB1', true);
    MakeFieldLast(dsDolgBux.DataSet,'SUB1');
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB2', true);
    MakeFieldLast(dsDolgBux.DataSet,'SUB2');
    if iMode in [2,3] then begin
      MakeFieldVisible(dsDolgBux.DataSet, 'ID_NAKL', true);
      MakeFieldLast(dsDolgBux.DataSet,'ID_NAKL');
    end;
    if iMode = 2 then begin
      MakeFieldVisible(dsDolgBux.DataSet, 'SUB3', true);
      MakeFieldLast(dsDolgBux.DataSet,'SUB3');
    end;
  end else begin
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB1', false);
    MakeFieldVisible(dsDolgBux.DataSet, 'SUB2', false);
    if iMode in [2,3] then begin
      MakeFieldVisible(dsDolgBux.DataSet, 'ID_NAKL', false);
    end;
    if iMode = 2 then begin
      MakeFieldVisible(dsDolgBux.DataSet, 'SUB3', false);
    end;
  end;

end;

procedure TfrmRepDoxodRasxod.SetDatasets;
begin
  qeDolgBux.Query := cdsDolgBux2;
  qeDolgBux.DefSql := sdsDolgBux2.CommandText;
  qeDolgBux.KeyField := 'sub2';
  dsDolgBux.DataSet := cdsDolgBux2;
end;

procedure TfrmRepDoxodRasxod.ProcessSettings;
begin
  cdsDolgBux2.Params.ParamByName('dat_to').AsDate := setT.DateTo;
  cdsDolgBux2.params.ParamByName('dat_from').AsDate := setT.DateFrom;

  dmdEx.SetIntegerParamValue(
    cdsDolgBux2.Params.ParamByName('id_currency_to'),
    setT.GetPluginResult('fmSettingsDataset'));

  ProcessGroup(strtoint(setT.GetPluginResult('fmSettingsTipDetail')), qeDolgBux);  
  UpdateCaption;
end;

procedure TfrmRepDoxodRasxod.ProcessGroup(iMode: integer; qeDolgBux: TQueryExtender);
begin
  if iMode=0 then begin
    //'�� ������'
    qeDolgBux.setsql(
      'select','',
      0);
    qeDolgBux.setsql(
      'group by','',
      0);
    qeDolgBux.setsql(
      'order by','1,2', //sub1_name,sub2_name,
      0);
    PropStorageEh1.section := 'TfrmRepDoxodRasxod_group0';
  end;
  if iMode=1 then begin
    //'�� ������, ������'
    qeDolgBux.setsql(
      'select',
      '(select name from objects o where o.oid=r.sub3) as sub3_name, r.sub3',
      0);
    qeDolgBux.setsql(
      'group by','r.sub3',
      0);
    qeDolgBux.setsql(
      'order by','3,4,1', //sub1_name,sub2_name,sub3_name
      0);
    PropStorageEh1.section := 'TfrmRepDoxodRasxod_group1';
  end;
  if iMode=2 then begin
    //'�� ������, ���������'
    qeDolgBux.setsql(
      'select',
      '(select id from naklo o where o.id_nakl=r.id_nakl) as id, r.id_nakl, r.dat',
      0);
    qeDolgBux.setsql(
      'group by','r.id_nakl, r.dat',
      0);
    qeDolgBux.setsql(
      'order by','4,5,3,1', //sub1_name,sub2_name,dat,id
      0);
    PropStorageEh1.section := 'TfrmRepDoxodRasxod_group2';
  end;
  if iMode=3 then begin
    //'�� ������, ���������, ������'
    qeDolgBux.setsql(
      'select',
      '(select id from naklo o where o.id_nakl=r.id_nakl) as id, r.id_nakl, '+
      '(select name from objects o where o.oid=r.sub3) as sub3_name, r.sub3, r.dat',
      0);
    qeDolgBux.setsql(
      'group by','r.id_nakl, r.sub3, r.dat',
      0);
    qeDolgBux.setsql(
      'order by','6,7,5,1,3', //sub1_name,sub2_name,dat,id, sub3_name
      0);
    PropStorageEh1.section := 'TfrmRepDoxodRasxod_group3';
  end;
end;

procedure TfrmRepDoxodRasxod.ProcessColumns(DataSet: TDataSet; iMode :integer);
begin
  with Dataset do begin
    FindField('SUB1').Visible := false;
    FindField('SUB2').Visible := false;
    FindField('KURS').DisplayLabel := '����';
    TNumericField(FindField('KURS')).DisplayFormat := '0.00###';
    FindField('KURS_INDIRECT').DisplayLabel := '�������� ����';
    FindField('SUB1_NAME').DisplayLabel := '������';
    FindField('SUB1_NAME').DisplayWidth := 10;
    FindField('SUB2_NAME').DisplayLabel := '������';
    FindField('SUB2_NAME').DisplayWidth := 20;
    FindField('DEBET').DisplayLabel := '�����';
    TNumericField(FindField('DEBET')).DisplayFormat := '0.00';
    FindField('KREDIT').DisplayLabel := '������';
    TNumericField(FindField('KREDIT')).DisplayFormat := '0.00';
    FindField('SUMINCURRENCY').DisplayLabel := '�����';
    TNumericField(FindField('SUMINCURRENCY')).DisplayFormat := '0.00';

    if iMode in [0,2] then begin
      FindField('KURS').Visible := false;
      FindField('KURS_INDIRECT').Visible := false;
      FindField('DEBET').Visible := false;
      FindField('KREDIT').Visible := false;
    end;
    if iMode in [1] then begin
      FindField('SUB3').Visible := false;
      FindField('SUB3_NAME').DisplayLabel := '������';
      FindField('SUB3_NAME').DisplayWidth := 5;
      FindField('SUB3_NAME').Index := 3;
    end;
    if iMode in [2,3] then begin
      FindField('ID_NAKL').Visible := false;
      FindField('ID').DisplayLabel := '� ���';
      FindField('ID').DisplayWidth := 5;
      FindField('ID').Index := 5;
      TSqlTimeStampField(FindField('DAT')).DisplayFormat := 'dd.mm.yy';
      FindField('DAT').DisplayLabel := '����';
      FindField('DAT').DisplayWidth := 8;
      FindField('DAT').Index := 5;
    end;
    if iMode in [3] then begin
      FindField('ID').Index := 6;
      FindField('DAT').Index := 6;
      
      FindField('SUB3').Visible := false;
      FindField('SUB3_NAME').DisplayLabel := '������';
      FindField('SUB3_NAME').DisplayWidth := 5;
      FindField('SUB3_NAME').Index := 6;
    end;
  end;//with
  if iMode in [0,1,2,3] then begin
    ColumnByName(DBGridEh1.Columns,'SUMINCURRENCY').Footer.ValueType:=fvtSum;
  end;
  //���� "�������� ����" ������ ���� � ���� �������
  if iMode in [1,3] then begin
    //���� "�������� ����" ������ ���� � ���� �������
    ShowCheckboxForColumn(ColumnByName(DBGridEh1.Columns,'KURS_INDIRECT'));
    ColumnByName(DBGridEh1.Columns,'DEBET').Footer.ValueType:=fvtSum;
    ColumnByName(DBGridEh1.Columns,'KREDIT').Footer.ValueType:=fvtSum;
  end;

  DBGridEh1.ColumnDefValues.Title.TitleButton := true;
end;


procedure TfrmRepDoxodRasxod.actSpisanieSebestRecountExecute(
  Sender: TObject);
begin
  inherited;
  sdsSpisanieSebestRecount.Params.ParamByName('dat_from').AsDate := setT.DateFrom;
  sdsSpisanieSebestRecount.Params.ParamByName('dat_to').AsDate := setT.DateTo;
  dmdEx.OpenQuery(sdsSpisanieSebestRecount);
  dmdEx.CloseQuery(sdsSpisanieSebestRecount);
end;

end.
