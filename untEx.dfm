�
 TDMDEX 0�  TPF0TdmdExdmdExOldCreateOrderOnCreateDataModuleCreate	OnDestroyDataModuleDestroyLeftzTop� Height�Width� TSQLConnectionscUchetConnectionNameuchet
DriverName	InterbaseGetDriverFuncgetSQLDriverINTERBASELibraryNamedbexpint.dllLoginPromptParams.StringsDriverName=InterbaseBlobSize=-1CommitRetain=FalseDatabase=localhost:uchetErrorResourceFile=LocaleCode=0000Password=masterkey	RoleName=ServerCharSet=win1251SQLDialect=3%Interbase TransIsolation=ReadCommitedUser_Name=sysdbaWaitOnLocks=True 	VendorLibfbclient.dllLeftTop	  TSQLDataSetsdsVladCommandTextcselect
  o.name, o.id, o.isdefault
from 
  vlad_vw o
where
  o.delmarked=0
order by
  name
MaxBlobSize�Params SQLConnectionscUchetLeftTopE  TSQLDataSetsdsPostCommandText�select 
  k.name,k.id, k.id_price
from
  klient_all_vw k
where
  bitand(k.tip,4)<>0 and k.delmarked=0
order by
  k.name
MaxBlobSize�Params SQLConnectionscUchetLeftHTopE  TSQLDataSet
sdsManagerCommandTextQselect 
  id, name, signature, id_dolgnost
from
  manager_vw
order by
  nameMaxBlobSize�Params SQLConnectionscUchetLeft� TopE  TDataSetProviderdspVladDataSetsdsVladLeftTopu  TClientDataSetcdsVlad
Aggregates Params ProviderNamedspVladLeftTop�  TStringFieldcdsVladNAME	FieldNameNAMESize2  TIntegerField	cdsVladID	FieldNameID  TSmallintFieldcdsVladISDEFAULT	FieldName	ISDEFAULT   TDataSetProviderdspPostDataSetsdsPostLeftHTopu  TClientDataSetcdsPost
Aggregates Params ProviderNamedspPostLeftHTop�  TStringFieldcdsPostNAME	FieldNameNAMESize2  TIntegerField	cdsPostID	FieldNameID  TIntegerFieldcdsPostID_PRICE	FieldNameID_PRICE   TDataSetProvider
dspManagerDataSet
sdsManagerLeft� Topu  TClientDataSet
cdsManager
Aggregates Params ProviderName
dspManagerLeft� Top�  TStringFieldcdsManagerNAME	FieldNameNAMESize  TIntegerFieldcdsManagerID	FieldNameID  TStringFieldcdsManagerSIGNATURE	FieldName	SIGNATURESize�   TIntegerFieldcdsManagerID_DOLGNOST	FieldNameID_DOLGNOST  TStringFieldcdsManagerDOLGNOST	FieldKindfkLookup	FieldNameDOLGNOSTLookupDataSetcdsDolgnostLookupKeyFieldsIDLookupResultFieldNAME	KeyFieldsID_DOLGNOSTSize2Lookup	   TSQLDataSetsdsTovarCommandText~select
  t.id, 
  t.name,
  t.id_ediz
from
  tovar_all_vw t
where
  t.delmarked=0 and 
  t.tara=2
order by 
  t.nameMaxBlobSize�Params SQLConnectionscUchetLeft� TopE  TDataSetProviderdspTovarDataSetsdsTovarLeft� Topu  TClientDataSetcdsTovar
Aggregates Params ProviderNamedspTovarLeft� Top�  TIntegerField
cdsTovarID	FieldNameIDRequired	  TStringFieldcdsTovarNAME	FieldNameNAMESized  TIntegerFieldcdsTovarID_EDIZ	FieldNameID_EDIZ  TStringFieldcdsTovarEDIZ	FieldKindfkLookup	FieldNameEDIZLookupDataSetcdsEdizLookupKeyFieldsOIDLookupResultFieldNAME	KeyFieldsIDLookup	   TSQLDataSetsdsGenMaxBlobSize�Params SQLConnectionscUchetLeft0Top  TSQLDataSetsdsTaraCommandTextoselect
  t.id,
  t.name
from 
  tovar_all_vw t
where
  t.delmarked=0 and
  t.tara=1
order by 
  t.nameMaxBlobSize�Params SQLConnectionscUchetLeft TopE  TDataSetProviderdspTaraDataSetsdsTaraLeft Topu  TClientDataSetcdsTara
Aggregates Params ProviderNamedspTaraLeft Top�   TSQLDataSet	sdsClientCommandTextrselect 
  k.name,k.id
from
  klient_all_vw k
where
  bitand(k.tip,2)<>0 and k.delmarked=0
order by
  k.nameMaxBlobSize�Params SQLConnectionscUchetLeftXTopE  TDataSetProvider	dspClientDataSet	sdsClientLeftXTopu  TClientDataSet	cdsClient
Aggregates Params ProviderName	dspClientLeftXTop�   TSQLDataSetsdsNdsCommandText�select
  cast(p.p_value as double precision) as p_value,p.p_type
from
  PARAMS p
where
  p.p_name='nds'
order by
  p.p_typeMaxBlobSize�Params SQLConnectionscUchetLeft�TopE  TClientDataSetcdsNds
