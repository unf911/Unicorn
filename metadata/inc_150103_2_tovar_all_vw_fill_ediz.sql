/*$$IBEC$$ ---------- STATEMENT ----------

alter table TOVAR
add constraint FK_TOVAR_EDIZ
foreign key (ID_EDIZ)
references EDIZ(OID) $$IBEC$$*/


update tovar  t
set id_ediz=(select oid from ediz where name=t.ediz )
where id_ediz is null

