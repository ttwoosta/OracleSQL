

SELECT * 
  FROM user_sequences;

DROP SEQUENCE vstblActors_ActorID_seq;

DESC vstblActors;

SELECT *
  FROM vstblActors;
DELETE FROM vstblActors;

/**********************************/
/********** INSERT Actors *********/
/**********************************/

INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (1, 'Trevante', 'Rhodes', 
  TO_DATE('2/10/1990', 'MM/DD/YYYY'), 'Ponchatoula, Louisiana');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (2, 'Andre', 'Holland', 
  TO_DATE('12/28/1979', 'MM/DD/YYYY'), 'Bessemer, Alabama');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth)
  VALUES (3, 'Janelle', 'Monae', 
  TO_DATE('12/1/1985', 'MM/DD/YYYY'), 'Kansas City, Kansas');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (4, 'Asthton', 'Sanders', 
  TO_DATE('10/24/1995', 'MM/DD/YYYY'), 'Carson, CA');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (5, 'jharrel', 'Jerome', 
  TO_DATE('10/9/1997', 'MM/DD/YYYY'), 'The Bronx, NY');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth)
  VALUES (6, 'Naomie', 'Harris', 
  TO_DATE('9/6/1979', 'MM/DD/YYYY'), 'Islington, London');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth)
  VALUES (7, 'Mahershala', 'Ali',
  TO_DATE('2/16/1974', 'MM/DD/YYYY'), 'Oakland CA');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth)
  VALUES (8, 'Mark', 'Ruffalo', 
  TO_DATE('11/22/1967', 'MM/DD/YYYY'), 'Kenosha, WI');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (9, 'Brian', 'James', 
  TO_DATE('6/29/1968', 'MM/DD/YYYY'), 'Saginaw, MI');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (10, 'Michael', 'Keaton', 
  TO_DATE('9/5/1951', 'MM/DD/YYYY'), 'Coraopolis, PA');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (11, 'Rachel', 'McAdams', 
  TO_DATE('11/17/1978', 'MM/DD/YYYY'), 'London, Ontario');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (12, 'Live', 'Schreiber', 
  TO_DATE('10/4/1967', 'MM/DD/YYYY'), 'San Francisco, CA');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (13, 'John', 'Slattery', 
  TO_DATE('8/13/1962', 'MM/DD/YYYY'), 'Boston, MA');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (14, 'Micael', 'Keaton', 
  TO_DATE('9/5/1951', 'MM/DD/YYYY'), 'Coraopolis, PA');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (15, 'Zach', 'Galifianakis', 
  TO_DATE('10/1/1969', 'MM/DD/YYYY'), 'Wilkesboro, NC');
  
/**********************************/
/**** CREATE SEQUENCE for Actors table ***********/
/**********************************/

CREATE SEQUENCE vstblActors_ActorID_seq
  INCREMENT BY 1
  START WITH 16
  NOCACHE
  NOCYCLE;
  
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (vstblActors_ActorID_seq.NEXTVAL, 'Edward', 'Norton', 
  TO_DATE('8/18/1969', 'MM/DD/YYYY'), 'Boston, MA');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (vstblActors_ActorID_seq.NEXTVAL, 'Andrea', 'Riseborough', 
  TO_DATE('11/20/1981', 'MM/DD/YYYY'), 'Wallsend, Newcastle upon tyne');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (vstblActors_ActorID_seq.NEXTVAL, 'Amy', 'Ryan', 
  TO_DATE('11/30/1969', 'MM/DD/YYYY'), 'Flushing Queens, NY');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (vstblActors_ActorID_seq.NEXTVAL, 'Emma', 'Stone', 
  TO_DATE('11/6/1988', 'MM/DD/YYYY'), 'Scottsdale, AZ');
INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (vstblActors_ActorID_seq.NEXTVAL, 'Naomi', 'Watts',
  TO_DATE('9/28/1968', 'MM/DD/YYYY'), 'Shoreham, Kent England');