Aggregates Params ProviderNamedspNdsLeft�Top�   TDataSetProviderdspNdsDataSetsdsNdsLeft�Topu  TDataSourcedsTovarDataSetcdsTovarLeft� Top�   TDataSourcedsTaraDataSetcdsTaraLeft Top�   TSQLDataSetsdsTempCommandText�select k.name, k.rsch,
k.codb, k.nameb, k.okpo,
k.adrp, k.indexi,k.tel,k.fax,
k.ipn, k.svreg, k.vyb, k.fio
from klient k where k.id=338MaxBlobSize�Params SQLConnectionscUchetLeft�TopE  TDataSetProviderdspTempDataSetsdsTempOptionspoAllowCommandText 
UpdateModeupWhereKeyOnlyLeft�Topu  TClientDataSetcdsTemp
Aggregates Params ProviderNamedspTempLeft�Top�   TDataSourcedsTempDataSetcdsTempLeft�Top�   TSQLDataSetsdsSelManagerCommandText>  select p.id,p.name,p.visible_area,
(
select child_list
from trees_str_from_children_pc(p.id,
(
select oid
    from GET_OID_OBJECTS_PC('ТИП МЕНЕДЖЕРЫ',-100)
)
)) as child_list
from get_manager_list_pc(null) l 
  inner join manager_vw p
  on l.id_manager=p.id
where p.delmarked=0
order by p.nameMaxBlobSize�Params SQLConnectionscUchetLeft�TopI  TDataSetProviderdspSelManagerDataSetsdsSelManagerOptionspoAllowCommandText 
UpdateModeupWhereKeyOnlyLeft�Topu  TClientDataSetcdsManagerSel
Aggregates Params ProviderNamedspSelManagerLeft�Top�  TStringFieldcdsManagerSelNAME	FieldNameNAMESize  TIntegerFieldcdsManagerSelID	FieldNameID  TStringFieldcdsManagerSelCHILD_LIST	FieldName
CHILD_LISTSize }  TIntegerFieldcdsManagerSelVISIBLE_AREA	FieldNameVISIBLE_AREA   TDataSourcedsManagerSelDataSetcdsManagerSelLeft�Top�   TSQLDataSetsdsGetIDManager2222TagCommandText*select id_manager 
from get_id_manager_pcMaxBlobSize�Params SQLConnectionscUchetLeft� Top  TDataSetProviderdspAllClientDataSetsdsAllClient
UpdateModeupWhereKeyOnlyLeft0Topm  TClientDataSetcdsAllClient
Aggregates Params ProviderNamedspAllClientReadOnly	Left0Top�  TStringFieldcdsAllClientNAME	FieldNameNAMERequired	Size2  TIntegerFieldcdsAllClientID	FieldNameIDProviderFlags
pfInUpdate	pfInWherepfInKey Required	  TIntegerFieldcdsAllClientTIP	FieldNameTIPRequired	  TSmallintFieldcdsAllClientDELMARKED	FieldName	DELMARKEDRequired	  TStringFieldcdsAllClientFULLNAME	FieldNameFULLNAMESize�    TSQLDataSetsdsAllClientCommandText`select 
  k.name,k.id,k.tip,k.delmarked,k.fullname
from
  klient_all_vw k
order by
  k.nameMaxBlobSize�Params SQLConnectionscUchetLeft0Top=  TSQLDataSetsdsConstCommandTextselect *
from constMaxBlobSize�Params SQLConnectionscUchetLeft`TopE  TDataSetProviderdspConstDataSetsdsConst
UpdateModeupWhereKeyOnlyLeft`Topu  TClientDataSetcdsConst
Aggregates Params ProviderNamedspConstReadOnly	Left`Top�  TStringFieldcdsConstTABLE_NAME	FieldName
TABLE_NAMESize2  TStringFieldcdsConstTABLE_FIELD	FieldNameTABLE_FIELDSize2  TStringFieldcdsConstFIELD_VALUE	FieldNameFIELD_VALUESize2  TIntegerFieldcdsConstID_CONST	FieldNameID_CONSTProviderFlags
pfInUpdate	pfInWherepfInKey Required	  TIntegerFieldcdsConstID_FIELD	FieldNameID_FIELDRequired	   TClientDataSetcdsNakloTip
Aggregates Params ProviderNamedspNakloTipLeftPTope TStringFieldStringField3	FieldNameFIELD_VALUESize2  TIntegerFieldIntegerField2	FieldNameID_FIELDRequired	   TSQLDataSetsdsTovarAllCommandText  select
  t.id, 
  t.name,
  t.ediz as ediz_old,
  t.delmarked,
  t.tara,
  t.fullname,
  t.gruppa1,
  t.gruppa2,
  t.gruppa3,
  t.gruppa4,
  t.id_analog,
  t.copperperkm,
  t.kodved,
  t.id_ediz,
  t.import,
  t.kodusl
from
  tovar_all_vw t
order by 
  t.nameMaxBlobSize�Params SQLConnectionscUchetLeft�Top=  TDataSetProviderdspTovarAllDataSetsdsTovarAll
