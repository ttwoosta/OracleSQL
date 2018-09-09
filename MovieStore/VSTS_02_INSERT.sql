

SELECT * 
  FROM user_sequences;

DROP SEQUENCE vstblActors_ActorID_seq;

DESC vstblActors;

SELECT *
  FROM vstblActors;
  
DELETE FROM vstblActors;

/**********************************/
/********** INSERT Distributors *********/
/**********************************/

INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) 
  VALUES (1, 'Trevante', 'Rhodes', 
  TO_DATE('2/10/1990', 'MM/DD/YYYY'), 'Ponchatoula, Louisiana');

INSERT INTO vstblDistributors(DistributorID, DistributorName)
  VALUES (1, 'A24');
INSERT INTO vstblDistributors(DistributorID, DistributorName)
  VALUES (2, 'Open Road Films');
INSERT INTO vstblDistributors(DistributorID, DistributorName)
  VALUES (3, 'Fox Searchlight Pictures');
INSERT INTO vstblDistributors(DistributorID, DistributorName)
  VALUES (4, 'Momentum Pictures');
INSERT INTO vstblDistributors(DistributorID, DistributorName)
  VALUES (5, 'Summit Entertainment');
INSERT INTO vstblDistributors(DistributorID, DistributorName)
  VALUES (6, 'Warner Bros. Pictures');
  
/**********************************/
/********** INSERT Movies *********/
/**********************************/

INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)
  VALUES (3,'Moonlight', TO_DATE('10/21/2016', 'MM/DD/YYYY'), 6);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (4,'Spotlight', TO_DATE('11/6/2015', 'MM/DD/YYYY'), 3);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (5,'Birdman', TO_DATE('10/17/2014', 'MM/DD/YYYY'), 4);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (6,'12 Years a Slave', TO_DATE('8/30/2013', 'MM/DD/YYYY'), 5);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (7,'Argo', TO_DATE('8/31/2012', 'MM/DD/YYYY'), 1);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (8,'The Artist', TO_DATE('5/15/2011', 'MM/DD/YYYY'), 4);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)
  VALUES (9,'The King''s Speech', TO_DATE('9/6/2010', 'MM/DD/YYYY'), 3);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (10,'LaLa Land', TO_DATE('8/16/2016', 'MM/DD/YYYY'), 2);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (11,'Hacksaw Ridge', TO_DATE('9/4/2016', 'MM/DD/YYYY'), 4);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (12,'Mad Max: Fury Road', TO_DATE('5/7/2015', 'MM/DD/YYYY'), 4);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (13,'The Revenant', TO_DATE('12/16/2015', 'MM/DD/YYYY'), 2);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (14,'The Grand Budapest Hotel', TO_DATE('2/6/2014', 'MM/DD/YYYY'), 2);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (15,'Whiplash', TO_DATE('1/16/2014', 'MM/DD/YYYY'), 5);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (16,'Gravity', TO_DATE('10/4/2013', 'MM/DD/YYYY'), 5);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (17,'Dallas Buyers Club', TO_DATE('11/1/2013', 'MM/DD/YYYY'), 4);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (18,'Life of Pi', TO_DATE('11/21/2012', 'MM/DD/YYYY'), 6);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (19,'Les Miserables', TO_DATE('12/25/2012', 'MM/DD/YYYY'), 6);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (20,'Manchester by the Sea', TO_DATE('11/18/2016', 'MM/DD/YYYY'), 2);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (21,'Arrival', TO_DATE('11/11/2016', 'MM/DD/YYYY'), 5);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (22,'Fences', TO_DATE('12/16/2016', 'MM/DD/YYYY'), 6);
INSERT INTO vstblMovies(MovieID, MovieName, MovieReleaseDate, DistributorID)  
  VALUES (23,'Fantastic Beasts and Where to Find Them', TO_DATE('11/18/2016', 'MM/DD/YYYY'), 2);

/**********************************/
/********** INSERT MediumTypes *********/
/**********************************/

