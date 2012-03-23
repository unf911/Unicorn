unit DBTree;

interface

uses
  Windows, Messages, SysUtils, Classes,
  DB, //TDataSource
  ComCtrls //TTreeNodes
  ;

type

  PKeyRec = ^Variant;
{  TKeyRec = record
    KeyValue : variant;
  end;
  }
  ArrKeyRec = array of variant;
  TDbTreeMode = (ParentMode,Properties);
  TParentModeOptions = class (TPersistent)
  private
    FParentField : string;
    FIdField : string;
    FLabelField : string;
    FShowLeaves : boolean;
    FRootValue : variant;
  published
    property ParentField:string read FParentField write FParentField;
    property IdField:string read FIdField write FIdField;
    property LabelField:string read FLabelField write FLabelField;
    property ShowLeaves:boolean read FShowLeaves write FShowLeaves;
    property RootValue: variant read FRootValue write FRootValue;
  public
    procedure Assign(Source: TPersistent); override;
  end;

  TDBTree = class(TComponent)
  private
    { Private declarations }
    FDataSource : TDataSource;
    FActive : boolean;
    FDbTreeMode : TDbTreeMode;
    FParentModeOptions : TParentModeOptions;
    FTreeComponent:TComponent;
    FTreeComponentNodes:TTreeNodes;
    FArrKeyRec:ArrKeyRec;
    FArrFreeCell : integer;
    procedure AddItems(RootValue: string; ParentNode : TTreeNode);
  protected
    { Protected declarations }
    procedure SetActive (const Active: boolean);
    procedure SetTreeComponentNodes(const TreeNodes:TTreeNodes);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FillItemsInParentMode;
    procedure Refresh;
    function GetKeyValue:variant;    
  published
    { Published declarations }
    property DataSource: TDataSource read FDataSource write FDataSource;
    property Active : boolean read FActive write SetActive;
    property DbTreeMode :TDbTreeMode read FDbTreeMode write FDbTreeMode;
    property ParentModeOptions:TParentModeOptions read FParentModeOptions write FParentModeOptions;
    property TreeComponent:TComponent read FTreeComponent write FTreeComponent;
    property TreeComponentNodes:TTreeNodes read FTreeComponentNodes write SetTreeComponentNodes;
    property KeyValue:Variant read GetKeyValue;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MySamples', [TDBTree]);
end;

{ TDBTree }

constructor TDBTree.Create(AOwner: TComponent);
begin
  inherited;
  FParentModeOptions := TParentModeOptions.Create;

  //
end;

destructor TDBTree.Destroy;
begin
  //
  inherited;
end;

procedure TDBTree.AddItems(RootValue: string; ParentNode : TTreeNode);
var
    oldFilter : string;
    oldFiltered : boolean;
    NewNode : TTreeNode;
    NewKey : string;
    DataPtr : pointer;
begin
    //backup
    oldFilter:=DataSource.DataSet.Filter;
    oldFiltered :=DataSource.DataSet.Filtered;
    //filter
    DataSource.DataSet.Filter:=ParentModeOptions.ParentField+
      ' = ' +  RootValue;
    DataSource.DataSet.Filtered := true;
    DataSource.DataSet.First;
    //cycle
    while not DataSource.DataSet.Eof do begin
      NewKey := DataSource.DataSet.fieldbyname(ParentModeOptions.IdField).AsString;

      FArrKeyRec[FArrFreeCell] := DataSource.DataSet.FieldByName(
        ParentModeOptions.IdField).asVariant;
      DataPtr := Addr(FArrKeyRec[FArrFreeCell]);
      inc ( FArrFreeCell);

      NewNode := TreeComponentNodes.AddChildObject(
        ParentNode,
        DataSource.DataSet.fieldbyname(ParentModeOptions.LabelField).AsString,
        DataPtr);
      AddItems(
        DataSource.DataSet.fieldbyname(ParentModeOptions.IdField).AsString,
        NewNode);
      DataSource.DataSet.Locate(ParentModeOptions.IdField,NewKey,[]);
      DataSource.DataSet.Next;
    end;
    //restore
    DataSource.DataSet.Filter:=oldFilter;
    DataSource.DataSet.Filtered :=  oldFiltered;
