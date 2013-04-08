
INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-7, 3001, 0, 'ПОСТАВКА НЕПЛАТЕЛЬЩИКУ НДС', 'Поставка неплательщику НДС', 'ПН02', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-6, 3001, 0, 'НАЛОГОВАЯ НА ОБЫЧНЫЕ ЦЕНЫ', 'Обычная цена', 'ПН01', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-5, 3001, 0, 'ОПЛАТА ТРУДА ФИЗ ЛИЦ', 'Оплата труда физических лиц', 'ПН03', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-4, 3001, 0, 'НЕПРОИЗВОДСТВЕННОЕ ИСПОЛЬЗОВАНИЕ', 'Непроизводственное использование', 'ПН04', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-3, 3001, 0, 'ЛИКВИДАЦИЯ ОСНОВНЫХ ФОНДОВ', 'Ликвидация основных фондов', 'ПН05', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-2, 3001, 0, 'ПЕРЕВОД В НЕПРОИЗВОДСТВЕННЫЕ', 'Перевод осн фондов в непроизводственные', 'ПН06', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-1, 3001, 0, 'НЕ ОБЪЕКТ ОБЛОЖЕНИЯ', 'Не объект налогообложения', 'ПН08', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-103, 3001, 0, 'ОСВОБОДЕНА ОТ ОБЛОЖЕНИЯ', 'Освобождена от налогооблажения', 'ПН09', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-104, 3001, 0, 'АННУЛИРОВАНИЕ', 'Аннулирование регистрации плательщика НДС', 'ПН10', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-105, 3001, 0, 'ЕЖЕДНЕВНЫЙ ИТОГ', 'Ежедневный итог', 'ПН11', NULL);

UPDATE OBJECTS
SET PREDEFINED = 'ПН07'
WHERE (OID = -32) and  NAME = 'НАЛОГОВАЯ ЭКСПОРТНАЯ';

UPDATE OBJECTS
SET PREDEFINED = 'ПН'
WHERE (OID = 3002) and  NAME = 'НАЛОГОВАЯ';


UPDATE OBJECTS
SET PREDEFINED = 'ПН07'
WHERE (OID = 3001) and  NAME = 'НАЛОГОВАЯ ЭКСПОРТНАЯ';

UPDATE OBJECTS
SET PREDEFINED = 'ПН'
WHERE (OID = -35) and  NAME = 'УСЛУГИ ОТ НЕРЕЗИДЕНТА';

UPDATE OBJECTS
SET PREDEFINED = 'РК'
WHERE (OID = 3003) and  NAME = 'КОРРЕКТИРОВКА';

UPDATE OBJECTS
SET PREDEFINED = 'ПНУ'
WHERE (OID = -9) and  NAME = 'НАЛОГОВАЯ УТОЧНЯЮЩАЯ';


UPDATE OBJECTS
SET DELMARKED = 1
WHERE (OID = -11) and  NAME = 'ПП' ;



UPDATE OBJECTS
SET DELMARKED = 1
WHERE (OID = -10) and  NAME = 'ЗЦ';






