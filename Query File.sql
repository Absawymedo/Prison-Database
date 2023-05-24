CREATE TABLE CellBlock (
  CBname VARCHAR(50) PRIMARY KEY,
  CBType VARCHAR(50),
  NoCells INT,
  NoCams INT
);

CREATE TABLE Cell (
  CID INT PRIMARY KEY,
  CBname VARCHAR(50),
  CellStatus VARCHAR(50),
  NoInmate INT,
  MaxCap INT,
  FOREIGN KEY (CBname) REFERENCES CellBlock(CBname)
);

CREATE TABLE Inmates (
  PFirst VARCHAR(50),
  PLast VARCHAR(50),
  PID INT PRIMARY KEY,
  Gender CHAR,
  PSentence INT,
  PGang VARCHAR(50),
  PConduct VARCHAR(50),
  Parole VARCHAR(3) NOT NULL,
  CID INT NOT NULL,
  FOREIGN KEY (CID) REFERENCES Cell(CID)
);

CREATE TABLE Guards (
  GFirst VARCHAR(50),
  GLast VARCHAR(50),
  GID INT PRIMARY KEY,
  GType VARCHAR(50),
  Clearance INT NULL,
  Warden BIT NOT NULL
);

CREATE TABLE Shifts (
  Day VARCHAR(50),
  Time_ VARCHAR(50),
  GID INT,
  CBname VARCHAR(50),
  PRIMARY KEY(Day,Time_,GID,CBname),
  FOREIGN KEY (CBname) REFERENCES CellBlock(CBname),
  FOREIGN KEY (GID) REFERENCES Guards(GID)
);

INSERT INTO CellBlock (CBname, CBType, NoCells, NoCams)
VALUES ('CB_A', 'Normal_M', 1000, 500);
INSERT INTO CellBlock (CBname, CBType, NoCells, NoCams)
VALUES ('CB_B', 'Normal_M', 1000, 500);
INSERT INTO CellBlock (CBname, CBType, NoCells, NoCams)
VALUES ('CB_C', 'Normal_F', 1000, 500);
INSERT INTO CellBlock (CBname, CBType, NoCells, NoCams)
VALUES ('CB_SA', 'Solitary_M', 100, 750);
INSERT INTO CellBlock (CBname, CBType, NoCells, NoCams)
VALUES ('CB_SB', 'Solitary_M', 100, 750);
INSERT INTO CellBlock (CBname, CBType, NoCells, NoCams)
VALUES ('CB_SC', 'Solitary_F', 100, 750);


INSERT INTO Cell (CBname, CellStatus, NoInmate, MaxCap)
VALUES ('CB_A', 'Empty', 0, 2);
INSERT INTO Cell (CBname, CellStatus, NoInmate, MaxCap)
VALUES ('CB_B', 'Occupied', 2, 4);
INSERT INTO Cell (CBname, CellStatus, NoInmate, MaxCap)
VALUES ('CB_C', 'Maintenance', 0, 3);
INSERT INTO Cell (CBname, CellStatus, NoInmate, MaxCap)
VALUES ('CB_SA', 'Full', 1, 1);
INSERT INTO Cell (CBname, CellStatus, NoInmate, MaxCap)
VALUES ('CB_SB', 'Full', 1, 1);
INSERT INTO Cell (CBname, CellStatus, NoInmate, MaxCap)
VALUES ('CB_SA', 'Empty', 0, 1);

INSERT INTO Inmates (PFirst, PLast, Gender, PSentence, PGang, PConduct, Parole, CID)
VALUES ('Mostafa', 'Mohamed', 'M', 'Death Sentence', 'Cartel', 'Bad', 'No', 10000);
INSERT INTO Inmates (PFirst, PLast, Gender, PSentence, PGang, PConduct, Parole, CID)
VALUES ('Khaled', 'Hany','M', '10', 'Cartel', 'Good', 'No', 10001);
INSERT INTO Inmates (PFirst, PLast, Gender, PSentence, PGang, PConduct, Parole, CID)
VALUES ('Mariam', 'Samy', 'F', 3, NULL, 'Good', 'Yes', 10002);
INSERT INTO Inmates (PFirst, PLast, Gender, PSentence, PGang, PConduct, Parole, CID)
VALUES ('Samar', 'Ahmed', 'F', '30 Years', NULL, 'Bad', 'No', 10003);
INSERT INTO Inmates (PFirst, PLast, Gender, PSentence, PGang, PConduct, Parole, CID) 
VALUES ('Ali', 'Ahmed','M', 'Death Sentence', 'Mafia', 'Good', 'No', 10004);
INSERT INTO Inmates (PFirst, PLast, Gender, PSentence, PGang, PConduct, Parole, CID)
VALUES ('Hossam', 'Ashraf', 'M', 'Death Sentence', 'Irish Mob', 'Bad', 'No', 10005);

