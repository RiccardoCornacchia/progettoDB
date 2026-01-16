-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Fri Jan 16 15:53:22 2026 
-- * LUN file: C:\Users\Utente\Downloads\projectDB.lun 
-- * Schema: raffinamento_schema_da_trasformare/1 
-- ********************************************* 


-- Database Section
-- ________________ 

create database raffinamento_schema_da_trasformare;
use raffinamento_schema_da_trasformare;


-- Tables Section
-- _____________ 

create table ABBONAMENTO (
     scadenza date not null,
     codAbbonamento int not null,
     nomeAbbonamento varchar(20) not null,
     constraint ID_ABBONAMENTO_ID primary key (codAbbonamento));

create table ACQUISTO_A (
     CF varchar(20) not null,
     codAbbonamento int not null,
     data date not null,
     orario varchar(10) not null,
     constraint FKACQ_VIS_2_ID primary key (CF),
     constraint FKACQ_ABB_ID unique (codAbbonamento));

create table ACQUISTO_B (
     CF varchar(20) not null,
     codiceBiglietto int not null,
     data date not null,
     orario varchar(10) not null,
     constraint FKACQ_VIS_1_ID primary key (CF),
     constraint FKACQ_BIG_ID unique (codiceBiglietto));

create table ACQUISTO_FOTO (
     codiceFoto int not null,
     data char(1) not null,
     orario char(1) not null,
     CF varchar(20) not null,
     constraint FKACQ_FOT_ID primary key (codiceFoto));

create table AREA_TEMATICHE (
     nomeAreaTematiche varchar(20) not null,
     CF varchar(20) not null,
     disponibilita char not null,
     tema varchar(20) not null,
     dataInizio date not null,
     dataFine date not null,
     constraint ID_AREA_TEMATICHE_ID primary key (nomeAreaTematiche),
     constraint FKSUPERVISIONE_AT_ID unique (CF));

create table ATTIVITA_COMMERCIALE (
     codiceAttivita int not null,
     nomeAttivita varchar(20) not null,
     orarioApertura varchar(10) not null,
     orarioChiusura varchar(10) not null,
     disponibilita char not null,
     numeroDipendenti int not null,
     tipologiaAttivita varchar(15) not null,
     constraint ID_ATTIVITA_COMMERCIALE_ID primary key (codiceAttivita));

create table ATTRAZIONE_DI_PAURA (
     nomeAttrazionePaura varchar(20) not null,
     CF varchar(20) not null,
     disponibilita char not null,
     prezzoAggiuntivo decimal(10,2) not null,
     dataInizio date not null,
     dataFine date not null,
     constraint ID_ATTRAZIONE_DI_PAURA_ID primary key (nomeAttrazionePaura),
     constraint FKSUPERVISIONE_AP_ID unique (CF));

create table BAGNO (
     disponibilita char not null,
     codiceBagno int not null,
     constraint ID_BAGNO_ID primary key (codiceBagno));

create table BIGLIETTO (
     codiceBiglietto int not null,
     nomeBiglietto varchar(15) not null,
     constraint ID_BIGLIETTO_ID primary key (codiceBiglietto));

create table CASSA (
     numeroCassa int not null,
     CF varchar(20) not null,
     orarioApertura varchar(10) not null,
     orarioChiusura varchar(10) not null,
     stato char not null,
     constraint ID_CASSA_ID primary key (numeroCassa),
     constraint FKCOLLOCAZIONE_ID unique (CF));

create table ESECUZIONE (
     CF varchar(20) not null,
     codiceManutenzione int not null,
     constraint ID_ESECUZIONE_ID primary key (codiceManutenzione, CF));

create table ESIBIZIONE_E (
     codiceEvento int not null,
     CF varchar(20) not null,
     ruolo varchar(20) not null,
     constraint ID_ESIBIZIONE_E_ID primary key (codiceEvento, CF));

create table ESIBIZIONE_S (
     CF varchar(20) not null,
     codiceReplica int not null,
     ruolo varchar(20) not null,
     constraint ID_ESIBIZIONE_S_ID primary key (codiceReplica, CF));