end;

procedure TDBTree.FillItemsInParentMode;
var
  varKey : string;
  ParentNode : TTreeNode;
  DataPtr : Pointer;
begin
  if DataSource.DataSet.Locate(ParentModeOptions.ParentField,
   ParentModeOptions.RootValue,
   [])<> true then begin
    raise Exception.Create('Не найден корень дерева. Значение ParentModeOptions.RootValue неверно');
  end;
  TreeComponentNodes.Clear;

  SetLength(FArrKeyRec,DataSource.DataSet.RecordCount);
  FArrFreeCell := 0;

  varKey := DataSource.DataSet.FieldByName(
    ParentModeOptions.IdField).asString;
  FArrKeyRec[FArrFreeCell] := DataSource.DataSet.FieldByName(
    ParentModeOptions.IdField).asVariant;
  DataPtr := Addr(FArrKeyRec[FArrFreeCell]);
  inc ( FArrFreeCell);

  ParentNode := nil;
  ParentNode := TreeComponentNodes.AddObject(
    ParentNode,
    DataSource.DataSet.fieldbyname(ParentModeOptions.LabelField).AsString,
    DataPtr);
  //add parent oid to data
  AddItems(varKey,ParentNode);
end;

function TDBTree.GetKeyValue: variant;
begin
  if TreeComponent is TTreeView then begin
    Result := PKeyRec(TTreeView(TreeComponent).Selected.Data)^;
    // as Integer
  end;
end;

procedure TDBTree.Refresh;
begin
//
  Active:=false;
  Active:=true;
end;

procedure TDBTree.SetActive(const Active: boolean);
begin
 if Active = true then begin
  if DbTreeMode = ParentMode then begin
    if Assigned (DataSource) then begin
      if Assigned (DataSource.DataSet) then begin
        DataSource.DataSet.Open;

        if DataSource.DataSet.FindField(ParentModeOptions.ParentField)=nil then begin
          raise Exception.Create('Неверное значение свойства ParentModeOptions.ParentField. '
            +'Поле с именем'+ParentModeOptions.ParentField+ 'не найдено');
        end;
        if DataSource.DataSet.FindField(ParentModeOptions.IdField)=nil then begin
          raise Exception.Create('Неверное значение свойства ParentModeOptions.IdField. '
            +'Поле с именем'+ParentModeOptions.IdField+ 'не найдено');
        end;
        if DataSource.DataSet.FindField(ParentModeOptions.LabelField)=nil then begin
          raise Exception.Create('Неверное значение свойства ParentModeOptions.LabelField. '
            +'Поле с именем'+ParentModeOptions.LabelField+ 'не найдено');
        end;
        FillItemsInParentMode;
        FActive := Active;
      end else begin
        raise Exception.Create('Не определён DataSource.DataSet');
      end; //DataSource.DataSet
    end else begin
      raise Exception.Create('Не определён DataSource');
    end; //DataSource
  end; //if parentmode
 end//if active= true
 else begin
   FActive := Active;
 end;
end;

procedure TDBTree.SetTreeComponentNodes(const TreeNodes: TTreeNodes);
begin
  if Assigned(TreeComponent) then begin
    if Assigned(TreeNodes) then begin
      if (TreeNodes.Owner=TreeComponent) then begin
        FTreeComponentNodes := TreeNodes;
      end;
    end;
  end;
end;

{ TParentModeOptions }

procedure TParentModeOptions.Assign(Source: TPersistent);
begin
  if Source is TParentModeOptions then begin
    ParentField  := TParentModeOptions(Source).ParentField;
    IdField  := TParentModeOptions(Source).IdField;
    LabelField  := TParentModeOptions(Source).LabelField;
    ShowLeaves  := TParentModeOptions(Source).ShowLeaves;
    RootValue  := TParentModeOptions(Source).RootValue;    
  end;
  inherited Assign(Source);
end;

end.
 