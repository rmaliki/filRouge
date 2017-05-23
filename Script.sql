--<ScriptOptions statementTerminator=";"/>

CREATE TABLE MANAGER (
		IDMANAGER NUMBER NOT NULL,
		PWDMANAGER VARCHAR2(255)
	);

CREATE TABLE TEAM (
		IDTEAM NUMBER NOT NULL,
		TEAMNAME VARCHAR2(20)
	);

CREATE TABLE COMPETITION (
		IDCOMPETITION NUMBER NOT NULL,
		NAME VARCHAR2(20),
		CLOSINGDATE null,
		COMPETITOR1 NUMBER,
		COMPETITOR2 NUMBER,
		COMPETITOR3 NUMBER
	);

CREATE TABLE BET (
		IDBET NUMBER NOT NULL,
		TOKENS NUMBER,
		PLAYER NUMBER,
		COMPETITON NUMBER,
		COMPETITOR1 NUMBER,
		COMPETITOR2 NUMBER,
		COMPETITOR3 NUMBER
	);

CREATE TABLE COMPETITOR (
		IDCOMPETITOR NUMBER NOT NULL,
		COMPETITORTYPE VARCHAR2(3),
		TEAM NUMBER,
		PERSON NUMBER
	);

CREATE TABLE PLAYER (
		IDPLAYER NUMBER NOT NULL,
		LASTNAME VARCHAR2(20) NOT NULL,
		FIRSTNAME VARCHAR2(20) NOT NULL,
		USERNAME VARCHAR2(20) NOT NULL,
		PWD VARCHAR2(20) NOT NULL,
		BORNDATE null NOT NULL,
		TOKENS NUMBER
	);

CREATE TABLE PERSON (
		IDPERSON NUMBER NOT NULL,
		FIRSTNAME VARCHAR2(20),
		LASTNAME VARCHAR2(20),
		BORNDATE null,
		TEAM VARCHAR2(20)
	);


CREATE TABLE COMPETITIONANDCOMPETITOR (
		ID NUMBER NOT NULL,
		COMPETITION NUMBER,
		COMPETITOR NUMBER
	);

CREATE UNIQUE INDEX COMPETITION_PK ON COMPETITION (IDCOMPETITION ASC);

CREATE UNIQUE INDEX COMPETITIONANDCOMPETITOR_PK ON COMPETITIONANDCOMPETITOR (ID ASC);

CREATE UNIQUE INDEX SYS_C00242576 ON PERSON (IDPERSON ASC);

CREATE UNIQUE INDEX PK_TEAM ON TEAM (IDTEAM ASC);

CREATE UNIQUE INDEX PK_COMPETITOR ON COMPETITOR (IDCOMPETITOR ASC);

CREATE UNIQUE INDEX PLAYER_PK ON PLAYER (IDPLAYER ASC);

CREATE UNIQUE INDEX BET_PK ON BET (IDBET ASC);

CREATE UNIQUE INDEX MANAGER_PK ON MANAGER (IDMANAGER ASC);

ALTER TABLE COMPETITIONANDCOMPETITOR ADD CONSTRAINT ID_PK PRIMARY KEY (ID);

ALTER TABLE BET ADD CONSTRAINT BET_PK PRIMARY KEY (IDBET);

ALTER TABLE COMPETITION ADD CONSTRAINT COMPETITION_PK PRIMARY KEY (IDCOMPETITION);

ALTER TABLE COMPETITOR ADD CONSTRAINT PK_COMPETITOR PRIMARY KEY (IDCOMPETITOR);

ALTER TABLE TEAM ADD CONSTRAINT PK_TEAM PRIMARY KEY (IDTEAM);

ALTER TABLE MANAGER ADD CONSTRAINT MANAGER_PK PRIMARY KEY (IDMANAGER);

ALTER TABLE PERSON ADD CONSTRAINT SYS_C00242576 PRIMARY KEY (IDPERSON);

ALTER TABLE PLAYER ADD CONSTRAINT PLAYER_PK PRIMARY KEY (IDPLAYER);

ALTER TABLE BET ADD CONSTRAINT COMPETION_FK FOREIGN KEY (COMPETITON)
	REFERENCES COMPETITION (IDCOMPETITION)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE BET ADD CONSTRAINT FK_COMPETITOR2 FOREIGN KEY (COMPETITOR2)
	REFERENCES COMPETITOR (IDCOMPETITOR)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE BET ADD CONSTRAINT FK_PLAYER FOREIGN KEY (PLAYER)
	REFERENCES PLAYER (IDPLAYER)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE BET ADD CONSTRAINT FK_COMPETITOR1 FOREIGN KEY (COMPETITOR1)
	REFERENCES COMPETITOR (IDCOMPETITOR)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE BET ADD CONSTRAINT FK_COMPETITOR3 FOREIGN KEY (COMPETITOR3)
	REFERENCES COMPETITOR (IDCOMPETITOR)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE COMPETITIONANDCOMPETITOR ADD CONSTRAINT COMPETITOR_FK FOREIGN KEY (COMPETITOR)
	REFERENCES COMPETITOR (IDCOMPETITOR)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE COMPETITOR ADD CONSTRAINT PERSON_FK FOREIGN KEY (PERSON)
	REFERENCES PERSON (IDPERSON)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE COMPETITOR ADD CONSTRAINT TEAM_FK FOREIGN KEY (TEAM)
	REFERENCES TEAM (IDTEAM)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE COMPETITIONANDCOMPETITOR ADD CONSTRAINT COMPETITION_FK FOREIGN KEY (COMPETITION)
	REFERENCES COMPETITION (IDCOMPETITION)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