create table EVENTO (
     codiceEvento int not null,
     nomeEvento varchar(20) not null,
     tematica varchar(30) not null,
     oraInizio varchar(10) not null,
     oraFine varchar(10) not null,
     data date not null,
     constraint ID_EVENTO_ID primary key (codiceEvento));

create table FOTO (
     codiceFoto int not null,
     prezzo decimal(10,2) not null,
     constraint ID_FOTO_ID primary key (codiceFoto));

create table GIOSTRA (
     nomeGiostra varchar(20) not null,
     CF varchar(20) not null,
     capienza int not null,
     disponibilita char not null,
     etaMinima int not null,
     durataGiostra int not null,
     acquatica char not null,
     etaMassima int,
     velocita decimal(5,2) not null,
     altezzaMaxVisitatore int,
     tipologiaGiostra varchar(20) not null,
     constraint ID_GIOSTRA_ID primary key (nomeGiostra),
     constraint FKSUPERVISIONE_G_ID unique (CF));

create table GRUPPO (
     codiceGruppo int not null,
     gruppoScuola char not null,
     constraint ID_GRUPPO_ID primary key (codiceGruppo));

create table LAVORATORE (
     nome varchar(20) not null,
     cognome varchar(20) not null,
     dataNascita char(1) not null,
     CF varchar(20) not null,
     numeroTelefono bigint not null,
     e_mail varchar(30) not null,
     mansione varchar(20) not null,
     dataInizioContratto date not null,
     stipendio decimal(10,2) not null,
     codiceAttivita int,
     IMP_codiceAttivita int,
     nomeGiostra varchar(20),
     nomeAreaTematiche varchar(20),
     nomeRuota varchar(20),
     nomeAttrazionePaura varchar(20),
     constraint ID_LAVORATORE_ID primary key (CF));

create table MANUTENZIONE (
     codiceManutenzione int not null,
     dataInizio date not null,
     tipoGuasto varchar(30) not null,
     dataFine date,
     impiantoInManutenzione varchar(15) not null,
     nomeRuota varchar(20),
     nomeGiostra varchar(20),
     nomeAreaTematiche varchar(20),
     nomeAttrazionePaura varchar(20),
     constraint ID_MANUTENZIONE_ID primary key (codiceManutenzione));

create table PARTECIPAZIONE (
     codicePartecipazione int not null,
     orario varchar(10) not null,
     data date not null,
     codiceReplica int,
     CF varchar(20) not null,
     nomeRuota varchar(20),
     nomeAreaTematiche varchar(20),
     nomeAttrazionePaura varchar(20),
     constraint ID_PARTECIPAZIONE_ID primary key (codicePartecipazione));

create table PRESENZA (
     codiceEvento int not null,
     CF varchar(20) not null,
     constraint ID_PRESENZA_ID primary key (codiceEvento, CF));

create table PULIZIA_A (
     codiceAttivita int not null,
     CF varchar(20) not null,
     constraint ID_PULIZIA_A_ID primary key (codiceAttivita, CF));

create table PULIZIA_B (
     codiceBagno int not null,
     CF varchar(20) not null,
     constraint ID_PULIZIA_B_ID primary key (codiceBagno, CF));

create table REPLICA_SPETTACOLO (
     data date not null,
     codiceReplica int not null,
     oraInizio varchar(10) not null,
     oraFine varchar(10) not null,
     nomeSpettacolo varchar(20) not null,
     constraint ID_REPLICA_SPETTACOLO_ID primary key (codiceReplica));

create table RUOTA_PANORAMICA (
     nomeRuota varchar(20) not null,
     CF varchar(20) not null,
     disponibilita char not null,
     durataRuotaPanoramica int not null,
     altezzaRuotaPanoramica decimal(5,2) not null,
     constraint ID_RUOTA_PANORAMICA_ID primary key (nomeRuota),
     constraint FKSUPERVISIONE_RUOTA_ID unique (CF));

create table SALITA (
     CF varchar(20) not null,
     nomeGiostra varchar(20) not null,
     data date not null,
     orario varchar(10) not null,
     constraint ID_SALITA_ID primary key (CF, nomeGiostra, data, orario));

