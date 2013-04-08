SET TERM ^ ;
CREATE OR ALTER PROCEDURE NAKLODET_INSERT_PC(
    WHAT INTEGER,
    ID_NAKLD INTEGER,
    ID_OSTT INTEGER,
    KOLOTP DOUBLE PRECISION,
    KOLBUXT INTEGER,
    ID_OSTT_TARA INTEGER)
AS
DECLARE VARIABLE ID_TYPE INTEGER;
DECLARE VARIABLE TIP INTEGER;
DECLARE VARIABLE ID_DET INTEGER;
DECLARE VARIABLE ID_TARA INTEGER;
DECLARE VARIABLE ID_NAKL INTEGER;
DECLARE VARIABLE COMMENT VARCHAR(50);
DECLARE VARIABLE NOMER_TARY VARCHAR(30);
DECLARE VARIABLE KOLOTP_ST NUMERIC(15,4);
DECLARE VARIABLE KOLBUXT_ST INTEGER;
DECLARE VARIABLE POSTED SMALLINT;
declare variable str varchar(100);
begin
  tip = 0;
  select om.posted,om.id_nakl
    from naklo om inner join naklot ot
      on om.id_nakl=ot.id_nakl
    where ot.id_nakld=:id_nakld
    into :posted,:id_nakl;
  if (posted=1) then begin
    execute procedure error ('������ ������ ������ � ���������� ��������');
  end
  select
    st.comment,
    st.id_tara,
    st.id_type,
    st.kolotp,
    st.kolbuxt,
    st.nomer_tary
  from sklostt st
  where st.id_ostt=:id_ostt
  into
    :comment,
    :id_tara,
    :id_type,
    :kolotp_st,
    :kolbuxt_st,
    :nomer_tary;
  /*�������*/
  if ((what=1) or (what=7))  then begin
    id_det=gen_id(naklodet_gen,1);
    tip = 2;
    if ((Round(kolotp_st,3)>0) and (kolbuxt_st>0)) then begin
      kolotp = kolotp_st;
      kolbuxt = kolbuxt_st;
    end else begin
      str = '������ �����������';
      execute procedure error(str);
    end
  end
  /*�������� �����, ���������� �����*/
  if (what=2) then begin
    /*���� ������� �� ����� ����� ��� �������� (�� �����)*/
    if (kolbuxt_st=1) then begin
      if (Round(kolotp,3)>Round(kolotp_st,3)) then begin
        str = '���������� �������� ����� � ������ ����� '
          || cast(Round(kolotp_st,3) as varchar(6));
        execute procedure error(str);
      end
      if (Round(kolotp,3)=0) then begin
        str = '���������� �������� ����� � ������� ������';
        execute procedure error(str);
      end
      id_det = gen_id(naklodet_gen,1);
      select first 1 id_tara
      from get_buxtnumber_pc
      into :id_tara;
      tip = 3;
    end
    if (kolbuxt_st>1) then begin
      /*����������� �����(�) �����(�) */
      if ((kolbuxt>0) and (Round(kolotp,3)=Round(kolotp_st,3))) then begin
        if (kolbuxt>kolbuxt_st) then begin
          /*���� �� ���������� �������� ������� ������� �������� ������
          ���� ��� ���� �� ������, �� �������� ������ ��� ��������� �����*/
          kolbuxt=kolbuxt_st;
        end
        id_det = gen_id(naklodet_gen,1);
        tip = 3;
      end
      /*����� ���� �� ������ ����*/
      if ((kolbuxt=1) and (Round(kolotp,3)<>Round(kolotp_st,3))) then begin
        str = '���������� �������� ����� � ������ �� ������ '
           || coalesce(kolotp_st,0);
        execute procedure error(str);
      end
    end
    /*������� �� ������ ���� ���� ������� -37 ���� � ���-�� ��������
    �������� ��� ���-��*/
    if (kolbuxt_st<1) then begin
      str = '���������� �������� ���� ����� ���� = ' || coalesce(kolbuxt_st,0);
      execute procedure error(str);
    end/*kolbuxt_st<1*/
    
/*  kolotp=kolotp
    kolbuxt= kolbuxt     */
  end
  /*������� �� �������*/
  if ((what=3) or (what=9)) then begin
    id_det = gen_id(naklodet_gen,1);
    tip = 4;
    /*���� ������� �� ����� ����� ��� �������� (�� �����)*/
    /*������� � ������� ������� ����� ������������ ���
    �������� ������ ���������!!!*/
    /*$$IBE$$
    if (kolbuxt_st=1) then begin    
      if (Round(kolotp,3)=0) then begin
        str = '���������� �������� ����� � ������� ������';
        execute procedure error(str);
      end
    end  $$IBE$$*/ /*if (kolbuxt_st=1)*/
    if (Round(kolotp,3)>0) then begin
      if (Round(kolotp,3)>Round(kolotp_st,3)) then begin
        str = '���������� �������� ����� � ������ ����� '
          || cast(Round(kolotp_st,3) as varchar(6));
        execute procedure error(str);
      end
    end
    select st.id_tara,st.nomer_tary
      from sklostt st
      where st.id_ostt=:ID_OSTT_TARA
      into :id_tara,:nomer_tary;
  end
  /*����� �����, ������� ������*/
    insert into naklodet
      (id_det,
       id_nakld,
       id_tara,
       nomer_tary,
       kolotp,
       kolbuxt,
       comment,
       id_ostt,
       tip)
    values
      (:id_det,
       :id_nakld,
       :id_tara,
       :nomer_tary,
       :kolotp,
       :kolbuxt,
       :comment,
       :id_ostt,
       :tip
      );
      
  if ((what=3) or (what=9))  then begin
    execute procedure sklostdet_insert_check_pc
      (:id_det,21,:ID_OSTT_TARA);
    execute procedure sklostdet_recalc_pc(:ID_OSTT_TARA);
  end
  
  /*������ ������ � ������*/
  execute procedure naklodet_process_pc(:id_det);
  /*�������� ��������� �������*/
  execute procedure sklostdet_recalc_pc(:id_ostt);
  /*���� ���� �� ����� ������� �� ������� �������� */
  if ((what=7) or  (what=9)) then begin
    execute procedure naklot_maketara_pc(:id_nakl,:ID_DET, 1);
  end
END^
SET TERM ; ^


