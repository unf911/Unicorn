program Uchet;

uses
  Forms,
  MAIN in 'MAIN.PAS' {MainForm},
  Kurs in 'Kurs.PAS' {frmKurs},
  untSettings in 'untSettings.pas' {frmSettings},
  untPrice in 'untPrice.pas' {frmPrice},
  untRealPrice in 'untRealPrice.pas' {frmRealPrice},
  untRepMan in 'untRepMan.pas' {frmRepMan},
  PlategyVxod in 'PlategyVxod.pas' {frmPlategyVxod},
  untPrixDet in 'untPrixDet.pas' {frmPrixDet},
  DolgBuxDet in 'DolgBuxDet.pas' {frmDolgBuxDet},
  untDolgDet in 'untDolgDet.pas' {frmDolgDet},
  ClientSpr in 'ClientSpr.pas' {frmClientSpr},
  EdizSprEdit in 'EdizSprEdit.pas' {frmEdizSprEdit},
  untRealPriceMake in 'untRealPriceMake.pas' {frmRealPriceMake},
  Currency in 'Currency.pas' {frmCurrency},
  TovarSprEdit in 'TovarSprEdit.pas' {frmTovarSprEdit},
  untRound in 'untRound.pas',
  NNakl in 'NNakl.pas' {frmNNakl},
  untNaklrList in 'untNaklrList.pas' {frmNaklrList},
  untNaklp in 'untNaklp.pas' {frmNaklp},
  untSkladRasxBux in 'untSkladRasxBux.pas' {frmSkladRasxBux},
  Schet in 'Schet.pas' {frmSchet},
  untSkladRasxBuxDet in 'untSkladRasxBuxDet.pas' {frmSkladRasxBuxDet},
  untNaklptEdit in 'untNaklptEdit.pas' {frmNaklpEdit},
  untEx in 'untEx.pas' {dmdEx: TDataModule},
  untSqlLog in 'untSqlLog.pas' {frmSqlLog},
  untSklost in 'untSklost.pas' {frmSklost},
  Zakaz in 'Zakaz.pas' {frmZakaz},
  untOtpravkatEdit in 'untOtpravkatEdit.pas' {frmOtpravkatEdit},
  recerror in 'recerror.pas' {ReconcileErrorForm},
  untOtrez in 'untOtrez.pas' {frmOtrez},
  ManagerSpr in 'ManagerSpr.pas' {frmManagerSpr},
  EhLibCDS in 'EhLibCDS.pas',
  ATSAssert in 'ATSAssert.pas',
  untTara in 'untTara.pas' {frmTara},
  SpecOst in 'SpecOst.pas' {frmSpecOst},
  untSkladRasxDetEx in 'untSkladRasxDetEx.pas' {frmSkladRasxDetEx},
  RepNakloWeight in 'RepNakloWeight.pas' {frmNakloWeight},
  untSpecif in 'untSpecif.pas' {frmSpecif},
  untSklostDet in 'untSklostDet.pas' {frmSklostDet},
  untNakloSelect in 'untNakloSelect.pas' {frmNakloSelect},
  SkladSpr in 'SkladSpr.pas' {frmSkladSpr},
  untNaklodetChangeBuxt in 'untNaklodetChangeBuxt.pas' {frmChangeBuxt},
  untOtpravka in 'untOtpravka.pas' {frmOtpravka},
  untOtpravkaEdit in 'untOtpravkaEdit.pas' {frmOtpravkaEdit},
  SkladSprEdit in 'SkladSprEdit.pas' {frmSkladSprEdit},
  PrixSklad in 'PrixSklad.pas' {frmPrixSklad},
  untNaklodet in 'untNaklodet.pas' {frmNaklodet},
  ClientSchet in 'ClientSchet.pas' {frmClientSchet},
  ClientSprEdit in 'ClientSprEdit.pas' {frmClientEdit},
  untNakloEdit in 'untNakloEdit.pas' {frmNakloEdit},
  SettingsNakloTip in 'SettingsNakloTip.pas' {fmSettingsNakloTip},
  SettingsManager in 'SettingsManager.pas' {fmSettingsManager},
  ZakazEdit in 'ZakazEdit.pas' {frmZakazEdit},
  SkladAux in 'SkladAux.pas',
  Naklr in 'Naklr.pas' {frmNaklr},
  RepDolg in 'RepDolg.pas' {frmRepDolg3},
  DolgDet3 in 'DolgDet3.pas' {frmDolgDet3},
  RepDolgBux in 'RepDolgBux.pas' {frmRepDolgBux},
  untAfterCutOstatok in 'untAfterCutOstatok.pas' {frmAfterCutOstatok},
  ZakazDet in 'ZakazDet.pas' {frmZakazDet},
  untNaklo in 'untNaklo.pas' {frmNaklo},
  TovarSpr in 'TovarSpr.pas' {frmTovarSpr},
  CurrencyEdit in 'CurrencyEdit.pas' {frmCurrencyEdit},
  Spec in 'Spec.pas' {frmSpec},
  SpecDet in 'SpecDet.pas' {frmSpecDet},
  SpecEdit in 'SpecEdit.pas' {frmSpecEdit},
  SettingsVlad in 'SettingsVlad.pas' {fmSettingsVlad},
  PlategyEdit in 'PlategyEdit.pas' {frmPlategyEdit},
  untSkladRasxEx in 'untSkladRasxEx.pas' {frmSkladRasxEx},
  PlategyIsx in 'PlategyIsx.pas' {frmPlategyIsx},
  NaklrEdit in 'NaklrEdit.pas' {frmNaklrEdit},
  RepDolgBuxPost in 'RepDolgBuxPost.pas' {frmRepDolgBuxPost},
  RepDolgBuxPostDet in 'RepDolgBuxPostDet.pas' {frmRepDolgBuxPostDet},
  DetSelect in 'DetSelect.pas' {frmDetSelect},
  NaklpbuxZatraty in 'NaklpBuxZatraty.pas' {frmNaklpbuxZatraty},
  PriceCalc in 'PriceCalc.pas' {frmPriceCalc},
  NaklpBuxZatratyEdit in 'NaklpbuxZatratyEdit.pas' {frmNaklpBuxZatratyEdit},
  SettingsTovar in 'SettingsTovar.pas' {fmSettingsTovar: TFrame},
  SettingsTipGroup in 'SettingsTipGroup.pas' {fmSettingsTipGroup},
  SebestOstDet in 'SebestOstDet.pas' {frmSebestOstDet},
  SettingsPost in 'SettingsPost.pas' {fmSettingsTovar},
  NaklpOst in 'NaklpOst.pas' {frmNaklpOst},
  SettingsNumber in 'SettingsNumber.pas' {fmSettingsNumber},
  NaklpOstDet in 'NaklpOstDet.pas' {frmNaklpOstDet},
  SettingsClient in 'SettingsClient.pas' {fmSettingsClient},
  SebestOtgr in 'SebestOtgr.pas' {frmSebestOtgr},
  SettingsTipDetail in 'SettingsTipDetail.pas' {fmSettingsTipDetail},
  ContactEdit in 'ContactEdit.pas' {frmContactEdit},
  DolgnostSpr in 'DolgnostSpr.pas' {frmDolgnostSpr},
  Sfera in 'Sfera.pas' {frmSfera},
  SferaEdit in 'SferaEdit.pas' {frmSferaEdit},
  CallHistoryEdit in 'CallHistoryEdit.pas' {frmCallHistoryEdit},
  Result in 'Result.pas' {frmResult},
  ResultEdit in 'ResultEdit.pas' {frmResultEdit},
  Reason in 'Reason.pas' {frmReason},
  ReasonEdit in 'ReasonEdit.pas' {frmReasonEdit},
  RepSkladBux in 'RepSkladBux.pas' {frmRepSkladBux},
  RepSkladBuxDet in 'RepSkladBuxDet.pas' {frmRepSkladBuxDet},
  SebMain3 in 'SebMain3.pas' {frmSebMain3},
  SebestOstDet3 in 'SebestOstDet3.pas' {frmSebestOstDet3},
  SebestOst3 in 'SebestOst3.pas' {frmSebestOst3},
  SettingsDate in 'SettingsDate.pas' {fmSettingsDate},
  Statya in 'Statya.pas' {frmStatya},
  StatyaEdit in 'StatyaEdit.pas' {frmStatyaEdit},
  RepSkladBuxVyravn in 'RepSkladBuxVyravn.pas' {frmRepSkladBuxVyravn},
  PriceChange in 'PriceChange.pas' {frmPriceChange},
  PriceSpr in 'PriceSpr.pas' {frmPriceSpr},
  PriceSprEdit in 'PriceSprEdit.pas' {frmPriceSprEdit},
  PriceChangeEdit in 'PriceChangeEdit.pas' {frmPriceChangeEdit},
  PriceChangeDet in 'PriceChangeDet.pas' {frmPriceChangeDet},
  RepPrice in 'RepPrice.pas' {frmRepPrice},
  SettingsDataset in 'SettingsDataset.pas' {fmSettingsDataset},
  NNaklp in 'NNaklp.pas' {frmNNaklp},
  NNaklpEdit in 'NNaklpEdit.pas' {frmNnaklpEdit},
  RepReestrPolychNNakl in 'RepReestrPolychNNakl.pas' {frmRepReestrPolychNNakl},
  SkidkaSpr in 'SkidkaSpr.pas' {frmSkidkaSpr},
  SkidkaSprEdit in 'SkidkaSprEdit.pas' {frmSkidkaSprEdit},
  SkidkaChange in 'SkidkaChange.pas' {frmSkidkaChange},
  SkidkaChangeEdit in 'SkidkaChangeEdit.pas' {frmSkidkaChangeEdit},
  SkidkaChangeDet in 'SkidkaChangeDet.pas' {frmSkidkaChangeDet},
  UslPostavkaSpr in 'UslPostavkaSpr.pas' {frmUslPostavkaSpr},
  UslPostavkaChange in 'UslPostavkaChange.pas' {frmUslPostavkaChange},
  UslPostavkaChangeEdit in 'UslPostavkaChangeEdit.pas' {frmUslPostavkaChangeEdit},
  UslPostavkaChangeDet in 'UslPostavkaChangeDet.pas' {frmUslPostavkaChangeDet},
  VidDostavkiSpr in 'VidDostavkiSpr.pas' {frmVidDostavkiSpr},
  VidDostavkiSprEdit in 'VidDostavkiSprEdit.pas' {frmVidDostavkiSprEdit},
  UslPostavkaSprEdit in 'UslPostavkaSprEdit.pas' {frmUslPostavkaSprEdit},
  SravnPrice in 'SravnPrice.pas' {frmSravnPrice},
  SravnPriceCompare in 'SravnPriceCompare.pas' {frmSravnPriceCompare},
  SravnPriceList in 'SravnPriceList.pas' {frmSravnPriceList},
  SpecOstAll in 'SpecOstAll.pas' {frmSpecOstAll},
  SravnSpec in 'SravnSpec.pas' {frmSravnSpec},
  SettingsSklad in 'SettingsSklad.pas' {fmSettingsSklad},
  ManagerSprEdit in 'ManagerSprEdit.pas' {frmManagerSprEdit},
  RepSkladFact in 'RepSkladFact.pas' {frmRepSkladFact},
  RepSkladFactDet in 'RepSkladFactDet.pas' {frmRepSkladFactDet},
  NaklPeremBux in 'NaklPeremBux.pas' {frmNaklPeremBux},
  NaklPeremBuxEdit in 'NaklPeremBuxEdit.pas' {frmNaklPeremBuxEdit},
  NaklPeremBuxDet in 'NaklPeremBuxDet.pas' {frmNaklPeremBuxDet},
  SebestOtgrBux in 'SebestOtgrBux.pas' {frmSebestOtgrBux},
  SebestOtgrBuxDet in 'SebestOtgrBuxDet.pas' {frmSebestOtgrBuxDet},
  RepNakloDepend in 'RepNakloDepend.pas' {frmRepNakloDepend},
  DesignReport in 'DesignReport.pas',
  Dogovor in 'Dogovor.pas' {frmDogovor},
  DogovorEdit in 'DogovorEdit.pas' {frmDogovorEdit},
  SettingsPlugin in 'SettingsPlugin.pas',
  Vozvrat in 'Vozvrat.pas' {frmVozvrat},
  VozvratEdit in 'VozvratEdit.pas' {frmVozvratEdit},
  VozvratDet in 'VozvratDet.pas' {frmVozvratDet},
  RasxPoKasse in 'RasxPoKasse.pas' {frmRasxPoKasse},
  RasxPoKasseEdit in 'RasxPoKasseEdit.pas' {frmRasxPoKasseEdit},
  RepDolgNal in 'RepDolgNal.pas' {frmRepDolgNal},
  RepDolgSebest in 'RepDolgSebest.pas' {frmRepDolgSebest},
  RepDengiNaSchetax in 'RepDengiNaSchetax.pas' {frmRepDengiNaSchetax},
  RepClientLastContact in 'RepClientLastContact.pas' {frmRepClientLastContact},
  Perevod in 'Perevod.pas' {frmPerevod},
  PerevodEdit in 'PerevodEdit.pas' {frmPerevodEdit},
  AgentSpr in 'AgentSpr.pas' {frmAgentSpr},
  AgentSprEdit in 'AgentSprEdit.pas' {frmAgentSprEdit},
  RepDvigDenSredstv in 'RepDvigDenSredstv.pas' {frmRepDvigDenSredstv},
  PlategyVxodEdit in 'PlategyVxodEdit.pas' {frmPlategyVxodEdit},
  RepReestrVydanNnakl in 'RepReestrVydanNnakl.pas' {frmRepReestrVydanNnakl},
  NaklpBux in 'NaklpBux.pas' {frmNaklpBux},
  NaklpBuxEdit in 'NaklpBuxEdit.pas' {frmNaklpBuxEdit},
  NaklpBuxDet in 'NaklpBuxDet.pas' {frmNaklpBuxDet},
  Naklru in 'Naklru.pas' {frmNaklru},
  NaklruEdit in 'NaklruEdit.pas' {frmNaklruEdit},
  ProjectSpr in 'ProjectSpr.pas' {frmProjectSpr},
  ProjectSprEdit in 'ProjectSprEdit.pas' {frmProjectSprEdit},
  StatyadrSprEdit in 'StatyadrSprEdit.pas' {frmStatyadrSprEdit},
  StatyadrSpr in 'StatyadrSpr.pas' {frmStatyadrSpr},
  NaklpuEdit2 in 'NaklpuEdit2.pas' {frmNaklpuEdit2},
  Naklpu2 in 'Naklpu2.pas' {frmNaklpu2},
  RepBalansKursDiff in 'RepBalansKursDiff.pas' {frmRepBalansKursDiff},
  RepBalans in 'RepBalans.pas' {frmRepBalans},
  Spravochnik in 'Spravochnik.pas' {frmSpravochnik},
  Naklrf in 'Naklrf.pas' {frmNaklrf},
  RepDoxodRasxod in 'RepDoxodRasxod.pas' {frmRepDoxodRasxod},
  RepDoxodRasxodDet in 'RepDoxodRasxodDet.pas' {frmRepDoxodRasxodDet},
  XmlHelper in 'XmlHelper.pas',
  untSkladEdit in 'untSkladEdit.pas' {frmSkladEdit},
  RepDoxodRasxodKorr in 'RepDoxodRasxodKorr.pas' {frmRepDoxodRasxodKorr},
  VozvratPost in 'VozvratPost.pas' {frmVozvratPost},
  VozvratPostEdit in 'VozvratPostEdit.pas' {frmVozvratPostEdit},
  VozvratPostDet in 'VozvratPostDet.pas' {frmVozvratPostDet},
  J0215102 in 'J0215102.pas',
  ReysSpr in 'ReysSpr.pas' {frmReysSpr},
  ReysSprEdit in 'ReysSprEdit.pas' {frmReysSprEdit},
  VygruzkaSpr in 'VygruzkaSpr.pas' {frmVygruzkaSpr},
  VygruzkaSprEdit in 'VygruzkaSprEdit.pas' {frmVygruzkaSprEdit},
  RepReys in 'RepReys.pas' {frmRepReys},
  RepReysDet in 'RepReysDet.pas' {frmRepReysDet},
  RepPribylPrilogEdnal in 'RepPribylPrilogEdnal.pas' {frmRepPribylPrilogEdnal},
  J0111901 in 'J0111901.pas',
  RepNNaklXml in 'RepNNaklXml.pas' {frmRepNnaklXml},
  J0215104 in 'J0215104.pas',
  J1201508 in 'J1201508.pas',
  EdizSpr in 'EdizSpr.pas' {frmEdizSpr},
  J1201009 in 'J1201009.pas',
  J1201010 in 'J1201010.pas';

{$R *.RES}
begin
  Application.Title := '����';
  Application.Initialize;
  Application.CreateForm(TdmdEx, dmdEx);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