create table SCONTO (
     nomeBiglietto varchar(15) not null,
     motivazione varchar(15) not null,
     percentuale int not null,
     constraint ID_SCONTO_ID primary key (nomeBiglietto, motivazione),
     constraint FKAPPLICAZIONE_ID unique (nomeBiglietto));

create table SPETTACOLO (
     durataSpettacolo int not null,
     nomeSpettacolo varchar(20) not null,
     disponibilita char not null,
     constraint ID_SPETTACOLO_ID primary key (nomeSpettacolo));

create table TIPOLOGIA_ABBONAMENTO (
     nomeAbbonamento varchar(20) not null,
     prezzo decimal(10,2) not null,
     constraint ID_TIPOLOGIA_ABBONAMENTO_ID primary key (nomeAbbonamento));

create table TIPOLOGIA_BIGLIETTO (
     nomeBiglietto varchar(15) not null,
     prezzo decimal(10,2) not null,
     constraint ID_TIPOLOGIA_BIGLIETTO_ID primary key (nomeBiglietto));

create table TURNO_DI_LAVORO (
     CF varchar(20) not null,
     oraInizio varchar(10) not null,
     oraFine varchar(10) not null,
     data date not null,
     constraint ID_TURNO_DI_LAVORO_ID primary key (CF, oraInizio, data));

create table USUFRUIZIONE (
     codiceAttivita int not null,
     CF varchar(20) not null,
     acquisto varchar(20) not null,
     prezzoAcquisto decimal(10,2) not null,
     data date not null,
     orario varchar(10) not null,
     constraint ID_USUFRUIZIONE_ID primary key (codiceAttivita, CF, data, orario));

create table UTILIZZO (
     codiceBagno int not null,
     CF varchar(20) not null,
     constraint ID_UTILIZZO_ID primary key (codiceBagno, CF));

create table VENDITA_A (
     codAbbonamento int not null,
     data date not null,
     orario varchar(10) not null,
     numeroCassa int not null,
     constraint FKVEN_ABB_ID primary key (codAbbonamento));

create table VENDITA_B (
     codiceBiglietto int not null,
     data date not null,
     orario varchar(10) not null,
     numeroCassa int not null,
     constraint FKVEN_BIG_ID primary key (codiceBiglietto));

create table VENDITA_FOTO (
     codiceFoto int not null,
     data date not null,
     orario varchar(10) not null,
     codiceAttivita int not null,
     constraint FKVEN_FOT_ID primary key (codiceFoto));

create table VISITATORE (
     nome varchar(20) not null,
     cognome varchar(20) not null,
     dataNascita date not null,
     CF varchar(20) not null,
     numeroTelefono bigint not null,
     e_mail varchar(30) not null,
     altezzaVisitatore int not null,
     codiceGruppo int,
     constraint ID_VISITATORE_ID primary key (CF));


-- Constraints Section
-- ___________________ 

-- Not implemented
-- alter table ABBONAMENTO add constraint ID_ABBONAMENTO_CHK
--     check(exists(select * from ACQUISTO_A
--                  where ACQUISTO_A.codAbbonamento = codAbbonamento)); 

-- Not implemented
-- alter table ABBONAMENTO add constraint ID_ABBONAMENTO_CHK
--     check(exists(select * from VENDITA_A
--                  where VENDITA_A.codAbbonamento = codAbbonamento)); 

alter table ABBONAMENTO add constraint FKTIPO_A_FK
     foreign key (nomeAbbonamento)
     references TIPOLOGIA_ABBONAMENTO (nomeAbbonamento);

alter table ACQUISTO_A add constraint FKACQ_VIS_2_FK
     foreign key (CF)
     references VISITATORE (CF);

alter table ACQUISTO_A add constraint FKACQ_ABB_FK
     foreign key (codAbbonamento)
     references ABBONAMENTO (codAbbonamento);

alter table ACQUISTO_B add constraint FKACQ_VIS_1_FK
     foreign key (CF)
     references VISITATORE (CF);