UpdateModeupWhereKeyOnlyLeft�Topm  TClientDataSetcdsTovarAll
Aggregates Params ProviderNamedspTovarAllLeft�Top�  TIntegerFieldcdsTovarAllID	FieldNameIDRequired	  TStringFieldcdsTovarAllNAME	FieldNameNAMESized  TStringFieldcdsTovarAllEDIZ_OLD	FieldNameEDIZ_OLDSize  TSmallintFieldcdsTovarAllDELMARKED	FieldName	DELMARKED  TSmallintFieldcdsTovarAllTARA	FieldNameTARA  TStringFieldcdsTovarAllFULLNAME	FieldNameFULLNAMESize�   TStringFieldcdsTovarAllGRUPPA1	FieldNameGRUPPA1Size2  TFloatFieldcdsTovarAllGRUPPA2	FieldNameGRUPPA2  TFloatFieldcdsTovarAllGRUPPA3	FieldNameGRUPPA3  TFloatFieldcdsTovarAllGRUPPA4	FieldNameGRUPPA4  TIntegerFieldcdsTovarAllID_ANALOG	FieldName	ID_ANALOG  TFloatFieldcdsTovarAllCOPPERPERKM	FieldNameCOPPERPERKM  TFMTBCDFieldcdsTovarAllKODVED	FieldNameKODVED	PrecisionSize   TIntegerFieldcdsTovarAllID_EDIZ	FieldNameID_EDIZ  TIntegerFieldcdsTovarAllEDIZ_KOD	FieldKindfkLookup	FieldNameEDIZ_KODLookupDataSetcdsEdizLookupKeyFieldsOIDLookupResultFieldKOD	KeyFieldsID_EDIZLookup	  TStringFieldcdsTovarAllEDIZ	FieldKindfkLookup	FieldNameEDIZLookupDataSetcdsEdizLookupKeyFieldsOIDLookupResultFieldNAME	KeyFieldsID_EDIZLookup	  TSmallintFieldcdsTovarAllIMPORT	FieldNameIMPORT  TStringFieldcdsTovarAllKODUSL	FieldNameKODUSLSize   TDataSource
dsTovarAllDataSetcdsTovarAllLeft�Top�   TClientDataSetcdsNaklodetTipTag�
Aggregates Filtered	Params ProviderNamedspNaklodetTipLeft8Tope TStringFieldStringField1	FieldNameFIELD_VALUESize2  TIntegerFieldIntegerField1	FieldNameID_FIELDRequired	   TSQLDataSet	sdsSkladsCommandText�select 
  o.oid,o.name,o.isdefault,o.fullname
from
  objects o
where
  o.classid=99 and o.delmarked=0
order by
  o.name
MaxBlobSize�Params SQLConnectionscUchetLeftTop  TDataSetProvider	dspSkladsDataSet	sdsSkladsLeftTop5  TClientDataSet	cdsSklads
Aggregates Params ProviderName	dspSkladsLeftTopi TIntegerFieldcdsSkladsOID	FieldNameOIDRequired	  TStringFieldcdsSkladsNAME	FieldNameNAMESize2  TSmallintFieldcdsSkladsISDEFAULT	FieldName	ISDEFAULT  TStringFieldcdsSkladsFULLNAME	FieldNameFULLNAMESize�    TDataSetProviderdspNakloTipDataSetsdsNakloTipLeftPTop5  TSQLDataSetsdsNakloTipCommandText�select 
  o.oid as id_field,
  o.name as field_value
from
  objects o
where
  o.classid=101 and o.delmarked=0
order by
  o.name
