
INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-7, 3001, 0, '�������� ������������� ���', '�������� ������������� ���', '��02', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-6, 3001, 0, '��������� �� ������� ����', '������� ����', '��01', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-5, 3001, 0, '������ ����� ��� ���', '������ ����� ���������� ���', '��03', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-4, 3001, 0, '������������������ �������������', '������������������ �������������', '��04', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-3, 3001, 0, '���������� �������� ������', '���������� �������� ������', '��05', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-2, 3001, 0, '������� � ������������������', '������� ��� ������ � ������������������', '��06', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-1, 3001, 0, '�� ������ ���������', '�� ������ ���������������', '��08', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-103, 3001, 0, '���������� �� ���������', '����������� �� ���������������', '��09', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-104, 3001, 0, '�������������', '������������� ����������� ����������� ���', '��10', NULL);

INSERT INTO OBJECTS (OID, CLASSID, DELMARKED, NAME, FULLNAME, PREDEFINED, ISDEFAULT)
VALUES (-105, 3001, 0, '���������� ����', '���������� ����', '��11', NULL);

UPDATE OBJECTS
SET PREDEFINED = '��07'
WHERE (OID = -32) and  NAME = '��������� ����������';

UPDATE OBJECTS
SET PREDEFINED = '��'
WHERE (OID = 3002) and  NAME = '���������';


UPDATE OBJECTS
SET PREDEFINED = '��07'
WHERE (OID = 3001) and  NAME = '��������� ����������';

UPDATE OBJECTS
SET PREDEFINED = '��'
WHERE (OID = -35) and  NAME = '������ �� �����������';

UPDATE OBJECTS
SET PREDEFINED = '��'
WHERE (OID = 3003) and  NAME = '�������������';

UPDATE OBJECTS
SET PREDEFINED = '���'
WHERE (OID = -9) and  NAME = '��������� ����������';


UPDATE OBJECTS
SET DELMARKED = 1
WHERE (OID = -11) and  NAME = '��' ;



UPDATE OBJECTS
SET DELMARKED = 1
WHERE (OID = -10) and  NAME = '��';