alter table ACQUISTO_B add constraint FKACQ_BIG_FK
     foreign key (codiceBiglietto)
     references BIGLIETTO (codiceBiglietto);

alter table ACQUISTO_FOTO add constraint FKACQ_VIS_FK
     foreign key (CF)
     references VISITATORE (CF);

alter table ACQUISTO_FOTO add constraint FKACQ_FOT_FK
     foreign key (codiceFoto)
     references FOTO (codiceFoto);

-- Not implemented
-- alter table AREA_TEMATICHE add constraint ID_AREA_TEMATICHE_CHK
--     check(exists(select * from LAVORATORE
--                  where LAVORATORE.nomeAreaTematiche = nomeAreaTematiche)); 

alter table AREA_TEMATICHE add constraint FKSUPERVISIONE_AT_FK
     foreign key (CF)
     references LAVORATORE (CF);

-- Not implemented
-- alter table ATTIVITA_COMMERCIALE add constraint ID_ATTIVITA_COMMERCIALE_CHK
--     check(exists(select * from LAVORATORE
--                  where LAVORATORE.IMP_codiceAttivita = codiceAttivita)); 

-- Not implemented
-- alter table ATTIVITA_COMMERCIALE add constraint ID_ATTIVITA_COMMERCIALE_CHK
--     check(exists(select * from LAVORATORE
--                  where LAVORATORE.codiceAttivita = codiceAttivita)); 

-- Not implemented
-- alter table ATTIVITA_COMMERCIALE add constraint ID_ATTIVITA_COMMERCIALE_CHK
--     check(exists(select * from PULIZIA_A
--                  where PULIZIA_A.codiceAttivita = codiceAttivita)); 

-- Not implemented
-- alter table ATTRAZIONE_DI_PAURA add constraint ID_ATTRAZIONE_DI_PAURA_CHK
--     check(exists(select * from LAVORATORE
--                  where LAVORATORE.nomeAttrazionePaura = nomeAttrazionePaura)); 

alter table ATTRAZIONE_DI_PAURA add constraint FKSUPERVISIONE_AP_FK
     foreign key (CF)
     references LAVORATORE (CF);

-- Not implemented
-- alter table BAGNO add constraint ID_BAGNO_CHK
--     check(exists(select * from PULIZIA_B
--                  where PULIZIA_B.codiceBagno = codiceBagno)); 

-- Not implemented
-- alter table BIGLIETTO add constraint ID_BIGLIETTO_CHK
--     check(exists(select * from ACQUISTO_B
--                  where ACQUISTO_B.codiceBiglietto = codiceBiglietto)); 

-- Not implemented
-- alter table BIGLIETTO add constraint ID_BIGLIETTO_CHK
--     check(exists(select * from VENDITA_B
--                  where VENDITA_B.codiceBiglietto = codiceBiglietto)); 

alter table BIGLIETTO add constraint FKTIPO_B_FK
     foreign key (nomeBiglietto)
     references TIPOLOGIA_BIGLIETTO (nomeBiglietto);

alter table CASSA add constraint FKCOLLOCAZIONE_FK
     foreign key (CF)
     references LAVORATORE (CF);

alter table ESECUZIONE add constraint FKESE_MAN
     foreign key (codiceManutenzione)
     references MANUTENZIONE (codiceManutenzione);

alter table ESECUZIONE add constraint FKESE_LAV_FK
     foreign key (CF)
     references LAVORATORE (CF);

alter table ESIBIZIONE_E add constraint FKESI_LAV_1_FK
     foreign key (CF)
     references LAVORATORE (CF);

alter table ESIBIZIONE_E add constraint FKESI_EVE
     foreign key (codiceEvento)
     references EVENTO (codiceEvento);

alter table ESIBIZIONE_S add constraint FKESI_REP
     foreign key (codiceReplica)
     references REPLICA_SPETTACOLO (codiceReplica);

alter table ESIBIZIONE_S add constraint FKESI_LAV_FK
     foreign key (CF)
     references LAVORATORE (CF);

-- Not implemented
-- alter table FOTO add constraint ID_FOTO_CHK
--     check(exists(select * from ACQUISTO_FOTO
--                  where ACQUISTO_FOTO.codiceFoto = codiceFoto)); 