MaxBlobSize�Params SQLConnectionscUchetLeftPTop  TDataSourcedsSkladsDataSet	cdsSkladsLeftTop�  TDataSourcedsVladDataSetcdsVladLeftTop�   
TImageList
ImageList1Left�TopBitmap
�B  IL
     �������������BM6       6   (   @   @           @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          �                                           �                               �   �   �   �   �                                                                                                                                                               �                                                   �            �  �       �    �   �   �   �   �  �   �                                                                                                                                                   �                                                           �        �   �  �    �   �   �   �   �   �   �   �  �                                                                                                                                               �                                                           �        �   �   �   �   �   �   �   �   �   �   �   �                                                                                                                                              �                       �           �                       �        �   �   �   �                           �   �  �                                                                                                                                           �               �   �                   �   �               �        �   �   �   �   �                       �  �   �                                                                                                                                           �       �   �                                   �   �       �        �   �   �   �   �   �                                                                                                                                                                      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                                                                                                                                                                                   �       �   �                                   �   �       �                                           �   �   �   �   �                                                                                                                                       �               �   �                   �   �               �        �  �   �                        �   �   �   �   �  �                                                                                                                                       �                       �           �                       �        �   �  �                            �   �   �   �  �                                                                                                                                       �                                                           �            �   �  �                   �   �    �   �   �  �                                                                                                                                       �                                                           �                �   �   �   �   �   �   �   �   �   �   �  �                                                                                                                                           �                                                   �                    �   �   �   �   �   �   �   �   �       �                                                                                                                                                  �                                           �                                �   �   �   �   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          �   �                                                                                                                                                                                                                                                       �   ��� �   �                                   �                                                         �               �                             ��� ��� ��� ��� ��� ��� ��� ��� ��� ���                                                             �   ��� �   �   �                               �   �   �                                                     �   �       �   �                             ���         ���                     ���                                                         �   ��� �   �   �                               �   �   �   �   �                                                 �   �   �   �   �                             ��� ��� ��� ��� ��� ��� ��� ��� ��� ���                                                     �   ��� �   �   �                               �   �   �   �   �   �   �                                             �   �   �   �   �                             ���         ���                     ���                                     ��� ��� ��� ��� ��� �   �   �                               �   �   �   �   �   �   �   �   �                                         �   �   �   �   �                             ��� ��� ��� ��� ��� ��� ��� ��� ��� ���                             ��� ��� ��� ��� ��� ��� ��� ���                                 �   �   �   �   �   �   �   �   �   �   �                                     �   �   �   �   �                             ��� ��� ��� ��� ��� ��� ���     ��� ���                             ��� ��� ��� ��� ��� ��� ��� ���                             �   �           �   �   �   �   �           �   �                                 �   �   �   �   �                             ���         ��� ��� ���     ���     ���                         ��� ��� ��� ��� ��� ��� ��� ��� ��� ���                                         �   �   �   �   �                                 �   �           �   �   �   �   �           �   �             ���     ���     ���     ���     ���                 �   �       ��� ��� ��� ��� ��� ��� ��� ��� ��� ���                                         �   �   �   �   �                                     �   �   �   �   �   �   �   �   �   �   �                 ��� ���     ���     ���     ���     ��� ��� ���     �   �       ��� ��� ��  ��� ��� ��� ��� ��� ��� ���                                         �   �   �   �   �                                         �   �   �   �   �   �   �   �   �                                     ���     ���     ��� ��� ��� ��� ��� �   �       ��� ��� ��  ��� ��� ��� ��� ��� ��� ���                                         �   �   �   �   �                                             �   �   �   �   �   �   �                                             ���     ��� ��� ��� ��� ��� ��� �   �           ��� ��� ��  ��  ��� ��� ��� ���                                             �   �   �   �   �                                                 �   �   �   �   �                                                     ��� ��� ��� ��� ��� ���     �   �           ��� ��� ��� ��� ��� ��� ��� ���                                             �   �       �   �                                                     �   �   �                                                                                     �   �                   ��� ��� ��� ���                                                     �               �                                                         �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     �                                                                                                                                                                                                                                                           �                                                                           �   �   �   �   �   �   �   �   �           ��� ��� ��� ��� ��� ��� ��� ��� ���     ���                 ��� ��� ��� ��� ��� ��� ��� ��� ��� ���                                 �   �   �   �   �   �   �   �   �   �   �   �                                   �   ��� ��� ��� ��� ��� ��� ��� �                                                       ���             ��� ��� ��� ��� ��� ��� ���                                         �                                                                                   �   ���                     ��� �       ��� ��� ��� ��� ��� ���  ��  ��  �� ��� ���                     ��� ��� ��� ��� ��� ���     ��� ��� ��� ���                     �                                                                                       �   ��� ��� ��� ��� ��� ��� ��� �       ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ���     ���             ��� ��� ��� ��� ���     ��� ��� ��� ��  ��� ���                     �                             �                                 ��� ��� ��� ��� ��� �   ���                     ��� �                                                       ��� ���         ��� ��� ��� ��� ���     ��� ��� ��� ��� ��� ���                         �   �   �   �   �   �   �   �   �   �   �   �               ���                 �   ��� ��� ��� ��� ��� ��� ��� �       ��� ��� ��� ��� ��� ��� ��� ��� ��� ���     ���     ���         ��� ��� ��� ��� ���     ��� ��  ��� ��� ��� ���                             �                             �                         ��� ��� ��� ��� ��� �   ���         ��� �   �   �   �                                               ���     ���             ��� ��� ��� ��� ���     ��� ��  ��  ��� ��� ���                   �   �   �   � �     �   �   �   �   �   �   �                     ���                 �   ��� ��� ��� ��� �   ��� �                   ��� ��� ��� ��� ��� ��� ��� ���     ���     ���         ��� ��� ��� ��� ��� ���     ��� ��� ��� ���                                         �                             �                 ��� ��� ��� ��� ��� �   ��� ��� ��� ��� �   �                           ���                     ���                         ��� ��� ��� ��� ��� ��� ���                                                                                           �             ���         ���     �   �   �   �   �   �                               ��� ��� ��� ��� ��� ��� ��� ���                     ��� ��� ��� ��� ��� ��� ��� ��� ��� ���                                                                           �                 ��� ��� ��� ���     ���                                                     ���                     ���                     ��� ��� ��� ��� ��� ��� ���                                       �   �   �   �   �   �   �   �   �   �   �   �                     ��� ��� ��� ���                                                             ��� ��� ��� ��� ��� ��� ��� ���                 ��� ��� ��� ��� ��� ��� ���     ���                                                                       �                                                                                                                                                     ��� ��� ��� ��� ��� ��� ���                                                                           �                                                                                                                                                                                                                                                           �                         BM>       >   (   @   @                                ���                                                                                                                                 ���?    ���    ��    ��    }���    s΃�    O��      ��    O���    sΏ�    }���    �ǁ    ��    ���    ���?    ����    �������� ������ ����? ���?�? ���? ���? ���? ��3�?  �?�3  �?�   �?�   �?�� ��?�?� ��?���?����������������������� ��� � ��   ���   ���   ߿�    ��    �� �  ���  ���� ���� ���� ���� ���� ?������ ��                        TDataSourcedsClientDataSet	cdsClientLeftXTop�   TDataSource	dsManagerDataSet
