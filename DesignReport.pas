unit DesignReport;
//���� �������� �� � �����-����-�������� ����������
  //����� ���� "��������"
//{$define ShowReportDesigner}

interface

uses

  ActnList, //TActionList
  Menus, //TMainMenu
  frxClass,
  frxDesgn

  ;

procedure ProcessReportDesigner(ActionList1: TActionList;
  MainMenu1: TMainMenu; frNaklr: TfrxReport);



implementation
uses
  untRound //inIde
;

type
  TReportDesigerProxy = class
    private
      FfrxReport : TfrxReport;
    public
      constructor Create(Report :TfrxReport);
      procedure ShowReportDesigner(Sender: TObject);
  end;




{ TReportDesigerProxy }

constructor TReportDesigerProxy.Create(Report: TfrxReport);
begin
  FfrxReport := Report;
end;

procedure TReportDesigerProxy.ShowReportDesigner(Sender: TObject);
begin
  FfrxReport.DesignReport;
end;

procedure ProcessReportDesigner(ActionList1: TActionList;
  MainMenu1: TMainMenu; frNaklr: TfrxReport);
var
  actDesigner : TAction;
  DesignerMenuItem : TMenuItem;
  ReportDesigerProxy: TReportDesigerProxy;
begin
  if inIDE then begin
    ReportDesigerProxy:= TReportDesigerProxy.Create(frNaklr);
    actDesigner := TAction.Create(ActionList1);
    actDesigner.ActionList := ActionList1;
    actDesigner.Caption := '�������� '+frNaklr.Name;
    actDesigner.OnExecute := ReportDesigerProxy.ShowReportDesigner;
    DesignerMenuItem:=TMenuItem.Create(MainMenu1);
    DesignerMenuItem.Action :=  actDesigner;
    MainMenu1.Items.Find('��������').Add(DesignerMenuItem);
  end;
end;

end.
 