-- Not implemented
-- alter table FOTO add constraint ID_FOTO_CHK
--     check(exists(select * from VENDITA_FOTO
--                  where VENDITA_FOTO.codiceFoto = codiceFoto)); 

-- Not implemented
-- alter table GIOSTRA add constraint ID_GIOSTRA_CHK
--     check(exists(select * from LAVORATORE
--                  where LAVORATORE.nomeGiostra = nomeGiostra)); 

alter table GIOSTRA add constraint FKSUPERVISIONE_G_FK
     foreign key (CF)
     references LAVORATORE (CF);

-- Not implemented
-- alter table GRUPPO add constraint ID_GRUPPO_CHK
--     check(exists(select * from VISITATORE
--                  where VISITATORE.codiceGruppo = codiceGruppo)); 

-- Not implemented
-- alter table LAVORATORE add constraint ID_LAVORATORE_CHK
--     check(exists(select * from TURNO_DI_LAVORO
--                  where TURNO_DI_LAVORO.CF = CF)); 

alter table LAVORATORE add constraint FKLAVORO_FK
     foreign key (codiceAttivita)
     references ATTIVITA_COMMERCIALE (codiceAttivita);

alter table LAVORATORE add constraint FKIMPIEGO_FK
     foreign key (IMP_codiceAttivita)
     references ATTIVITA_COMMERCIALE (codiceAttivita);

alter table LAVORATORE add constraint FKGESTIONE_G_FK
     foreign key (nomeGiostra)
     references GIOSTRA (nomeGiostra);

alter table LAVORATORE add constraint FKGESTIONE_AT_FK
     foreign key (nomeAreaTematiche)
     references AREA_TEMATICHE (nomeAreaTematiche);

alter table LAVORATORE add constraint FKGESTIONE_RUOTA_FK
     foreign key (nomeRuota)
     references RUOTA_PANORAMICA (nomeRuota);

alter table LAVORATORE add constraint FKGESTIONE_AP_FK
     foreign key (nomeAttrazionePaura)
     references ATTRAZIONE_DI_PAURA (nomeAttrazionePaura);

-- Not implemented
-- alter table MANUTENZIONE add constraint ID_MANUTENZIONE_CHK
--     check(exists(select * from ESECUZIONE
--                  where ESECUZIONE.codiceManutenzione = codiceManutenzione)); 

alter table MANUTENZIONE add constraint FKMANUTENZIONE_RUOTA_FK
     foreign key (nomeRuota)
     references RUOTA_PANORAMICA (nomeRuota);

alter table MANUTENZIONE add constraint FKMANUTENZIONE_G_FK
     foreign key (nomeGiostra)
     references GIOSTRA (nomeGiostra);

alter table MANUTENZIONE add constraint FKMANUTENZIONE_AT_FK
     foreign key (nomeAreaTematiche)
     references AREA_TEMATICHE (nomeAreaTematiche);

alter table MANUTENZIONE add constraint FKMANUTENZIONE_AP_FK
     foreign key (nomeAttrazionePaura)
     references ATTRAZIONE_DI_PAURA (nomeAttrazionePaura);

alter table PARTECIPAZIONE add constraint FKVISIONE_FK
     foreign key (codiceReplica)
     references REPLICA_SPETTACOLO (codiceReplica);

alter table PARTECIPAZIONE add constraint FKCOMPIMENTO_FK
     foreign key (CF)
     references VISITATORE (CF);

alter table PARTECIPAZIONE add constraint FKALLA_RUOTA_FK
     foreign key (nomeRuota)
     references RUOTA_PANORAMICA (nomeRuota);

alter table PARTECIPAZIONE add constraint FKALLA_AT_FK
     foreign key (nomeAreaTematiche)
     references AREA_TEMATICHE (nomeAreaTematiche);

alter table PARTECIPAZIONE add constraint FKALLA_AP_FK
     foreign key (nomeAttrazionePaura)
     references ATTRAZIONE_DI_PAURA (nomeAttrazionePaura);