cdsManagerLeft� Top�   TSQLDataSetsdsSklottIdtypeCommandTextmselect c.id_field,c.field_value
from const c
where
  c.table_name='SKLOSTT' and
  c.table_field='ID_TYPE'MaxBlobSize�Params SQLConnectionscUchetLeft� Top  TDataSetProviderdspSklottIdtypeDataSetsdsSklottIdtypeLeft� Top5  TClientDataSetcdsSklottIdtype
Aggregates Filtered	Params ProviderNamedspSklottIdtypeLeft� Tope TStringFieldStringField2	FieldNameFIELD_VALUESize2  TIntegerFieldIntegerField4	FieldNameID_FIELDRequired	   TSQLDataSetsdsTovarAllNDCommandText^select
  t.id,
  t.name
from
  tovar_all_vw t
where
  t.delmarked=0
order by 
  t.nameMaxBlobSize�Params SQLConnectionscUchetLeft� Top  TDataSetProviderdspTovarAllNDDataSetsdsTovarAllND
UpdateModeupWhereKeyOnlyLeft� Top5  TClientDataSetcdsTovarAllND
Aggregates Params ProviderNamedspTovarAllNDLeft� Tope  TDataSourcedsTovarAllNDDataSetcdsTovarAllNDLeft� Top�  TSQLDataSetsdsNaklodetTipCommandTextGselect *
from const
where table_name='NAKLODET' and table_field='TIP'MaxBlobSize�Params SQLConnectionscUchetLeft8Top  TDataSetProviderdspNaklodetTipDataSetsdsNaklodetTip
UpdateModeupWhereKeyOnlyLeft8Top8  TClientDataSet
cdsObjectsTag�
Aggregates Filtered		FieldDefsNameOIDDataType	ftInteger NameCLASSIDDataType	ftInteger NameNAMEDataTypeftStringSize  	IndexDefs Params 	StoreDefs	LeftXTop TStringFieldcdsObjectsNAME	FieldNameNAME  TIntegerFieldcdsObjectsCLASSID	FieldNameCLASSID  TSmallintFieldcdsObjectsoid	FieldNameOID   TSQLDataSetsdsBankCommandText7select 
   *
from 
   bank_vw b
order by b.fullnameMaxBlobSize�Params SQLConnectionscUchetLeftxTop TIntegerField	sdsBankID	FieldNameOIDRequired	  TStringFieldsdsBankBANK_NAME	FieldName	BANK_NAMESize2  TStringFieldsfBankRASCH	FieldNameRASCHSize   TFloatField
sdsBankMFO	FieldNameMFO  TIntegerFieldsdsBankID_KLIENT	FieldName	ID_KLIENTRequired	  TIntegerFieldsdsBankID_CURRENCY	FieldNameID_CURRENCY  TSmallintFieldsdsBankDELMARKED	FieldName	DELMARKED  TStringFieldsdsBankFULLNAME	FieldNameFULLNAMESize�    TDataSetProviderdspBankDataSetsdsBankOptionspoAllowCommandText LeftxTop5  TClientDataSetcdsBank
Aggregates Params ProviderNamedspBankLeftxTope TIntegerField	cdsBankID	FieldNameOIDRequired	  TStringFieldcdsBankBANK_NAME	FieldName	BANK_NAMESize2  TStringFieldcdsBankRASCH1	FieldNameRASCHSize   TFloatField
cdsBankMFO	FieldNameMFO  TIntegerFieldcdsBankID_KLIENT	FieldName	ID_KLIENTRequired	  TIntegerFieldcdsBankID_CURRENCY	FieldNameID_CURRENCY  TSmallintFieldcdsBankDELMARKED	FieldName	DELMARKED  TStringFieldcdsBankFULLNAME	FieldNameFULLNAMESize�    TDataSourcedsBankDataSetcdsBankLeftxTop�  TSQLDataSetsdsCurrencyCommandText!select *
from
  SPR_CURRENCY_VWMaxBlobSize�Params SQLConnectionscUchetLeft�Top TIntegerFieldsdsCurrencyOID	FieldNameOIDRequired	  TStringFieldsdsCurrencyNAME	FieldNameNAMESize2  TSmallintFieldsdsCurrencyDELMARKED	FieldName	DELMARKEDRequired	  TStringFieldsdsCurrencyFULLNAME	FieldNameFULLNAMESize�    TDataSetProviderdspCurrencyDataSetsdsCurrencyOptionspoAllowCommandText Left�Top5  TClientDataSetcdsCurrency
