unit untNaklr2;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs,
  DB, DBTables, Grids, DBGrids,
  ActnList,
  StdCtrls, untSettings,
  QueryExtender, DBCtrls,
  untUnfDbLookupListbox,
  untListBoxPosit, ExtCtrls,
    
  untSchetList,untRound, Curr2StrRU,
  Mask, DBCtrlsEh, DBGridEh,
  untNaklrEdit, untNaklptEdit,
  untEx, FMTBcd,
  DBClient, Provider, SqlExpr,
  Buttons, Menus
  ;

type
  TfrmNaklr2 = class(TForm)
    Button1: TButton;
    ActionList1: TActionList;
    actSettings: TAction;
    actGrid1ListShow: TAction;
    actPostIf: TAction;
    actRefresh: TAction;
    actGrid2ListShow: TAction;
    Panel1: TPanel;
    rdgCable: TRadioGroup;
    actPostIf2: TAction;
    RadioGroup2: TRadioGroup;
    rdbCol1: TRadioButton;
    rdbCol3: TRadioButton;
    rdbCol2: TRadioButton;
    rdbCol4: TRadioButton;
    Button3: TButton;
    actRecalc: TAction;
    rdbCol0: TRadioButton;
    actAutoRecalc: TAction;
    actPreview: TAction;
    actPrint: TAction;
    actSchet: TAction;
    actCalculateSum: TAction;
    dbgNaklp: TDBGridEh;
    dbgNaklpt: TDBGridEh;
    sdsNaklr: TSQLDataSet;
    dsNaklr: TDataSource;
    dsNaklrSrc: TDataSource;
    dspNaklr: TDataSetProvider;
    cdsNaklr: TClientDataSet;
    sdsNaklrt: TSQLDataSet;
    dspNaklrt: TDataSetProvider;
    cdsNaklrt: TClientDataSet;
    dsNaklrt: TDataSource;
    Panel2: TPanel;
    btnInsert: TBitBtn;
    btnUpdate: TBitBtn;
    btnDelete: TBitBtn;
    btnPost: TBitBtn;
    sdsPost: TSQLDataSet;
    sdsUnpost: TSQLDataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    btnUnpost: TBitBtn;
    sdsNaklrNAKL: TIntegerField;
    sdsNaklrDAT: TSQLTimeStampField;
    sdsNaklrIZG: TStringField;
    sdsNaklrLICO: TStringField;
    sdsNaklrKURS: TFloatField;
    sdsNaklrKODIZG: TIntegerField;
    sdsNaklrID: TStringField;
    sdsNaklrSCH: TIntegerField;
    sdsNaklrAUTHER: TStringField;
    sdsNaklrVSEGO: TFMTBCDField;
    sdsNaklrNDS: TFMTBCDField;
    sdsNaklrDOV: TStringField;
    sdsNaklrDDO: TSQLTimeStampField;
    sdsNaklrFIX: TStringField;
    sdsNaklrFR: TStringField;
    sdsNaklrZAK: TStringField;
    sdsNaklrOPLACHENO: TFMTBCDField;
    sdsNaklrMODIFIED: TSQLTimeStampField;
    sdsNaklrMODIFIED_BY: TStringField;
    sdsNaklrSTATE: TSmallintField;
    sdsNaklrID_IZG: TIntegerField;
    sdsNaklrID_ZAK: TIntegerField;
    sdsNaklrID_MANAGER: TIntegerField;
    sdsNaklrID_CURRENCY: TSmallintField;
    sdsNaklrNALOG_NDS: TFMTBCDField;
    sdsNaklrKURS_FACT: TFloatField;
    sdsNaklrOTKAT_OPL: TStringField;
    sdsNaklrID_SKLAD: TIntegerField;
    sdsNaklrMODIFIED_IDUSER: TSmallintField;
    sdsNaklrPOSTED: TSmallintField;
    cdsNaklrNAKL: TIntegerField;
    cdsNaklrDAT: TSQLTimeStampField;
    cdsNaklrIZG: TStringField;
    cdsNaklrLICO: TStringField;
    cdsNaklrKURS: TFloatField;
    cdsNaklrKODIZG: TIntegerField;
    cdsNaklrID: TStringField;
    cdsNaklrSCH: TIntegerField;
    cdsNaklrAUTHER: TStringField;
    cdsNaklrVSEGO: TFMTBCDField;
    cdsNaklrNDS: TFMTBCDField;
    cdsNaklrDOV: TStringField;
    cdsNaklrDDO: TSQLTimeStampField;
    cdsNaklrFIX: TStringField;
    cdsNaklrFR: TStringField;
    cdsNaklrZAK: TStringField;
    cdsNaklrOPLACHENO: TFMTBCDField;
    cdsNaklrMODIFIED: TSQLTimeStampField;
    cdsNaklrMODIFIED_BY: TStringField;
    cdsNaklrSTATE: TSmallintField;
    cdsNaklrID_IZG: TIntegerField;
    cdsNaklrID_ZAK: TIntegerField;
    cdsNaklrID_MANAGER: TIntegerField;
    cdsNaklrID_CURRENCY: TSmallintField;
    cdsNaklrNALOG_NDS: TFMTBCDField;
    cdsNaklrKURS_FACT: TFloatField;
    cdsNaklrOTKAT_OPL: TStringField;
    cdsNaklrID_SKLAD: TIntegerField;
    cdsNaklrMODIFIED_IDUSER: TSmallintField;
    cdsNaklrPOSTED: TSmallintField;
    cdsNaklrIZG2: TStringField;
    cdsNaklrZAK2: TStringField;
    cdsNaklrMANAGER2: TStringField;
    sdsNaklrtEDIZ: TStringField;
    sdsNaklrtKOLOTP: TFloatField;
    sdsNaklrtNPP: TSmallintField;
    sdsNaklrtNAKL: TIntegerField;
    sdsNaklrtTARA: TSmallintField;
    sdsNaklrtKOD: TIntegerField;
    sdsNaklrtKODCN: TSmallintField;
    sdsNaklrtCENA: TFMTBCDField;
    sdsNaklrtNDS: TFMTBCDField;
    sdsNaklrtVSEGO: TFMTBCDField;
    sdsNaklrtSUMA2: TFMTBCDField;
    sdsNaklrtSKIDKA: TFMTBCDField;
    sdsNaklrtTOVAR: TStringField;
    sdsNaklrtPREMIYA: TFMTBCDField;
    sdsNaklrtCENA_FACT: TFMTBCDField;
    sdsNaklrtSKIDKA_FACT: TFloatField;
    sdsNaklrtSCH: TIntegerField;
    sdsNaklrtMODIFIED: TSQLTimeStampField;
    sdsNaklrtMODIFIED_BY: TStringField;
    sdsNaklrtSTATE: TSmallintField;
    sdsNaklrtTIP: TSmallintField;
    sdsNaklrtID_SEBEST: TIntegerField;
    cdsNaklrtEDIZ: TStringField;
    cdsNaklrtKOLOTP: TFloatField;
    cdsNaklrtNPP: TSmallintField;
    cdsNaklrtNAKL: TIntegerField;
    cdsNaklrtTARA: TSmallintField;
    cdsNaklrtKOD: TIntegerField;
    cdsNaklrtKODCN: TSmallintField;
    cdsNaklrtCENA: TFMTBCDField;
    cdsNaklrtNDS: TFMTBCDField;
    cdsNaklrtVSEGO: TFMTBCDField;
    cdsNaklrtSUMA2: TFMTBCDField;
    cdsNaklrtSKIDKA: TFMTBCDField;
    cdsNaklrtTOVAR: TStringField;
    cdsNaklrtPREMIYA: TFMTBCDField;
    cdsNaklrtCENA_FACT: TFMTBCDField;
    cdsNaklrtSKIDKA_FACT: TFloatField;
    cdsNaklrtSCH: TIntegerField;
    cdsNaklrtMODIFIED: TSQLTimeStampField;
    cdsNaklrtMODIFIED_BY: TStringField;
    cdsNaklrtTIP: TSmallintField;
    cdsNaklrtID_SEBEST: TIntegerField;
    qeNaklr: TQueryExtender;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSettingsExecute(Sender: TObject);
    procedure actGrid1ListShowExecute(Sender: TObject);
    procedure dbgNaklrDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actGrid2ListShowExecute(Sender: TObject);
    procedure dbgNaklptKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNaklptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qurNaklptBeforePost(DataSet: TDataSet);
    procedure actSchetExecute(Sender: TObject);
    procedure actRecalcExecute(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure actCalculateSumExecute(Sender: TObject);
    procedure dbgNaklpKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsNaklrAfterInsert(DataSet: TDataSet);
    procedure cdsNaklrAfterEdit(DataSet: TDataSet);
    procedure cdsNaklrtAfterInsert(DataSet: TDataSet);
    procedure cdsNaklrtAfterEdit(DataSet: TDataSet);
    procedure cdsNaklrtBeforeInsert(DataSet: TDataSet);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnUnpostClick(Sender: TObject);

  private
    intNpp : integer; //номер позиции по порядку
    frmNaklrEdit : TfrmNaklrEdit;
    frmNaklptEdit : TfrmNaklptEdit;
    procedure qurNaklrCommit;
    procedure MakeNakl (intSchet : integer);
    procedure Order;

  public
    { Public declarations }
    setT : TfrmSettings;
  end;
var
  frmNaklr2: TfrmNaklr2;
  
implementation

uses untDM;

{$R *.dfm}


procedure TfrmNaklr2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmNaklr2.actSettingsExecute(Sender: TObject);
begin
//  setT.actAllManagerOn.Execute;
  if setT.ChangeSettings = mrOk then begin
    actSettings.Checked :=true;
  {
    self.Caption :='Приходные накладные: '
      +setT.Manager + ' c ' + datetostr (setT.DateFrom)
      + ' по '+ datetostr(setT.DateTo);
}

   {
    if (setT.Manager<>'Все') then begin
      qeNakl.SetSQL('where',
        'p.name='+ QuotedStr(setT.Manager),0);
    end
    else begin
      qeNaklp.SetSQL('where',
        '',0);
    end;
    }
    {
    qeNaklp.SetSQL('where',
      'dat>='+ QuotedStr(datetostr(setT.DateFrom)),1);
    qeNaklp.SetSQL('where',
      'dat<='+ QuotedStr(datetostr(setT.DateTo))  ,2);
    qeNaklp.Refresh;

    qurNaklp.Last;
    }
    //qeNaklrt.Refresh;
  end
  else begin
    actSettings.Checked := false;
  end; //if change settings
end;

procedure TfrmNaklr2.actGrid1ListShowExecute(Sender: TObject);
begin
  if (frmNaklrEdit.Visible = false) then begin
    frmNaklrEdit.ShowModal;
  end;
end;

procedure TfrmNaklr2.dbgNaklrDblClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklr2.FormCreate(Sender: TObject);
begin
//  qeNaklr := TQueryExtender.Create(self);
//  qeNaklr.parent := self;
//  qeNaklr.Query := cdsNaklr;
  setT := TfrmSettings.Create(self);
//  dmdM.qurNds.Open;
  cdsNaklr.Open;
//  cdsNaklpt.Open;
//  sdsNaklpt.Open;
//  cdsNaklpt.Open;


  frmNaklrEdit := TfrmNaklrEdit.Create(self);
  frmNaklrEdit.dsNaklpEdit.DataSet := cdsNaklr;
  frmNaklrEdit.Top := 40;
  frmNaklrEdit.Left := 20;

  frmNaklptEdit := TfrmNaklptEdit.Create(self);
  frmNaklptEdit.Top := 100;
  frmNaklptEdit.Left := 40;
  
end;

procedure TfrmNaklr2.qurNaklrCommit;
begin
  cdsNaklr.ApplyUpdates(0);
end;

procedure TfrmNaklr2.actRefreshExecute(Sender: TObject);
begin
  qurNaklrCommit;
  cdsNaklr.Refresh;
end;

procedure TfrmNaklr2.FormDestroy(Sender: TObject);
begin
//  setT.Free;
  frmNaklrEdit.Free;
  frmNaklptEdit.Free;
end;

procedure TfrmNaklr2.actGrid2ListShowExecute(Sender: TObject);
begin
  frmNaklptEdit.ShowModal;
end;



procedure TfrmNaklr2.dbgNaklptKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return : begin
      if (cdsNaklrt.FieldByName('ID_NAKLD').AsInteger = 0) then
      begin
        cdsNaklrt.Insert;
      end
      else begin
        actGrid2ListShow.Execute;
//        cdsNaklpt.Edit;
      end;
    end; //vk_return
    vk_f8 : begin
      if (MessageDlg('Вы хотите удалить позицию?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        cdsNaklrt.Delete;
      end;
    end;
  end; //case
end;

procedure TfrmNaklr2.dbgNaklptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//  curPrice : currency;
begin
{
  case key of
    vk_return: begin
      if (dbgNaklpt.SelectedField.FieldName='SKIDKA') then begin
       qurNaklpt.Post;
        qurNaklpt.ApplyUpdates;
        qurNaklpt.CommitUpdates;
        qurNaklpt.Edit;
///////////////////////////////////////////////////////////////
        curPrice := GetSkidkaPrice(qurTovar,qurNaklrt );
        qurNaklrt.FieldByName('cena').AsFloat := curPrice;
        AutoRecalc(curPrice);

/////////////////////////////////////////////////////////////////
      end; //skidka

      if (dbgNaklrt.SelectedField.FieldName='CENA') then begin
        qurNaklrt.Post;
        qurNaklrt.ApplyUpdates;
        qurNaklrt.CommitUpdates;

        qurNaklrt.Edit;
        qurNaklrt.FieldByName('skidka').AsString:='';
        AutoRecalc(qurNaklrt.FieldByName('cena').AsFloat);
      end; //cena


      if (dbgNaklrt.SelectedField.FieldName='NDS') then begin
        qurNaklrt.Post;
        qurNaklrt.ApplyUpdates;
        qurNaklrt.CommitUpdates;

        qurNaklrt.Edit;
        qurNaklrt.FieldByName('skidka').AsString:='';
        curPrice := rroundto(
          qurNaklrt.FieldByName('nds').AsFloat /
          (1+qurNaklr.FieldByName('nalog_nds').AsFloat),-2);
        qurNaklrt.FieldByName('cena').AsFloat := curPrice;
        AutoRecalc ( curPrice);
      end; //nds

      if (dbgNaklrt.SelectedField.FieldName='KOLOTP') then begin
        qurNaklrt.Post;
        qurNaklrt.ApplyUpdates;
        qurNaklrt.CommitUpdates;
        qurNaklrt.Edit;
        AutoRecalc (qurNaklrt.FieldByName('cena').AsCurrency);
      end;//kolotp

      if (dbgNaklrt.SelectedField.FieldName='VSEGO') then begin
        qurNaklrt.Post;


        qurNaklrt.ApplyUpdates;
        qurNaklrt.CommitUpdates;
        qurNaklrt.Edit;
        qurNaklrt.FieldByName('skidka').AsString:='';
        curPrice :=
          rroundto (qurNaklrt.FieldByName('vsego').AsFloat /
          (1+qurNaklr.FieldByName('nalog_nds').AsFloat),-2);
        qurNaklrt.FieldByName('suma2').AsFloat := curPrice;

        if (qurNaklrt.FieldByName('kolotp').AsFloat<>0) then begin
          curPrice :=
            rroundto (curPrice /
            qurNaklrt.FieldByName('kolotp').AsFloat,-2);
          qurNaklrt.FieldByName('cena').AsFloat := curPrice;
          AutoRecalc (curPrice);
        end
        else begin
          qurNaklrt.FieldByName('cena').AsString := '';
          qurNaklrt.FieldByName('nds').AsString := '';
          qurNaklrt.FieldByName('skidka').AsString := '';
          qurNaklrt.Post;
        end;;//check 0 for kolotp

      end; //nds

      if (dbgNaklrt.SelectedField.FieldName='SUMA2') then begin
        qurNaklrt.Post;

        qurNaklrt.ApplyUpdates;
        qurNaklrt.CommitUpdates;
       qurNaklrt.Edit;
       qurNaklrt.FieldByName('skidka').AsString:='';
        curPrice :=
          rroundto(qurNaklrt.FieldByName('SUMA2').AsFloat *
          (1+qurNaklr.FieldByName('nalog_nds').AsFloat),-2);
        qurNaklrt.FieldByName('VSEGO').AsFloat := curPrice;

        if (qurNaklrt.FieldByName('kolotp').AsFloat<>0) then begin
          curPrice :=
            rroundto (qurNaklrt.FieldByName('suma2').AsFloat /
            qurNaklrt.FieldByName('kolotp').AsFloat,-2);
          qurNaklrt.FieldByName('cena').AsFloat := curPrice;
          AutoRecalc (curPrice);
        end
        else begin
          qurNaklrt.FieldByName('cena').AsString := '';
          qurNaklrt.FieldByName('nds').AsString := '';
          qurNaklrt.Post;
        end;;//check 0 for kolotp

      end; //vsego
    end; //vk_return
  end;//case
  }
end;

//////////////////////////////////////////////
//  Процедура упорядочивания
///
procedure TfrmNaklr2.Order;
begin
// Order2( qeNaklpt);
end;

procedure TfrmNaklr2.qurNaklptBeforePost(DataSet: TDataSet);
begin
{
  qurNaklrt.FieldByName('suma2').AsFloat :=
    rroundto( qurNaklrt.FieldByName('suma2').AsFloat,-2);
  qurNaklrt.FieldByName('cena').AsFloat :=
    rroundto( qurNaklrt.FieldByName('cena').AsFloat,-2);
  qurNaklrt.FieldByName('vsego').AsFloat :=
    rroundto( qurNaklrt.FieldByName('vsego').AsFloat,-2);
  qurNaklrt.FieldByName('nds').AsFloat :=
    rroundto( qurNaklrt.FieldByName('nds').AsFloat,-2);
    }
end;


procedure TfrmNaklr2.actSchetExecute(Sender: TObject);
var
  frmSchetList : TfrmSchetList;
  intTemp : integer;
begin
  frmSchetList := TfrmSchetList.Create(self);
  intTemp := frmSchetList.GetSchet;
  frmSchetList.Free;
  if (intTemp <>0) then begin
    MakeNakl(intTemp);
  end; //if
end;

///////////////////////////////////////////////////
///  create nakl from schet. intSchet = schet.schet
///
procedure TfrmNaklr2.MakeNakl(intSchet: integer);
begin
//
end;

procedure TfrmNaklr2.actRecalcExecute(Sender: TObject);
begin
  Order;
  actCalculateSum.Execute;
end;

procedure TfrmNaklr2.FormDeactivate(Sender: TObject);
begin
  qurNaklrCommit;
end;


procedure TfrmNaklr2.actCalculateSumExecute(Sender: TObject);
begin
//  CalculateSum(qurNaklp,qurNaklpt );
end;

procedure TfrmNaklr2.dbgNaklpKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_return :begin
      if (cdsNaklr.FieldByName('ID_NAKL').AsInteger = 0) then
      begin
        cdsNaklr.Insert;
      end
      else begin
        actGrid1ListShow.Execute;
        //cdsNaklp.Edit;
      end;
    end; //vk_return
    vk_f8: begin
      if (MessageDlg('Вы хотите удалить накладную?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        cdsNaklr.Delete;
        qurNaklrCommit;
      end;
    end;
  end;//case

end;

procedure TfrmNaklr2.cdsNaklrAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  intGen := dmdM.GetGenValue('naklr_gen');
  cdsNaklr.FieldByName('nakl').AsInteger:= intGen;  //assign
  cdsNaklr.FieldByName('dat').AsDateTime := Date; //default date. time=0
{
  if (AnsiUpperCase(setT.Manager)<>'ВСЕ') then begin //default manager
    qurNaklp.FieldByName('manager').asString := setT.Manager //get manager from settings
  end; //manager
  }
  cdsNaklr.FieldByName('nalog_nds').AsFloat := dmDM.GetNds ( Date );
  cdsNaklr.FieldByName('kurs').asFloat := 1.0000;
  cdsNaklr.FieldByName('vsego').asFloat := 0;
  cdsNaklr.FieldByName('flags').asInteger := 0;
  cdsNaklr.FieldByName('id_sklad').asInteger := 0;
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklr2.cdsNaklrAfterEdit(DataSet: TDataSet);
begin
//  actGrid1ListShow.Execute;
end;



procedure TfrmNaklr2.cdsNaklrtAfterInsert(DataSet: TDataSet);
var
  intGen : integer;
begin
  intGen := dmdEx.GetGenValue('naklpt_gen');
  cdsNaklrt.FieldByName('id_nakld').AsInteger := intGen;
  cdsNaklrt.FieldByName('id_nakl').AsInteger :=
    cdsNaklr.FieldByName('id_nakl').AsInteger;
  cdsNaklrt.FieldByName('id_pos').asInteger := intNpp;
  cdsNaklrt.FieldByName('cena').asFloat := 0;
  cdsNaklrt.FieldByName('kolotp').asFloat := 0;

  actGrid2ListShow.Execute;
end;

procedure TfrmNaklr2.cdsNaklrtAfterEdit(DataSet: TDataSet);
begin
  //actGrid2ListShow.Execute;
end;

procedure TfrmNaklr2.cdsNaklrtBeforeInsert(DataSet: TDataSet);
begin
  //ищем номер последней позиции
  cdsNaklrt.Last;
  try
    intNpp:=cdsNaklrt.fieldbyname('id_pos').asInteger;
  except
    intNpp:=0;
  end;
  inc(intNpp);
end;

procedure TfrmNaklr2.btnInsertClick(Sender: TObject);
begin
  cdsNaklr.Insert;
end;

procedure TfrmNaklr2.btnUpdateClick(Sender: TObject);
begin
  actGrid1ListShow.Execute;
end;

procedure TfrmNaklr2.btnDeleteClick(Sender: TObject);
begin
  if (MessageDlg('Вы хотите удалить накладную?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    cdsNaklr.Delete;
    qurNaklrCommit;
  end;
end;

procedure TfrmNaklr2.btnPostClick(Sender: TObject);
begin
  if (MessageDlg('Вы хотите провести приходную накладную?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    sdsPost.Params[0].AsInteger :=
      cdsNaklr.fieldbyname('id_nakl').AsInteger;
    sdsPost.ExecSQL(false);

    cdsNaklr.edit;
    cdsNaklr.FieldByName('posted').AsInteger := 1;
    cdsNaklr.Post;
    cdsNaklr.ApplyUpdates(0);
    //cdsNaklp.RefreshRecord;
  end;
end;

procedure TfrmNaklr2.btnUnpostClick(Sender: TObject);
begin
  if (MessageDlg('Вы хотите вернуть приходную накладную?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
    sdsUNPost.Params[0].AsInteger :=
      cdsNaklr.fieldbyname('id_nakl').AsInteger;
    sdsUNPost.ExecSQL(false);

    cdsNaklr.edit;
    cdsNaklr.FieldByName('posted').AsInteger := 0;
    cdsNaklr.Post;
    cdsNaklr.ApplyUpdates(0);
  end;
end;

end.