alter table PRESENZA add constraint FKPRE_VIS_FK
     foreign key (CF)
     references VISITATORE (CF);

alter table PRESENZA add constraint FKPRE_EVE
     foreign key (codiceEvento)
     references EVENTO (codiceEvento);

alter table PULIZIA_A add constraint FKPUL_LAV_1_FK
     foreign key (CF)
     references LAVORATORE (CF);

alter table PULIZIA_A add constraint FKPUL_ATT
     foreign key (codiceAttivita)
     references ATTIVITA_COMMERCIALE (codiceAttivita);

alter table PULIZIA_B add constraint FKPUL_LAV_FK
     foreign key (CF)
     references LAVORATORE (CF);

alter table PULIZIA_B add constraint FKPUL_BAG
     foreign key (codiceBagno)
     references BAGNO (codiceBagno);

-- Not implemented
-- alter table REPLICA_SPETTACOLO add constraint ID_REPLICA_SPETTACOLO_CHK
--     check(exists(select * from ESIBIZIONE_S
--                  where ESIBIZIONE_S.codiceReplica = codiceReplica)); 

alter table REPLICA_SPETTACOLO add constraint FKREPLICA_FK
     foreign key (nomeSpettacolo)
     references SPETTACOLO (nomeSpettacolo);

-- Not implemented
-- alter table RUOTA_PANORAMICA add constraint ID_RUOTA_PANORAMICA_CHK
--     check(exists(select * from LAVORATORE
--                  where LAVORATORE.nomeRuota = nomeRuota)); 

alter table RUOTA_PANORAMICA add constraint FKSUPERVISIONE_RUOTA_FK
     foreign key (CF)
     references LAVORATORE (CF);

alter table SALITA add constraint FKSULLA_FK
     foreign key (nomeGiostra)
     references GIOSTRA (nomeGiostra);

alter table SALITA add constraint FKPROVA
     foreign key (CF)
     references VISITATORE (CF);

alter table SCONTO add constraint FKAPPLICAZIONE_FK
     foreign key (nomeBiglietto)
     references TIPOLOGIA_BIGLIETTO (nomeBiglietto);

-- Not implemented
-- alter table SPETTACOLO add constraint ID_SPETTACOLO_CHK
--     check(exists(select * from REPLICA_SPETTACOLO
--                  where REPLICA_SPETTACOLO.nomeSpettacolo = nomeSpettacolo)); 

-- Not implemented
-- alter table TIPOLOGIA_ABBONAMENTO add constraint ID_TIPOLOGIA_ABBONAMENTO_CHK
--     check(exists(select * from ABBONAMENTO
--                  where ABBONAMENTO.nomeAbbonamento = nomeAbbonamento)); 

-- Not implemented
-- alter table TIPOLOGIA_BIGLIETTO add constraint ID_TIPOLOGIA_BIGLIETTO_CHK
--     check(exists(select * from BIGLIETTO
--                  where BIGLIETTO.nomeBiglietto = nomeBiglietto)); 

alter table TURNO_DI_LAVORO add constraint FKASSEGNAZIONE
     foreign key (CF)
     references LAVORATORE (CF);

alter table USUFRUIZIONE add constraint FKEFFETTUAZIONE_FK
     foreign key (CF)
     references VISITATORE (CF);

alter table USUFRUIZIONE add constraint FKDELLA
     foreign key (codiceAttivita)
     references ATTIVITA_COMMERCIALE (codiceAttivita);

alter table UTILIZZO add constraint FKUTI_VIS_FK
     foreign key (CF)
     references VISITATORE (CF);

alter table UTILIZZO add constraint FKUTI_BAG
     foreign key (codiceBagno)
     references BAGNO (codiceBagno);

alter table VENDITA_A add constraint FKVEN_CAS_1_FK
     foreign key (numeroCassa)
     references CASSA (numeroCassa);

alter table VENDITA_A add constraint FKVEN_ABB_FK
     foreign key (codAbbonamento)
     references ABBONAMENTO (codAbbonamento);

alter table VENDITA_B add constraint FKVEN_CAS_FK
     foreign key (numeroCassa)
     references CASSA (numeroCassa);