INSERT INTO vstblMediumTypes(MediumTypeCode, MediumDescription)
  VALUES ('VHS', 'Video Home System');
INSERT INTO vstblMediumTypes(MediumTypeCode, MediumDescription)
  VALUES ('DVD', 'Digital Video Disc');
INSERT INTO vstblMediumTypes(MediumTypeCode, MediumDescription)
  VALUES ('BLU', 'Digital Optical Disc');

/**********************************/
/********** INSERT Boxes *********/
/**********************************/

 
SELECT *
  FROM vstblBoxes
  WHERE movieID = 3;

DELETE FROM vstblBoxes;

INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (1, 16, 'BLU', TO_DATE('4/6/2016', 'MM/DD/YYYY'), 39);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (2, 4, 'DVD', TO_DATE('9/7/2016', 'MM/DD/YYYY'), 10);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (3, 4, 'BLU', TO_DATE('6/1/2017', 'MM/DD/YYYY'), 48);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (4, 16, 'BLU', TO_DATE('2/6/2017', 'MM/DD/YYYY'), 83);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (5, 4, 'DVD', TO_DATE('11/30/2016', 'MM/DD/YYYY'), 19);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (6, 15, 'VHS', TO_DATE('10/1/2015', 'MM/DD/YYYY'), 26);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (7, 16, 'VHS', TO_DATE('10/17/2016', 'MM/DD/YYYY'), 46);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (8, 5, 'VHS', TO_DATE('5/18/2016', 'MM/DD/YYYY'), 37);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (9, 9, 'DVD', TO_DATE('3/17/2015', 'MM/DD/YYYY'), 6);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (10, 19, 'BLU', TO_DATE('10/13/2015', 'MM/DD/YYYY'), 84);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (11, 6, 'VHS', TO_DATE('5/1/2015', 'MM/DD/YYYY'), 70);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (12, 3, 'VHS', TO_DATE('7/12/2017', 'MM/DD/YYYY'), 30);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (13, 6, 'BLU', TO_DATE('5/12/2015', 'MM/DD/YYYY'), 31);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (14, 9, 'BLU', TO_DATE('12/13/2016', 'MM/DD/YYYY'), 66);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (15, 11, 'VHS', TO_DATE('6/23/2015', 'MM/DD/YYYY'), 59);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (16, 6, 'BLU', TO_DATE('5/9/2017', 'MM/DD/YYYY'), 90);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (17, 6, 'BLU', TO_DATE('8/18/2017', 'MM/DD/YYYY'), 77);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (18, 11, 'BLU', TO_DATE('7/3/2016', 'MM/DD/YYYY'), 86);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (19, 2, 'DVD', TO_DATE('5/15/2015', 'MM/DD/YYYY'), 70);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (20, 20, 'DVD', TO_DATE('2/19/2017', 'MM/DD/YYYY'), 54);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (21, 6, 'VHS', TO_DATE('7/13/2016', 'MM/DD/YYYY'), 16);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (22, 16, 'VHS', TO_DATE('4/2/2016', 'MM/DD/YYYY'), 41);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (23, 11, 'DVD', TO_DATE('10/28/2016', 'MM/DD/YYYY'), 33);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (24, 9, 'BLU', TO_DATE('3/2/2015', 'MM/DD/YYYY'), 17);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (25, 20, 'DVD', TO_DATE('1/24/2015', 'MM/DD/YYYY'), 69);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (26, 10, 'VHS', TO_DATE('12/28/2016', 'MM/DD/YYYY'), 61);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (27, 1, 'DVD', TO_DATE('12/1/2017', 'MM/DD/YYYY'), 97);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (28, 6, 'DVD', TO_DATE('1/2/2016', 'MM/DD/YYYY'), 81);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (29, 7, 'DVD', TO_DATE('6/23/2017', 'MM/DD/YYYY'), 52);
INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
  VALUES (30, 2, 'DVD', TO_DATE('7/23/2016', 'MM/DD/YYYY'), 58);







