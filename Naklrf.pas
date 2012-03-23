unit Naklrf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  FMTBcd, SqlExpr, Provider, DB, DBClient,
  Naklru, //TfrmNaklru
  SkladAux //UpdateCaptionVladClientManager

  ;

type
  TfrmNaklrf = class(TfrmNaklru)
    dspNaklf: TDataSetProvider;
    sdsNaklf: TSQLDataSet;
    sdsNaklfID: TStringField;
    sdsNaklfNALOG_NDS: TFMTBCDField;
    sdsNaklfDAT: TSQLTimeStampField;
    sdsNaklfPOSTED: TSmallintField;
    sdsNaklfID_CURRENCY: TSmallintField;
    sdsNaklfID_IZG: TIntegerField;
    sdsNaklfID_ZAK: TIntegerField;
    sdsNaklfID_MANAGER: TIntegerField;
    sdsNaklfKURS: TFloatField;
    sdsNaklfNDS: TFMTBCDField;
    sdsNaklfDELMARKED: TSmallintField;
    sdsNaklfBLOCKED: TSmallintField;
    sdsNaklfID_NAKL: TIntegerField;
    sdsNaklfID_STATYA: TIntegerField;
    sdsNaklfID_PROJECT: TIntegerField;
    sdsNaklfID_XOZ_OPER: TIntegerField;
    sdsNaklfPARENT_ID_NAKL: TIntegerField;
    sdsNaklfPARENT_ID: TStringField;
    sdsNaklfCOMMENT: TStringField;
    sdsNaklfID_DOGOVOR: TIntegerField;
    sdsNaklrfPost: TSQLDataSet;
    sdsNaklrfUnpost: TSQLDataSet;
    procedure FormCreate(Sender: TObject);
    procedure dspNaklfGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure actPostExecute(Sender: TObject);override;
    procedure actUnpostExecute(Sender: TObject);override;
    procedure dspNaklfBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    //procedure actCreateNaklruExecute(Sender: TObject); override;
  private
    { Private declarations }
    procedure SetDatasets;                            
  protected
    function CreateNewInputForm: TfrmNaklru; override;
    procedure UpdateCaption; override;
  public
    { Public declarations }
  end;

var
  frmNaklrf: TfrmNaklrf;

implementation

uses untEx;

{$R *.dfm}

{ TfrmNaklrf }

procedure TfrmNaklrf.SetDatasets;
begin
  cdsNaklo.ProviderName := 'dspNaklf';
  qeNaklo.DefSql := sdsNaklf.CommandText;
end;

procedure TfrmNaklrf.FormCreate(Sender: TObject);
begin
  inherited;
  SetDatasets;
  actCreateNaklru.Caption := 'Создать расходную на услуги';
end;

procedure TfrmNaklrf.dspNaklfGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='NAKLRF_VW';
end;

procedure TfrmNaklrf.actPostExecute(Sender: TObject);
begin
  actCalculateSum.Execute;
  dmdEx.PostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsNaklrfPost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actPost.Checked);
end;

procedure TfrmNaklrf.actUnpostExecute(Sender: TObject);
begin
  dmdEx.UnPostNakl(
    TIntegerField(cdsNaklo.FieldByName('posted')),
    sdsNaklrfUnpost,
    TIntegerField(cdsNaklo.FieldByName('id_nakl')),
    not actUnpost.Checked);
end;

procedure TfrmNaklrf.UpdateCaption;
begin
  self.Caption := UpdateCaptionVladClientManager('Расходные на услуги:',setT);
end;

procedure TfrmNaklrf.dspNaklfBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  IdNakl : integer;
begin
  { DONE : Delmark }
  if (UpdateKind = ukDelete) and (SourceDS = sdsNaklf) then
  begin
    Applied:=false;
    sdsDelmark.ParamByName('oid').AsInteger:=
      DeltaDS.fieldByName('id_nakl').asInteger;
		dmdEx.ExecSQL(sdsDelmark,false);
    Applied:=true;
  end;

  if (UpdateKind = ukInsert) and (SourceDS = sdsNaklf) and
     (DeltaDS.FieldByName('id_nakl').NewValue < 0) then
  begin
    IdNakl := dmdEx.GetGenValue('naklo_gen');
    DeltaDS.FieldByName('id_nakl').NewValue := IdNakl;
  end;
end;

function TfrmNaklrf.CreateNewInputForm: TfrmNaklru;
begin
  Result := TfrmNaklrf.Create(self);
end;

 {
procedure TfrmNaklrf.actCreateNaklruExecute(Sender: TObject);
begin
  dmdEx.ColumnSelectAndProcess(dbgNaklr,null,ProcessCreateNaklru,self);
  actRefresh.Execute;
end;
}



end.