INSERT INTO Guards (GFirst, GLast, GType, Clearance, Warden)
VALUES ('Mohamed', 'Ahmed', 'Warden', 0, 1);
INSERT INTO Guards (GFirst, GLast, GType, Clearance, Warden)
VALUES ('John', 'Smith', 'Riot Unit', 1, 0);
INSERT INTO Guards (GFirst, GLast, GType, Clearance, Warden)
VALUES ('Hany', 'Hassanen', 'Watch Tower', 2, 0);
INSERT INTO Guards (GFirst, GLast, GType, Clearance, Warden)
VALUES ('Adel', 'Mohamed', 'CCTV Operator', 3, 0);
INSERT INTO Guards (GFirst, GLast, GType, Clearance, Warden)
VALUES ('Mark', 'Alaa', 'Security Officer', 4, 0);
INSERT INTO Guards (GFirst, GLast, GType, Clearance, Warden)
VALUES ('George', 'Washington', 'Security Officer', 4, 0);

INSERT INTO Shifts (Day, Time_, GID, CBname)
VALUES ('Wednesday', 'Day', 100, 'CB_A');
INSERT INTO Shifts (Day, Time_, GID, CBname)
VALUES ('Wednesday', 'Night', 101, 'CB_A');
INSERT INTO Shifts (Day, Time_, GID, CBname)
VALUES ('Tuesday', 'Day', 102, 'CB_A');
INSERT INTO Shifts (Day, Time_, GID, CBname)
VALUES ('Sunday', 'Night', 103, 'CB_B');
INSERT INTO Shifts (Day, Time_, GID, CBname)
VALUES ('Friday', 'Day', 104, 'CB_SC');
INSERT INTO Shifts (Day, Time_, GID, CBname)
VALUES ('Monday', 'Night', 105, 'CB_SB');

SELECT * FROM Inmates WHERE  PSentence > 25;

SELECT * FROM Guards WHERE Clearance > 3;

SELECT Inmates.*
FROM Inmates
INNER JOIN Cell ON Inmates.CID = Cell.CID
WHERE Cell. CBname = 'CB_A';


SELECT Guards.*
FROM Guards
INNER JOIN Shifts ON Guards.GID = Shifts.GID
WHERE Shifts.CBname = 'CB_D';

SELECT CBname, COUNT(*) AS num_shifts
FROM Shifts
GROUP BY CBname; 

SELECT COUNT(*) AS NoCells
FROM Cell
WHERE CBname = 'CB_A';

SELECT * FROM Guards WHERE GType = 'Security officer';

SELECT Shifts.CBname, Count(*) AS NoGuards
From Guards
JOIN Shifts ON Guards.GID = Shifts.GID
GROUP BY(Shifts.CBname);

SELECT Cell.CBname, Cell.CID, COUNT(*) AS NoInmates
FROM Inmates
JOIN Cell ON Inmates.CID = Cell.CID
GROUP BY Cell.CBname, Cell.CID;

SELECT CID FROM Cell WHERE CBname = 'CB_A' OR MaxCap = 3;

SELECT Cell.CID
FROM Cell
LEFT JOIN Inmates ON Cell.CID = Inmates.CID
WHERE Inmates.CID IS NULL;

UPDATE Guards SET GType = 'Warden'
WHERE GType = 'Security officer' AND Clearance = 0
AND NOT EXISTS (SELECT 1 FROM Guards WHERE type = 'Warden');

SELECT *FROM Inmates 
WHERE PID > 
(Select AVG(PID) FROM Inmates WHERE Gender = 'M' and PConduct = 'Good');

SELECT *FROM CellBlock WHERE NoCams > (Select AVG(NoCams) FROM CellBlock);