Aggregates Params ProviderNamedspCurrencyLeft�Tope TIntegerFieldcdsCurrencyOID	FieldNameOIDRequired	  TStringFieldcdsCurrencyNAME	FieldNameNAMESize2  TSmallintFieldcdsCurrencyDELMARKED	FieldName	DELMARKEDRequired	  TStringFieldcdsCurrencyFULLNAME	FieldNameFULLNAMESize�    TDataSource
dsCurrencyDataSetcdsCurrencyLeft�Top�  TClientDataSet	cdsStatya
Aggregates Filtered	Params ProviderName	dspStatyaLeft�Tope TIntegerFieldcdsStatyaOID	FieldNameOIDRequired	  TSmallintFieldcdsStatyaDELMARKED	FieldName	DELMARKEDRequired	  TStringFieldcdsStatyaNAME	FieldNameNAMESize2  TStringFieldcdsStatyaFULLNAME	FieldNameFULLNAMESize�   TIntegerFieldcdsStatyaIS_BUX	FieldNameIS_BUX  TIntegerFieldcdsStatyaIS_FACT	FieldNameIS_FACT  TIntegerFieldcdsStatyaIS_FOR_TOVAR	FieldNameIS_FOR_TOVAR  TIntegerFieldcdsStatyaIS_FOR_TARA	FieldNameIS_FOR_TARA   TDataSetProvider	dspStatyaDataSet	sdsStatya
UpdateModeupWhereKeyOnlyLeft�Top8  TSQLDataSet	sdsStatyaCommandTextyselect oid,delmarked,name,fullname,
  is_bux,is_fact,is_for_tovar,is_for_tara
from spr_statya_vw s
where s.delmarked=0MaxBlobSize�Params SQLConnectionscUchetLeft�Top  TDataSourcedsPostDataSetcdsPostLeftHTop�   TSQLDataSetsdsDolgnostCommandText>select o.id,o.name 
from SPR_DOLGNOST_VW o
where delmarked=0MaxBlobSize�Params SQLConnectionscUchetLeft0Top	  TDataSetProviderdspDolgnostDataSetsdsDolgnostLeft0Top9  TDataSource
dsDolgnostLeft0Top�  TClientDataSetcdsDolgnost
Aggregates Params ProviderNamedspDolgnostLeft0Topi TIntegerFieldIntegerField5	FieldNameIDRequired	  TStringFieldStringField6	FieldNameNAMESize2   TSQLDataSetsdsSferaCommandText�   select o.oid,o.name 
from objects o
  where classid=(select oid 
  from get_oid_objects_pc('СПРАВОЧНИК СФЕР ДЕЯТЕЛЬНОСТИ',-100)) 
and delmarked=0MaxBlobSize�Params SQLConnectionscUchetLeftdTop	  TDataSetProviderdspSferaDataSetsdsSferaLeftdTop9  TClientDataSetcdsSfera
Aggregates Params ProviderNamedspSferaLeftdTopi TIntegerFieldIntegerField6	FieldNameOIDRequired	  TStringFieldStringField7	FieldNameNAMESize2   TDataSourcedsSferaDataSetcdsSferaLeftdTop�  TSQLDataSet	sdsReasonCommandText�   select o.oid,o.name 
from objects o
  where classid=(select oid 
  from get_oid_objects_pc('СПРАВОЧНИК ПРИЧИН КОНТАКТОВ',-100)) 
and delmarked=0MaxBlobSize�Params SQLConnectionscUchetLeft�Top	  TDataSetProvider	dspReasonDataSet	sdsReasonLeft�Top9  TClientDataSet	cdsReason
Aggregates Params ProviderName	dspReasonLeft�Topi TIntegerFieldIntegerField7	FieldNameOIDRequired	  TStringFieldStringField9	FieldNameNAMESize2   TDataSourcedsReasonDataSet	cdsReasonLeft�Top�  TSQLDataSet	sdsResultCommandText�   select o.oid,o.name 
from objects o
  where classid=(select oid 
  from get_oid_objects_pc('СПРАВОЧНИК РЕЗУЛЬТАТОВ КОНТАКТОВ',-100)) 
and delmarked=0MaxBlobSize�Params SQLConnectionscUchetLeft�Top	  TDataSetProvider	dspResultDataSet	sdsResultLeft�Top9  TClientDataSet	cdsResult
Aggregates Params ProviderName	dspResultLeft�Topi TIntegerFieldIntegerField8	FieldNameOIDRequired	  TStringFieldStringField10	FieldNameNAMESize2   TDataSourcedsResultDataSet	cdsResultLeft�Top�  TSQLDataSet
sdsGetKursCommandTextsselect 
  kurs_to, kurs_from
from 
  kurs_get_pc(
    :dat,
    :id_currency,
    :id_currency_to,
   1
  )MaxBlobSize�ParamsDataType	ftUnknownNamedat	ParamTypeptInput DataType	ftUnknownNameid_currency	ParamTypeptInput DataType	ftUnknownNameid_currency_to	ParamTypeptInput  SQLConnectionscUchetLeftTop� TFloatFieldsdsGetKursKURS_TO	FieldNameKURS_TO  TFloatFieldsdsGetKursKURS_FROM	FieldName	KURS_FROM   TSQLDataSetsdsPriceCommandText?select *
