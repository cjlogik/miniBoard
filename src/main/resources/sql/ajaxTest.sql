DROP SEQUENCE minireply_seq;
DROP SEQUENCE miniboard_seq;
DROP TABLE minireply;
DROP TABLE miniboard;
DROP TABLE miniboardlist;
DROP TABLE minimember;

CREATE TABLE minimember (
	userid VARCHAR2(20) PRIMARY KEY,
	password VARCHAR2(20) NOT NULL,
	authority NUMBER DEFAULT 2,
	email VARCHAR2(100)
);

CREATE TABLE miniboardlist (
	boardid VARCHAR2(20) PRIMARY KEY,
	authority NUMBER DEFAULT 2
);

CREATE TABLE miniboard (
	boardnum NUMBER PRIMARY KEY,
	userid VARCHAR2(20) NOT NULL REFERENCES minimember(userid) ON DELETE CASCADE,
	boardid VARCHAR2(20) NOT NULL REFERENCES miniboardlist(boardid) ON DELETE CASCADE,
	title VARCHAR2(100) NOT NULL,
	content VARCHAR2(4000) NOT NULL,
	inputdate TIMESTAMP DEFAULT SYSTIMESTAMP,
	originalfilename VARCHAR2(50),
	savedfilename VARCHAR2(50),
	hits NUMBER DEFAULT 0,
	likes NUMBER DEFAULT 0,
	dislikes NUMBER DEFAULT 0
);

CREATE SEQUENCE miniboard_seq;

