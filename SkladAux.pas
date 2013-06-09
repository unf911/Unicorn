unit SkladAux;

interface

uses Db,untEx,
  Classes, // TComponent
  untRound,
  QueryExtender, //TQueryExtender
  SettingsPlugin,// TfmSettingsPlugin
  untSettings //TfrmSettings
  ;
//����� ��������� ������� ���� ����� ������ ������� � dataset
//����� ���� ����� ��������������� ����
procedure MinusTara(DataSet, ParentDataSet : TDataSet);
//��������� ������ � ������� ����, ����� ����� ������
procedure PlusTara(DataSet, ParentDataSet : TDataSet);
//��������� ���� �������� ���������� ���� ��� ��������������
procedure OpenDocument(ParentWindow :TComponent;Nakl : integer;
  Tip: integer;Mode : integer;ShowDepended:boolean=false);
procedure ProcessSettingsVladClientManager(qeNaklo:TQueryExtender;
  setT:TfrmSettings;
  ProcessOnlySecurityMeasures:boolean=false);
procedure ProcessSettingsPostVladManager(
  qeNaklo:TQueryExtender;
  setT:TfrmSettings;
  ProcessOnlySecurityMeasures:boolean=false);
function UpdateCaptionVladClientManager(Header: string;setT:TfrmSettings):string;
function UpdateCaptionPostVladManager(Header: string;setT:TfrmSettings):string;
//function DefaultOpenInputForm(qeNaklo:TQueryExtender):boolean;
procedure SetManager(Field: TIntegerField;
  SettingsManager: TfmSettingsPlugin);



implementation

uses AtsAssert, Naklr, NaklpBux,SysUtils, PlategyVxod, PlategyIsx, NaklPeremBux,
  untNaklp,untNaklo, Vozvrat, RasxPoKasse, Perevod, Naklru, Naklpu2,
  Naklrf, VozvratPost;
 { TODO : ������� ��� ���� ���� ��������� OpenDocument �� ���� ��������� }
//mode>0 -������ �������
procedure OpenDocument(ParentWindow :TComponent; Nakl : integer;
  Tip: integer;Mode : integer;ShowDepended:boolean=false);
var
  frmNaklr : TfrmNaklr;
  frmNaklpBux: TfrmNaklpBux;
  frmPrix :TfrmPlategyVxod;
  frmPlategy:TfrmPlategyIsx;
  frmNaklo : TfrmNaklo;
  frmNaklp : TfrmNaklp;
  frmNaklPeremBux : TfrmNaklPeremBux;
  frmNaklru : TfrmNaklru;
  sName : string;