alter table VENDITA_B add constraint FKVEN_BIG_FK
     foreign key (codiceBiglietto)
     references BIGLIETTO (codiceBiglietto);

alter table VENDITA_FOTO add constraint FKVEN_FOT_FK
     foreign key (codiceFoto)
     references FOTO (codiceFoto);

alter table VENDITA_FOTO add constraint FKVEN_ATT_FK
     foreign key (codiceAttivita)
     references ATTIVITA_COMMERCIALE (codiceAttivita);

alter table VISITATORE add constraint FKAPPARTENENZA_FK
     foreign key (codiceGruppo)
     references GRUPPO (codiceGruppo);


-- Index Section
-- _____________ 

create unique index ID_ABBONAMENTO_IND
     on ABBONAMENTO (codAbbonamento);

create index FKTIPO_A_IND
     on ABBONAMENTO (nomeAbbonamento);

create unique index FKACQ_VIS_2_IND
     on ACQUISTO_A (CF);

create unique index FKACQ_ABB_IND
     on ACQUISTO_A (codAbbonamento);

create unique index FKACQ_VIS_1_IND
     on ACQUISTO_B (CF);

create unique index FKACQ_BIG_IND
     on ACQUISTO_B (codiceBiglietto);

create index FKACQ_VIS_IND
     on ACQUISTO_FOTO (CF);

create unique index FKACQ_FOT_IND
     on ACQUISTO_FOTO (codiceFoto);

create unique index ID_AREA_TEMATICHE_IND
     on AREA_TEMATICHE (nomeAreaTematiche);

create unique index FKSUPERVISIONE_AT_IND
     on AREA_TEMATICHE (CF);

create unique index ID_ATTIVITA_COMMERCIALE_IND
     on ATTIVITA_COMMERCIALE (codiceAttivita);

create unique index ID_ATTRAZIONE_DI_PAURA_IND
     on ATTRAZIONE_DI_PAURA (nomeAttrazionePaura);

create unique index FKSUPERVISIONE_AP_IND
     on ATTRAZIONE_DI_PAURA (CF);

create unique index ID_BAGNO_IND
     on BAGNO (codiceBagno);

create unique index ID_BIGLIETTO_IND
     on BIGLIETTO (codiceBiglietto);

create index FKTIPO_B_IND
     on BIGLIETTO (nomeBiglietto);

create unique index ID_CASSA_IND
     on CASSA (numeroCassa);

create unique index FKCOLLOCAZIONE_IND
     on CASSA (CF);

create unique index ID_ESECUZIONE_IND
     on ESECUZIONE (codiceManutenzione, CF);

create index FKESE_LAV_IND
     on ESECUZIONE (CF);

create unique index ID_ESIBIZIONE_E_IND
     on ESIBIZIONE_E (codiceEvento, CF);

create index FKESI_LAV_1_IND
     on ESIBIZIONE_E (CF);

create unique index ID_ESIBIZIONE_S_IND
     on ESIBIZIONE_S (codiceReplica, CF);

create index FKESI_LAV_IND
     on ESIBIZIONE_S (CF);

create unique index ID_EVENTO_IND
     on EVENTO (codiceEvento);

create unique index ID_FOTO_IND
     on FOTO (codiceFoto);

create unique index ID_GIOSTRA_IND
     on GIOSTRA (nomeGiostra);

create unique index FKSUPERVISIONE_G_IND
     on GIOSTRA (CF);

create unique index ID_GRUPPO_IND
     on GRUPPO (codiceGruppo);

create unique index ID_LAVORATORE_IND
     on LAVORATORE (CF);

create index FKLAVORO_IND
     on LAVORATORE (codiceAttivita);

create index FKIMPIEGO_IND
     on LAVORATORE (IMP_codiceAttivita);

create index FKGESTIONE_G_IND
     on LAVORATORE (nomeGiostra);

create index FKGESTIONE_AT_IND
     on LAVORATORE (nomeAreaTematiche);

create index FKGESTIONE_RUOTA_IND
     on LAVORATORE (nomeRuota);

