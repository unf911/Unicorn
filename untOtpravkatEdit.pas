unit untOtpravkatEdit;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, DB,
  DBLookupEh, DBCtrlsEh, Mask,
  DBTables, ComCtrls,SqlTimSt,DBClient, Buttons,
  untEx,FMTBcd, Provider,
  SqlExpr, DBCtrls,
  untRound, Grids, DBGridEh, PropStorageEh, UnfFilter, ExtCtrls,
  Registry, QueryExtender,
  atsAssert,
  untSettings, PropFilerEh, GridsEh //TfrmSettings
  ;

type
  TfrmOtpravkatEdit = class(TForm)
    ActionList1: TActionList;
    actCancel: TAction;
    actApply: TAction;
    actOk: TAction;
    sdsNaklo: TSQLDataSet;
    dspNaklo: TDataSetProvider;
    cdsNaklo: TClientDataSet;
    dsNaklot: TDataSource;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    dsNakloEdit: TDataSource;
    cdsNakloID_NAKL: TIntegerField;
    cdsNakloID_IZG: TIntegerField;
    cdsNakloID_ZAK: TIntegerField;
    cdsNakloID_MANAGER: TIntegerField;
    cdsNakloCOMMENT: TStringField;
    cdsNakloIZG: TStringField;
    cdsNakloZAK: TStringField;
    cdsNakloMANAGER: TStringField;
    cdsNakloDAT: TSQLTimeStampField;
    cdsNakloBLOCKED: TSmallintField;
    cdsNakloID: TStringField;
    Splitter1: TSplitter;
    qeSklost: TQueryExtender;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    dbgSklost: TDBGridEh;
    GroupBox2: TGroupBox;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    actAdd: TAction;
    actRemove: TAction;
    UnfFilter1: TUnfFilter;
    actSettings: TAction;
    SpeedButton1: TSpeedButton;
    dbgOtpravkat: TDBGridEh;
    cdsNakloPOSTED: TSmallintField;
    actRefresh: TAction;
    procedure actCancelExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbTipConstCloseUp(Sender: TObject; Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);

  private
    { Private declarations }
    FDateFrom : TDateTime;
    procedure ProcessSettings;
  public
    setT : TfrmSettings;
    function ShowDetail(id_sklad:integer;id_nakl:integer): integer;
    { Public declarations }
  published
    property DateFrom : TDateTime read FDateFrom write FDateFrom;
  end;

var
  frmOtpravkatEdit: TfrmOtpravkatEdit;

implementation

{$R *.dfm}

procedure TfrmOtpravkatEdit.actCancelExecute(Sender: TObject);
begin
  dsNakloEdit.DataSet.Cancel;
  CancelUpdates(dsNakloEdit.DataSet);
  ModalResult := mrCancel;
end;

procedure TfrmOtpravkatEdit.actOkExecute(Sender: TObject);
begin
  actApply.Execute;
  ModalResult := mrOk;
end;

{
procedure TfrmOtpravkatEdit.btnOkKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;

procedure TfrmOtpravkatEdit.btnCancelKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;

procedure TfrmOtpravkatEdit.btnOkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := VK_OEM_CLEAR;
end;
}

procedure TfrmOtpravkatEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
//  save grid
  reg1 :TRegIniFile;
begin
  reg1 := TRegIniFile.Create('Software\Eurosystems\Uchet');
//  dbgSklostt.SaveColumnsLayout(reg1);
  dbgSklost.SaveColumnsLayout(reg1);
  dbgOtpravkat.SaveColumnsLayout(reg1);
  reg1.Free;
  //end save grid
  cdsNaklo.Close;
	//Action := caFree;
end;

procedure TfrmOtpravkatEdit.lcbTipConstCloseUp(Sender: TObject;
  Accept: Boolean);
begin
//В будущем при выборе накладной по излишкам здесь дописать
//изменения в форме редактирования, типа изменения lookupdataset
end;

procedure TfrmOtpravkatEdit.FormCreate(Sender: TObject);
var
  reg1 :TRegIniFile;
  col1 :TColumnEhRestoreParams;
begin
  //restore grid
  reg1 := TRegIniFile.Create('Software\Eurosystems\Uchet');
  col1 := [crpColWidthsEh];