begin
try
  if tip=0 then begin
    //��������������� ���� ��������� �� ��� ������
    dmdEx.cdsTemp.Close;
    dmdEx.cdsTemp.CommandText := 'select tip from naklo om where om.id_nakl='+inttostr(nakl);
    dmdEx.cdsTemp.Open;
    tip:=dmdEx.cdsTemp.Fields[0].asInteger;
    dmdEx.cdsTemp.Close;
  end;//tip=0
  sName := dmdEx.GetNameObjects(tip,-100);
  //��� ��������� ������� ����� ������
  if (tip in [5,6,103,30]) then begin
    //�������� �� ������, �� ���������
    frmNaklo := TfrmNaklo.Create(ParentWindow);
    if not ShowDepended then begin
      frmNaklo.qeNaklo.AddSql('where','om.id_nakl='+ inttostr(Nakl));
    end else begin
      frmNaklo.qeNaklo.AddSql('where','om.parent_id_nakl='+ inttostr(Nakl));
    end;
    frmNaklo.actRefresh.Execute;
    if mode>0 then begin
      frmNaklo.cdsNaklot.Locate('id_nakld',mode,[]);
    end;
    frmNaklo.Show;
    exit;
  end;
  if (tip in [1,2]) then begin
    //������� �� ����� �� ���������
    frmNaklp := TfrmNaklp.Create(ParentWindow);
    if not ShowDepended then begin
      frmNaklp.qeNaklo.AddSQL('where','id_nakl='+ inttostr(Nakl));
    end else begin
      frmNaklp.qeNaklo.AddSQL('where','parent_id_nakl='+ inttostr(Nakl));
    end;
    //frmNaklp.qeNaklo.Prepare;
    //frmNaklp.DefaultOpen;
    frmNaklp.actRefresh.Execute;
    if mode>0 then begin
      frmNaklp.cdsNaklpt.Locate('id_nakld',mode,[]);
    end;
    frmNaklp.Show;
    exit;
  end;

  if (sName= '��������� ���������') then begin

    frmNaklr := TfrmNaklr.Create (ParentWindow);
    frmNaklr.ShowNaklr(Nakl, mode);
    exit;
  end; //��������� ���������
  if (sName= '��������� ���������') then begin
    frmNaklpBux := TfrmNaklpBux.Create(ParentWindow);
    if not ShowDepended then begin
      frmNaklpBux.qeNaklo.AddSql('where','id_nakl='+ inttostr(Nakl));
    end else begin
      frmNaklpBux.qeNaklo.AddSql('where','parent_id_nakl='+ inttostr(Nakl));
    end;
    //frmNaklpBux.qeNaklo.SetSQL('where','id_nakl='+
    //  inttostr(Nakl),0);
    frmNaklpBux.actRefresh.Execute;
    //.DefaultOpen;
    if mode>0 then begin
      frmNaklpBux.cdsNaklot.Locate('id_nakld',mode,[]);
    end;
    exit;
  end;
  if (sName= '������') then begin
    frmPrix := TfrmPlategyVxod.Create(ParentWindow);
    frmPrix.qeQuery1.AddSQL(
      'where',
      'id_nakl='+
        inttostr(Nakl)
    ); //����� ������ ����� ���������
    //frmPrix.DefaultOpen;
    frmPrix.actRefresh.Execute;
    exit;
  end; //������
  if (sName= '������ ���������') then begin
    frmPlategy := TfrmPlategyIsx.Create(ParentWindow);
    frmPlategy.qeNaklo.AddSQL(
      'where',
      'id_nakl='+
        inttostr(Nakl)
    ); //����� ������ ����� ���������
    frmPlategy.actRefresh.Execute;
    exit;
  end; //������ ���������
  if (sName= '������������� �����������') then begin
    frmNaklPeremBux := TfrmNaklPeremBux.Create(ParentWindow);
    frmNaklPeremBux.qeNaklo.AddSQL(
      'where',
      'id_nakl='+
        inttostr(Nakl)
    ); //����� ������ ����� ���������
    frmNaklPeremBux.actRefresh.Execute;
    if mode>0 then begin
      frmNaklPeremBux.cdsNaklot.Locate('id_nakld',mode,[]);
    end;
    exit;
  end; //������������� �����������
  if (sName= '�������') then begin
    frmVozvrat := TfrmVozvrat.Create (ParentWindow);
    frmVozvrat.qeNaklo.AddSQL(
      'where',
      'id_nakl='+
        inttostr(Nakl)
    ); //������ ��� ��������
    frmVozvrat.actRefresh.Execute;//�������� ������
    if mode>0 then begin
      frmVozvrat.cdsNaklot.Locate('id_nakld',mode,[]);
    end;
    exit;
  end; //��������
  if (sName= '������ �� �����') then begin
    frmRasxPoKasse := TfrmRasxPoKasse.Create(ParentWindow);
    frmRasxPoKasse.qeNaklo.AddSQL(
      'where',
      'id_nakl='+
        inttostr(Nakl)
    ); //����� ������ ����� ���������
    frmRasxPoKasse.actRefresh.Execute;
    exit;
  end; //������ �� �����
  if (sName= '������� �������') then begin
    frmPerevod := TfrmPerevod.Create(ParentWindow);
    frmPerevod.qeNaklo.SetSQL(
      'where',
      'id_nakl='+
        inttostr(Nakl),0
    ); //����� ������ ����� ���������
    frmPerevod.actRefresh.Execute;
    exit;
  end; //������� �������
  if (sName= '��������� ��������� �� ������') then begin
    frmNaklru := TfrmNaklru.Create (ParentWindow);
    frmNaklru.OpenDocument(Nakl,mode);
    exit;
  end;  // if (sName= '��������� ��������� �� ������')
  if (sName= '��������� ��������� �� ������') then begin
    frmNaklru := TfrmNaklpu2.Create (ParentWindow);
    frmNaklru.OpenDocument(Nakl,mode);
    exit;
  end;  // if (sName= '��������� ��������� �� ������')
  if (sName= '��������� ��������� �� ���������') then begin
    frmNaklru := TfrmNaklrf.Create (ParentWindow);
    frmNaklru.OpenDocument(Nakl,mode);
    exit;
  end;  // if (sName= '��������� ��������� �� ���������')
  if (sName= '������� ����������') then begin
    frmVozvratPost := TfrmVozvratPost.Create (ParentWindow);
    frmVozvratPost.qeNaklo.AddSQL(
      'where',
      'id_nakl='+
        inttostr(Nakl)
    ); //������ ��� ��������
    frmVozvratPost.actRefresh.Execute;//�������� ������
    if mode>0 then begin
      frmVozvratPost.cdsNaklot.Locate('id_nakld',mode,[]);
    end;
    exit;
  end; //��������
except
  AssertInternal('65E41D39-6F2A-4345-A68B-EA95263EDCFF');
end;
end;

procedure MinusTara(DataSet, ParentDataSet : TDataSet);
var
  iTovarBefore : integer;
begin
  if  not dmdEx.isTaraNothing(DataSet.FieldByName('id_tara').asInteger) then begin
    iTovarBefore := ParentDataSet.FieldByName('id_tovar').asInteger;
    if ParentDataSet.Locate(
     'id_tovar',
     DataSet.FieldByName('id_tara').asInteger,[]) then begin
      //was found
      //to prevent user edit
      ParentDataSet.Tag := 1;
      ParentDataSet.Edit;
      ParentDataSet.FieldByName('kolotp').asFloat
       :=ParentDataSet.FieldByName('kolotp').asFloat-1;
      ParentDataSet.CheckBrowseMode;
      if RRoundTo(ParentDataSet.FieldByName('kolotp').asFloat,-4)=0 then begin
        ParentDataSet.Delete;
      end;
      ParentDataSet.Locate('id_tovar',iTovarBefore,[]);
      //to allow user edit
      ParentDataSet.Tag := 0;
    end; //locate
  end;
end;

procedure PlusTara(DataSet, ParentDataSet : TDataSet);
var
  iTovarBefore : integer;
begin
  if (not dmdEx.isTaraNothing(DataSet.FieldByName('id_tara').asInteger)) and
    (DataSet.FieldByName('tip').AsInteger<>5)
  then begin
    iTovarBefore := ParentDataSet.FieldByName('id_tovar').asInteger;
    if ParentDataSet.Locate(
     'id_tovar',
     DataSet.FieldByName('id_tara').asInteger,[]) then begin
      //was found
      //to prevent user edit
      ParentDataSet.Tag := 1;
      ParentDataSet.Edit;
      ParentDataSet.FieldByName('kolotp').asFloat
       :=1+ParentDataSet.FieldByName('kolotp').asFloat;
      ParentDataSet.CheckBrowseMode;
      ParentDataSet.Locate('id_tovar',iTovarBefore,[]);
      //to allow user edit
      ParentDataSet.Tag := 0;
    end else begin
      //was not found

      //to prevent user edit
      ParentDataSet.Tag := 1;
      ParentDataSet.CheckBrowseMode;
      ParentDataSet.Insert;
      ParentDataSet.FieldByName('id_tovar').asInteger
       :=DataSet.FieldByName('id_tara').asInteger;
      ParentDataSet.FieldByName('kolotp').asFloat := 1;
      ParentDataSet.CheckBrowseMode;
      ParentDataSet.Locate('id_tovar',iTovarBefore,[]);
      //to allow user edit
      ParentDataSet.Tag := 0;
    end; //locate
  end;
end;

//������������� ������� ������ �� ���������, ����
procedure ProcessManagerDat(
  qeNaklo:TQueryExtender;
  setT:TfrmSettings;
  ProcessOnlySecurityMeasures:boolean=false);