CREATE TABLE minireply (
	replynum NUMBER PRIMARY KEY,
	boardNum NUMBER NOT NULL REFERENCES miniboard(boardnum) ON DELETE CASCADE,
	userid VARCHAR2(20) NOT NULL REFERENCES minimember(userid) ON DELETE CASCADE,
	replytext VARCHAR(500) NOT NULL,
	inputDate TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE minireply_seq;

INSERT INTO	minimember VALUES ('Administrator', '12345678', 0, 'administrator@mini.com');
INSERT INTO	minimember VALUES ('Manager', '12345678',  1, 'manager@mini.com');
INSERT INTO	minimember VALUES ('miniuser', '12345678', 2, 'miniuser@mini.com');

INSERT INTO miniboardlist VALUES ('notice', '2');
INSERT INTO miniboardlist VALUES ('free', '1');
INSERT INTO miniboardlist VALUES ('secret', '0');

INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '1번 공지입니다', '1번 공지 내용입니다.', '19/11/08', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '2번 공지입니다', '2번 공지 내용입니다.', '19/11/09', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '3번 공지입니다', '3번 공지 내용입니다.', '19/11/10', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '4번 공지입니다', '4번 공지 내용입니다.', '19/11/11', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '5번 공지입니다', '5번 공지 내용입니다.', '19/11/12', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '6번 공지입니다', '6번 공지 내용입니다.', '19/11/13', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '7번 공지입니다', '7번 공지 내용입니다.', '19/11/14', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '8번 공지입니다', '8번 공지 내용입니다.', '19/11/15', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '9번 공지입니다', '9번 공지 내용입니다.', '19/11/16', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '10번 공지입니다', '10번 공지 내용입니다.', '19/11/17', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '11번 공지입니다', '11번 공지 내용입니다.', '19/11/18', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '12번 공지입니다', '12번 공지 내용입니다.', '19/11/19', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '13번 공지입니다', '13번 공지 내용입니다.', '19/11/20', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '14번 공지입니다', '14번 공지 내용입니다.', '19/11/21', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '15번 공지입니다', '15번 공지 내용입니다.', '19/11/22', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '16번 공지입니다', '16번 공지 내용입니다.', '19/11/23', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '17번 공지입니다', '17번 공지 내용입니다.', '19/11/24', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '18번 공지입니다', '18번 공지 내용입니다.', '19/11/25', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '19번 공지입니다', '19번 공지 내용입니다.', '19/11/26', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '20번 공지입니다', '20번 공지 내용입니다.', '19/11/27', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '21번 공지입니다', '21번 공지 내용입니다.', '19/11/28', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '22번 공지입니다', '22번 공지 내용입니다.', '19/11/29', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '23번 공지입니다', '23번 공지 내용입니다.', '19/11/30', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '24번 공지입니다', '24번 공지 내용입니다.', '19/12/01', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '25번 공지입니다', '25번 공지 내용입니다.', '19/12/02', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '26번 공지입니다', '26번 공지 내용입니다.', '19/12/03', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '27번 공지입니다', '27번 공지 내용입니다.', '19/12/04', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '28번 공지입니다', '28번 공지 내용입니다.', '19/12/05', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '29번 공지입니다', '29번 공지 내용입니다.', '19/12/06', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '30번 공지입니다', '30번 공지 내용입니다.', '19/12/07', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '31번 공지입니다', '31번 공지 내용입니다.', '19/12/08', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '32번 공지입니다', '32번 공지 내용입니다.', '19/12/09', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '33번 공지입니다', '33번 공지 내용입니다.', '19/12/10', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '34번 공지입니다', '34번 공지 내용입니다.', '19/12/11', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '35번 공지입니다', '35번 공지 내용입니다.', '19/12/12', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '36번 공지입니다', '36번 공지 내용입니다.', '19/12/13', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '37번 공지입니다', '37번 공지 내용입니다.', '19/12/14', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '38번 공지입니다', '38번 공지 내용입니다.', '19/12/15', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '39번 공지입니다', '39번 공지 내용입니다.', '19/12/16', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '40번 공지입니다', '40번 공지 내용입니다.', '19/12/17', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '41번 공지입니다', '41번 공지 내용입니다.', '19/12/18', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '42번 공지입니다', '42번 공지 내용입니다.', '19/12/19', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '43번 공지입니다', '43번 공지 내용입니다.', '19/12/20', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '44번 공지입니다', '44번 공지 내용입니다.', '19/12/21', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '45번 공지입니다', '45번 공지 내용입니다.', '19/12/22', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '46번 공지입니다', '46번 공지 내용입니다.', '19/12/23', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '47번 공지입니다', '47번 공지 내용입니다.', '19/12/24', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '48번 공지입니다', '48번 공지 내용입니다.', '19/12/25', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '49번 공지입니다', '49번 공지 내용입니다.', '19/12/26', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '50번 공지입니다', '50번 공지 내용입니다.', '19/12/27', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '51번 공지입니다', '51번 공지 내용입니다.', '19/12/28', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '52번 공지입니다', '52번 공지 내용입니다.', '19/12/29', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '53번 공지입니다', '53번 공지 내용입니다.', '19/12/30', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '54번 공지입니다', '54번 공지 내용입니다.', '19/12/31', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '55번 공지입니다', '55번 공지 내용입니다.', '20/01/01', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '56번 공지입니다', '56번 공지 내용입니다.', '20/01/02', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '57번 공지입니다', '57번 공지 내용입니다.', '20/01/03', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '58번 공지입니다', '58번 공지 내용입니다.', '20/01/04', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '59번 공지입니다', '59번 공지 내용입니다.', '20/01/05', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '60번 공지입니다', '60번 공지 내용입니다.', '20/01/06', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '61번 공지입니다', '61번 공지 내용입니다.', '20/01/07', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '62번 공지입니다', '62번 공지 내용입니다.', '20/01/08', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '63번 공지입니다', '63번 공지 내용입니다.', '20/01/09', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '64번 공지입니다', '64번 공지 내용입니다.', '20/01/10', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '65번 공지입니다', '65번 공지 내용입니다.', '20/01/11', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '66번 공지입니다', '66번 공지 내용입니다.', '20/01/12', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '67번 공지입니다', '67번 공지 내용입니다.', '20/01/13', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '68번 공지입니다', '68번 공지 내용입니다.', '20/01/14', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '69번 공지입니다', '69번 공지 내용입니다.', '20/01/15', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '70번 공지입니다', '70번 공지 내용입니다.', '20/01/16', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '71번 공지입니다', '71번 공지 내용입니다.', '20/01/17', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '72번 공지입니다', '72번 공지 내용입니다.', '20/01/18', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '73번 공지입니다', '73번 공지 내용입니다.', '20/01/19', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '74번 공지입니다', '74번 공지 내용입니다.', '20/01/20', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '75번 공지입니다', '75번 공지 내용입니다.', '20/01/21', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '76번 공지입니다', '76번 공지 내용입니다.', '20/01/22', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '77번 공지입니다', '77번 공지 내용입니다.', '20/01/23', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '78번 공지입니다', '78번 공지 내용입니다.', '20/01/24', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '79번 공지입니다', '79번 공지 내용입니다.', '20/01/25', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '80번 공지입니다', '80번 공지 내용입니다.', '20/01/26', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '81번 공지입니다', '81번 공지 내용입니다.', '20/01/27', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '82번 공지입니다', '82번 공지 내용입니다.', '20/01/28', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '83번 공지입니다', '83번 공지 내용입니다.', '20/01/29', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '84번 공지입니다', '84번 공지 내용입니다.', '20/01/30', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '85번 공지입니다', '85번 공지 내용입니다.', '20/01/31', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '86번 공지입니다', '86번 공지 내용입니다.', '20/02/01', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '87번 공지입니다', '87번 공지 내용입니다.', '20/02/02', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '88번 공지입니다', '88번 공지 내용입니다.', '20/02/03', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '89번 공지입니다', '89번 공지 내용입니다.', '20/02/04', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '90번 공지입니다', '90번 공지 내용입니다.', '20/02/05', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '91번 공지입니다', '91번 공지 내용입니다.', '20/02/06', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '92번 공지입니다', '92번 공지 내용입니다.', '20/02/07', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '93번 공지입니다', '93번 공지 내용입니다.', '20/02/08', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '94번 공지입니다', '94번 공지 내용입니다.', '20/02/09', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '95번 공지입니다', '95번 공지 내용입니다.', '20/02/10', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '96번 공지입니다', '96번 공지 내용입니다.', '20/02/11', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '97번 공지입니다', '97번 공지 내용입니다.', '20/02/12', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '98번 공지입니다', '98번 공지 내용입니다.', '20/02/13', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '99번 공지입니다', '99번 공지 내용입니다.', '20/02/14', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '100번 공지입니다', '100번 공지 내용입니다.', '20/02/15', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '101번 공지입니다', '101번 공지 내용입니다.', '20/02/16', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '102번 공지입니다', '102번 공지 내용입니다.', '20/02/17', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '103번 공지입니다', '103번 공지 내용입니다.', '20/02/18', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '104번 공지입니다', '104번 공지 내용입니다.', '20/02/19', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '105번 공지입니다', '105번 공지 내용입니다.', '20/02/20', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '106번 공지입니다', '106번 공지 내용입니다.', '20/02/21', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '107번 공지입니다', '107번 공지 내용입니다.', '20/02/22', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '108번 공지입니다', '108번 공지 내용입니다.', '20/02/23', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '109번 공지입니다', '109번 공지 내용입니다.', '20/02/24', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '110번 공지입니다', '110번 공지 내용입니다.', '20/02/25', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '111번 공지입니다', '111번 공지 내용입니다.', '20/02/26', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '112번 공지입니다', '112번 공지 내용입니다.', '20/02/27', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '113번 공지입니다', '113번 공지 내용입니다.', '20/02/28', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '114번 공지입니다', '114번 공지 내용입니다.', '20/02/29', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '115번 공지입니다', '115번 공지 내용입니다.', '20/03/01', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '116번 공지입니다', '116번 공지 내용입니다.', '20/03/02', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '117번 공지입니다', '117번 공지 내용입니다.', '20/03/03', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '118번 공지입니다', '118번 공지 내용입니다.', '20/03/04', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '119번 공지입니다', '119번 공지 내용입니다.', '20/03/05', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '120번 공지입니다', '120번 공지 내용입니다.', '20/03/06', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '121번 공지입니다', '121번 공지 내용입니다.', '20/03/07', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '122번 공지입니다', '122번 공지 내용입니다.', '20/03/08', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '123번 공지입니다', '123번 공지 내용입니다.', '20/03/09', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '124번 공지입니다', '124번 공지 내용입니다.', '20/03/10', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO miniboard VALUES (miniboard_seq.NEXTVAL, 'Administrator', 'notice', '125번 공지입니다', '125번 공지 내용입니다.', '20/03/11', NULL, NULL, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO	minireply VALUES (reply_seq.NEXTVAL, 125, 'Manager', '1번 댓글입니다', DEFAULT);
INSERT INTO	minireply VALUES (reply_seq.NEXTVAL, 125, 'Administrator', '2번 댓글입니다', DEFAULT);
INSERT INTO	minireply VALUES (reply_seq.NEXTVAL, 125, 'Manager', '3번 댓글입니다', DEFAULT);
INSERT INTO	minireply VALUES (reply_seq.NEXTVAL, 125, 'miniuser', '4번 댓글입니다', DEFAULT);
INSERT INTO	minireply VALUES (reply_seq.NEXTVAL, 125, 'Manager', '5번 댓글입니다', DEFAULT);

COMMIT;