create index FKGESTIONE_AP_IND
     on LAVORATORE (nomeAttrazionePaura);

create unique index ID_MANUTENZIONE_IND
     on MANUTENZIONE (codiceManutenzione);

create index FKMANUTENZIONE_RUOTA_IND
     on MANUTENZIONE (nomeRuota);

create index FKMANUTENZIONE_G_IND
     on MANUTENZIONE (nomeGiostra);

create index FKMANUTENZIONE_AT_IND
     on MANUTENZIONE (nomeAreaTematiche);

create index FKMANUTENZIONE_AP_IND
     on MANUTENZIONE (nomeAttrazionePaura);

create unique index ID_PARTECIPAZIONE_IND
     on PARTECIPAZIONE (codicePartecipazione);

create index FKVISIONE_IND
     on PARTECIPAZIONE (codiceReplica);

create index FKCOMPIMENTO_IND
     on PARTECIPAZIONE (CF);

create index FKALLA_RUOTA_IND
     on PARTECIPAZIONE (nomeRuota);

create index FKALLA_AT_IND
     on PARTECIPAZIONE (nomeAreaTematiche);

create index FKALLA_AP_IND
     on PARTECIPAZIONE (nomeAttrazionePaura);

create unique index ID_PRESENZA_IND
     on PRESENZA (codiceEvento, CF);

create index FKPRE_VIS_IND
     on PRESENZA (CF);

create unique index ID_PULIZIA_A_IND
     on PULIZIA_A (codiceAttivita, CF);

create index FKPUL_LAV_1_IND
     on PULIZIA_A (CF);

create unique index ID_PULIZIA_B_IND
     on PULIZIA_B (codiceBagno, CF);

create index FKPUL_LAV_IND
     on PULIZIA_B (CF);

create unique index ID_REPLICA_SPETTACOLO_IND
     on REPLICA_SPETTACOLO (codiceReplica);

create index FKREPLICA_IND
     on REPLICA_SPETTACOLO (nomeSpettacolo);

create unique index ID_RUOTA_PANORAMICA_IND
     on RUOTA_PANORAMICA (nomeRuota);

create unique index FKSUPERVISIONE_RUOTA_IND
     on RUOTA_PANORAMICA (CF);

create unique index ID_SALITA_IND
     on SALITA (CF, nomeGiostra, data, orario);

create index FKSULLA_IND
     on SALITA (nomeGiostra);

create unique index ID_SCONTO_IND
     on SCONTO (nomeBiglietto, motivazione);

create unique index ID_SPETTACOLO_IND
     on SPETTACOLO (nomeSpettacolo);

create unique index ID_TIPOLOGIA_ABBONAMENTO_IND
     on TIPOLOGIA_ABBONAMENTO (nomeAbbonamento);

create unique index ID_TIPOLOGIA_BIGLIETTO_IND
     on TIPOLOGIA_BIGLIETTO (nomeBiglietto);

create unique index ID_TURNO_DI_LAVORO_IND
     on TURNO_DI_LAVORO (CF, oraInizio, data);

create unique index ID_USUFRUIZIONE_IND
     on USUFRUIZIONE (codiceAttivita, CF, data, orario);

create index FKEFFETTUAZIONE_IND
     on USUFRUIZIONE (CF);

create unique index ID_UTILIZZO_IND
     on UTILIZZO (codiceBagno, CF);

create index FKUTI_VIS_IND
     on UTILIZZO (CF);

create index FKVEN_CAS_1_IND
     on VENDITA_A (numeroCassa);

create unique index FKVEN_ABB_IND
     on VENDITA_A (codAbbonamento);

create index FKVEN_CAS_IND
     on VENDITA_B (numeroCassa);

create unique index FKVEN_BIG_IND
     on VENDITA_B (codiceBiglietto);

create unique index FKVEN_FOT_IND
     on VENDITA_FOTO (codiceFoto);

create index FKVEN_ATT_IND
     on VENDITA_FOTO (codiceAttivita);

create unique index ID_VISITATORE_IND
     on VISITATORE (CF);

create index FKAPPARTENENZA_IND
     on VISITATORE (codiceGruppo);