from spr_price_vw
where delmarked=0
order by name
MaxBlobSize�Params SQLConnectionscUchetLeftPTop�  TDataSetProviderdspPriceDataSetsdsPriceLeftPTop�  TClientDataSetcdsPrice
Aggregates Params ProviderNamedspPriceLeftLTop  TDataSourcedsPriceDataSetcdsPriceLeftPTopE  TSQLDataSet	sdsSkidkaCommandText@select *
from spr_skidka_vw
where delmarked=0
order by name
MaxBlobSize�Params SQLConnectionscUchetLeft� Top�  TDataSetProvider	dspSkidkaDataSet	sdsSkidkaLeft� Top�  TClientDataSet	cdsSkidka
Aggregates Params ProviderName	dspSkidkaLeft� Top  TDataSourcedsSkidkaDataSet	cdsSkidkaLeft� TopI  TSQLDataSetsdsUslPostavkaCommandTextFselect *
from spr_usl_postavka_vw
where delmarked=0
order by name
MaxBlobSize�Params SQLConnectionscUchetLeft� Top�  TDataSetProviderdspUslPostavkaDataSetsdsUslPostavkaLeft� Top�  TClientDataSetcdsUslPostavka
Aggregates Params ProviderNamedspUslPostavkaLeft� Top  TDataSourcedsUslPostavkaDataSetcdsUslPostavkaLeft� TopI  TSQLDataSetsdsVidDostavkiCommandTextFselect *
from spr_vid_dostavki_vw
where delmarked=0
order by name
MaxBlobSize�Params SQLConnectionscUchetLeft8Top�  TDataSetProviderdspVidDostavkiDataSetsdsVidDostavkiLeft8Top�  TClientDataSetcdsVidDostavki
Aggregates Params ProviderNamedspVidDostavkiLeft8Top TIntegerFieldcdsVidDostavkiOID	FieldNameOIDRequired	  TStringFieldcdsVidDostavkiNAME	FieldNameNAMESize2  TStringFieldcdsVidDostavkiFULLNAME	FieldNameFULLNAMESize�   TSmallintFieldcdsVidDostavkiDELMARKED	FieldName	DELMARKEDRequired	  TSmallintFieldcdsVidDostavkiISDEFAULT	FieldName	ISDEFAULT   TDataSourcedsVidDostavkiDataSetcdsVidDostavkiLeft8TopI  TPropStorageEhpsInterParamActiveSectiondmdExStorageManagerrpsInterParamLeftLTop  TRegPropStorageManEhrpsInterParamPathSoftware\Eurosystems\UchetLeft� Top  TDataSourcedsAllClientDataSetcdsAllClientLeft0Top�   TSQLDataSetsdsAgentCommandText?select *
from spr_agent_vw
where delmarked=0
order by name
MaxBlobSize�Params SQLConnectionscUchetLeft�Top�  TDataSetProviderdspAgentDataSetsdsAgentLeft�Top�  TClientDataSetcdsAgent
Aggregates Params ProviderNamedspAgentLeft�Top TIntegerFieldIntegerField9	FieldNameOIDRequired	  TStringFieldStringField4	FieldNameNAMESize2  TStringFieldStringField8	FieldNameFULLNAMESize�   TSmallintFieldSmallintField1	FieldName	DELMARKEDRequired	  TSmallintFieldSmallintField2	FieldName	ISDEFAULT   TDataSourcedsAgentDataSetcdsAgentLeft�TopI  TSQLDataSet
sdsProjectCommandTextAselect *
from spr_project_vw
where delmarked=0
order by name
MaxBlobSize�Params SQLConnectionscUchetLeft�Top�  TDataSetProvider
dspProjectDataSet
sdsProjectLeft�Top�  TDataSource	dsProjectDataSet
cdsProjectLeft�TopI  TClientDataSet
cdsProject
Aggregates Params ProviderName
dspProjectLeft�Top TIntegerFieldcdsProjectID	FieldNameIDRequired	  TStringFieldStringField11	FieldNameNAMESize2  TStringFieldStringField12	FieldNameFULLNAMESize�   TSmallintFieldSmallintField3	FieldName	DELMARKEDRequired	  TIntegerFieldcdsProjectPOID	FieldNamePOID   TSQLDataSetsdsStatyaDRCommandTextBselect *
from spr_statyadr_vw
where delmarked=0
order by name
MaxBlobSize�Params SQLConnectionscUchetLeftTop�  TDataSetProviderdspStatyaDRDataSetsdsStatyaDRLeftTop�  TClientDataSetcdsStatyaDR
Aggregates Params ProviderNamedspStatyaDRLeftTop TIntegerFieldIntegerField10	FieldNameIDRequired	  TStringFieldStringField13	FieldNameNAMESize2  TStringFieldStringField14	FieldNameFULLNAMESize�   TSmallintFieldSmallintField4	FieldName	DELMARKEDRequired	  TIntegerFieldIntegerField11	FieldNamePOID   TDataSource
dsStatyaDRDataSetcdsStatyaDRLeftTopI  TSQLDataSetsdsUndeleteCommandTextNAKLO_UNDELETE_PCCommandTypectStoredProcMaxBlobSize�ParamsDataType	ftIntegerNameID_NAKL	ParamTypeptInput  SQLConnectionscUchetLeftTop�  TSQLDataSetsdsVygruzkaCommandText�  select 
  o.id_perevozchik,
  o.fio_voditelya,
  o.dat_reys,
  o.punkt_zagruzki,
  v.punkt_vygruzki,
  o.nomer_avto,
  o.nomer_pritsepa,
  o.delmarked,
  o.POKUPATEL_PLATIT,
  v.id_vygruzka,
  o.nomer_prav,
  o.vid_perevozok