//  dbgSklostt.RestoreColumnsLayout(reg1,col1);
  dbgSklost.RestoreColumnsLayout(reg1,col1);
  dbgOtpravkat.RestoreColumnsLayout(reg1,col1);
  reg1.Free;
  //end restore grid

  setT := TfrmSettings.Create(self);
  //setT.IDManager:=0; // all
  setT.actManagerOff.Execute;
  setT.SetPeriod(2); //ровно месяц
  qeSklost.DefSql := sdsNaklo.CommandText;
  ProcessSettings;
end;

procedure TfrmOtpravkatEdit.ProcessSettings;
begin
    self.Caption :='Отгрузки со склада. '
      + ' Период: c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo)+'.';
    qeSklost.SetSQL('where',
      'om.dat>='+ QuotedStr(datetostr(setT.DateFrom)),0);
    qeSklost.SetSQL('where',
      'om.dat<='+ QuotedStr(datetostr(setT.DateTo))  ,1);
    qeSklost.Prepare;
end;

function TfrmOtpravkatEdit.ShowDetail(id_sklad, id_nakl: integer): integer;
begin
  Result:=0;
try
	dmdEx.StartWaiting;

	cdsNaklo.Close;
//  cdsSklostdet.Params.ParamByName('id_tovar').AsInteger:=id_tovar;
	cdsNaklo.Params.ParamByName('id_sklad').AsInteger:=id_sklad;
  qeSklost.Refresh;
//  cdsNaklo.Open;
  cdsNaklo.Filtered := false;
//	cdsNaklodet.Params.ParamByName('id_nakld').asInteger:=id_nakl;
//	cdsNaklodet.Open;
	dmdEx.StopWaiting;
	Result := self.ShowModal;
except
	AssertInternal('224A296D-0E58-4E09-9D36-4A4F26230702');
end;
end;

procedure TfrmOtpravkatEdit.actAddExecute(Sender: TObject);
begin
try
  if dsNakloEdit.DataSet.Locate(
   'id_pos',
   dsNaklot.DataSet.FieldByName('id_nakl').asInteger,
   []) then begin
    MessageDlg('Накладная уже есть в отправке',mtWarning,[mbOK],0);
    Exit;
  end;
  dsNakloEdit.DataSet.Append;
  dsNakloEdit.DataSet.FieldByName('id_pos').AsInteger :=
    dsNaklot.DataSet.FieldByName('id_nakl').asInteger;
  dsNakloEdit.DataSet.FieldByName('id_izg').AsInteger :=
    dsNaklot.DataSet.FieldByName('id_izg').asInteger;
  dsNakloEdit.DataSet.FieldByName('id_zak').AsInteger :=
    dsNaklot.DataSet.FieldByName('id_zak').asInteger;
  dsNakloEdit.DataSet.FieldByName('id_manager').AsInteger :=
    dsNaklot.DataSet.FieldByName('id_manager').asInteger;
  dsNakloEdit.DataSet.FieldByName('blocked').AsInteger :=
    dsNaklot.DataSet.FieldByName('blocked').asInteger;
  dsNakloEdit.DataSet.FieldByName('dat').AsSQLTimeStamp :=
    dsNaklot.DataSet.FieldByName('dat').AsSQLTimeStamp;
  dsNakloEdit.DataSet.FieldByName('id').AsString :=
    dsNaklot.DataSet.FieldByName('id').AsString;
  dsNakloEdit.DataSet.FieldByName('posted').AsInteger :=
    dsNaklot.DataSet.FieldByName('posted').AsInteger;
  dsNakloEdit.DataSet.Post;
except
  AssertInternal('4E17EBE3-E0F6-4E65-B50D-3976158EFA03');
end;
end;

procedure TfrmOtpravkatEdit.actApplyExecute(Sender: TObject);
begin
  dsNakloEdit.DataSet.CheckBrowseMode;
  ApplyOrCancel(dsNakloEdit.DataSet);
end;

procedure TfrmOtpravkatEdit.actRemoveExecute(Sender: TObject);
begin
  if not (dsNakloEdit.DataSet.bof and dsNakloEdit.DataSet.eof) then begin
    dsNakloEdit.DataSet.Delete;
  end;
end;

procedure TfrmOtpravkatEdit.actSettingsExecute(Sender: TObject);
begin
  actSettings.checked := setT.ProcessSettingsChange(actRefresh);
end;

procedure TfrmOtpravkatEdit.actRefreshExecute(Sender: TObject);
begin
  ProcessSettings;
  qeSklost.Refresh;

end;

end.