begin
  qeNaklo.ProcessPlugin(
    'om.id_manager',
    setT.GetPluginResult('fmSettingsManager'),
    0,
    'in');

  if not ProcessOnlySecurityMeasures then begin
    qeNaklo.ProcessPlugin('om.dat',QuotedStr(datetostr(setT.DateFrom)),3,'>=');
    qeNaklo.ProcessPlugin('om.dat',QuotedStr(datetostr(setT.DateTo)),4,'<=');
  end;
end;

//������������� ������� ������ �� ����������, ����������, ���������
procedure ProcessSettingsVladClientManager(
  qeNaklo:TQueryExtender;
  setT:TfrmSettings;
  ProcessOnlySecurityMeasures:boolean=false);
begin
  ProcessManagerDat(qeNaklo,setT,ProcessOnlySecurityMeasures);

  qeNaklo.ProcessPlugin(
    'om.id_izg',
    setT.GetPluginResult('fmSettingsVlad'),
    1,
    '=');
  qeNaklo.ProcessPlugin(
    'om.id_zak',
    setT.GetPluginResult('fmSettingsClient'),
    2,
    '=');
end;


//������������� ������� ������ �� ����������, ����������, ���������
procedure ProcessSettingsPostVladManager(
  qeNaklo:TQueryExtender;
  setT:TfrmSettings;
  ProcessOnlySecurityMeasures:boolean=false);
begin
  ProcessManagerDat(qeNaklo,setT,ProcessOnlySecurityMeasures);
  qeNaklo.ProcessPlugin(
    'om.id_izg',
    setT.GetPluginResult('fmSettingsPost'),
    1,
    '=');
  qeNaklo.ProcessPlugin(
    'om.id_zak',
    setT.GetPluginResult('fmSettingsVlad'),
    2,
    '=');
end;

function UpdateCaptionManagerDat(Header: string;setT:TfrmSettings):string;
var
  Caption : string;
begin
  Caption := Header
    + ' ������: c ' + datetostr (setT.DateFrom)
    + ' �� '+ datetostr(setT.DateTo)+'. ';
  if setT.GetPluginResult('fmSettingsManager')<>'' then begin
    Caption := Caption + '��������: '+setT.GetPluginTextResult('fmSettingsManager')+'. ';
  end;
  Result:=Caption;
end;

//������� ��������� ���� � ����������� �� ������� ������
function UpdateCaptionVladClientManager(Header: string;setT:TfrmSettings):string;
var
  Caption : string;
begin
  Caption := UpdateCaptionManagerDat(Header,setT);
  if setT.GetPluginResult('fmSettingsVlad')<>'' then begin
    Caption := Caption + '���������: '+setT.GetPluginTextResult('fmSettingsVlad')+'. ';
  end;
  if setT.GetPluginResult('fmSettingsClient')<>'' then begin
    Caption := Caption + '����������: '+setT.GetPluginTextResult('fmSettingsClient')+'. ';
  end;
  Result:=Caption;
end;

//������� ��������� ���� � ����������� �� ������� ������
function UpdateCaptionPostVladManager(Header: string;setT:TfrmSettings):string;
var
  Caption : string;
begin
  Caption := UpdateCaptionManagerDat(Header,setT);
  if setT.GetPluginResult('fmSettingsPost')<>'' then begin
    Caption := Caption + '���������: '+setT.GetPluginTextResult('fmSettingsClient')+'. ';
  end;
  if setT.GetPluginResult('fmSettingsVlad')<>'' then begin
    Caption := Caption + '����������: '+setT.GetPluginTextResult('fmSettingsVlad')+'. ';
  end;
  Result:=Caption;
end;
{
function DefaultOpenInputForm(qeNaklo:TQueryExtender):boolean;
begin
  Result :=true;
	dmdEx.startWaiting;
  qeNaklo.Refresh;
  if not qeNaklo.Query.Active then begin
    Result :=false;
  end;
	dmdEx.StopWaiting;
end;
}

procedure SetManager(Field: TIntegerField;
  SettingsManager: TfmSettingsPlugin);
var
  sManager : string;
begin
  SettingsManager.SetResultType(1);
  sManager:=SettingsManager.GetResult;
  SettingsManager.SetResultType(2);
  if sManager<>'' then begin
    Field.AsInteger := strtoint(sManager);
  end;
end;


end.
 