from
  SPR_REYS_VW o inner join SPR_VYGRUZKA_VW v on
    o.id_reys=v.id_reys
where o.dat_reys between incdate(current_timestamp,0,0,-1) and incdate(current_timestamp,0,1,0) and
  o.delmarked=0 and v.delmarked=0
order by
  o.dat_reys desc,
  o.nomer_avto
MaxBlobSize�Params SQLConnectionscUchetLeftCTop� TIntegerFieldsdsVygruzkaID_PEREVOZCHIK	FieldNameID_PEREVOZCHIK  TStringFieldsdsVygruzkaFIO_VODITELYA	FieldNameFIO_VODITELYASize2  TSQLTimeStampFieldsdsVygruzkaDAT_REYS	FieldNameDAT_REYS  TStringFieldsdsVygruzkaPUNKT_ZAGRUZKI	FieldNamePUNKT_ZAGRUZKISize2  TStringFieldsdsVygruzkaPUNKT_VYGRUZKI	FieldNamePUNKT_VYGRUZKISize2  TStringFieldsdsVygruzkaNOMER_AVTO	FieldName
NOMER_AVTOSize  TStringFieldsdsVygruzkaNOMER_PRITSEPA	FieldNameNOMER_PRITSEPASize2  TSmallintFieldsdsVygruzkaDELMARKED	FieldName	DELMARKED  TSmallintFieldsdsVygruzkaPOKUPATEL_PLATIT	FieldNamePOKUPATEL_PLATIT  TIntegerFieldsdsVygruzkaID_VYGRUZKA	FieldNameID_VYGRUZKARequired	  TStringFieldsdsVygruzkaNOMER_PRAV	FieldName
NOMER_PRAVSize�   TStringFieldsdsVygruzkaVID_PEREVOZOK	FieldNameVID_PEREVOZOKSize�    TDataSource
dsVygruzkaDataSetcdsVygruzkaLeftCTopJ  TClientDataSetcdsVygruzka
Aggregates FilterOptionsfoCaseInsensitive Params ProviderNamedspVygruzkaLeftCTop TIntegerFieldcdsVygruzkaID_PEREVOZCHIK	FieldNameID_PEREVOZCHIK  TStringFieldcdsVygruzkaNOMER_AVTODisplayLabel   Номер автомобиляDisplayWidth
	FieldName
NOMER_AVTOSize  TSQLTimeStampFieldcdsVygruzkaDAT_REYSDisplayLabel   Дата рейсаDisplayWidth
	FieldNameDAT_REYS  TStringFieldcdsVygruzkaFIO_VODITELYADisplayLabel   ФИО водителяDisplayWidth	FieldNameFIO_VODITELYASize2  TStringFieldcdsVygruzkaPEREVOZCHIKDisplayLabel
   5@52>7G8:	FieldKindfkLookup	FieldNamePEREVOZCHIKLookupDataSet	cdsClientLookupKeyFieldsIDLookupResultFieldNAME	KeyFieldsID_PEREVOZCHIKSize2Lookup	  TStringFieldcdsVygruzkaPUNKT_ZAGRUZKIDisplayLabel   Пункт загрузкиDisplayWidth	FieldNamePUNKT_ZAGRUZKISize2  TStringFieldcdsVygruzkaPUNKT_VYGRUZKIDisplayLabel   Пункт выгрузкиDisplayWidth	FieldNamePUNKT_VYGRUZKISize2  TStringFieldcdsVygruzkaNOMER_PRITSEPADisplayLabel   Номер прицепаDisplayWidth	FieldNameNOMER_PRITSEPASize2  TSmallintFieldcdsVygruzkaDELMARKED	FieldName	DELMARKED  TSmallintFieldcdsVygruzkaPOKUPATEL_PLATIT	FieldNamePOKUPATEL_PLATIT  TIntegerFieldcdsVygruzkaID_VYGRUZKA	FieldNameID_VYGRUZKARequired	  TStringFieldcdsVygruzkaNOMER_PRAV	FieldName
NOMER_PRAVSize�   TStringFieldcdsVygruzkaVID_PEREVOZOK	FieldNameVID_PEREVOZOKSize�    TDataSetProviderdspVygruzkaDataSetsdsVygruzkaOptionspoAllowCommandText 
UpdateModeupWhereKeyOnlyLeftCTop�  TSQLDataSetsdsEdizCommandTextIselect
  *
from 
  ediz t
where
  t.delmarked=0
order by 
  t.nameMaxBlobSize�Params SQLConnectionscUchetLeftxTop�  TDataSetProviderdspEdizDataSetsdsEdizLeftxTop�  TClientDataSetcdsEdiz
Aggregates Params ProviderNamedspEdizLeftxTop TIntegerField
cdsEdizOID	FieldNameOIDRequired	  TStringFieldcdsEdizNAME	FieldNameNAMESize2  TIntegerField
cdsEdizKOD	FieldNameKOD  TStringFieldcdsEdizFULLNAME	FieldNameFULLNAMESized  TSmallintFieldcdsEdizDELMARKED	FieldName	DELMARKED   TDataSourcedsEdizDataSetcdsEdizLeftxTopM   