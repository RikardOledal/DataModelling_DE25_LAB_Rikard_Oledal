-- 1. STÄDER & KONSULTINFO
INSERT INTO "City" (city_id, city_name) VALUES (1, 'Stockholm'), (2, 'Göteborg'), (3, 'Narnia');
INSERT INTO "Consultant_info" (consultantinfo_id, hour_fee) VALUES (1, 1337), (2, 9000), (3, 42);

-- 2. ADRESSER (En unik för varje entitet)
INSERT INTO "Address" (address_id, address, zip_code, city_id) VALUES 
-- Skolor och Företag (ID 1-3)
(1, 'Magi-gränd 1', '12345', 1), (2, 'Bat-grottan 1', '54321', 2), (3, 'Cyberdyne HQ', '99999', 2),
-- Personal & Konsulter (ID 4-8)
(4, 'The Wardrobe 1', '10101', 3), (5, 'Hogwarts Express vagn 1', '00975', 3), (6, 'Wayne Manor 1', '54321', 2),
(7, 'Importgatan 1', '41101', 1), (8, 'Motståndsvägen 9', '99999', 2),
-- Studenter Klass 1 (ID 9-13)
(9, 'Privet Drive 4', '11111', 1), (10, 'Granger-huset 2', '11112', 1), (11, 'The Burrow 1', '11113', 1), (12, 'Lovegood-tornet 1', '11114', 1), (13, 'Malfoy Manor', '11115', 1),
-- Studenter Klass 2 (ID 14-18)
(14, 'Gotham Square 1', '22211', 2), (15, 'Robin-nästat 2', '22212', 2), (16, 'Ha-Ha-Street 0', '22213', 2), (17, 'Ash-gränd 1', '22214', 2), (18, 'Mushroom Kingdom 1', '22215', 2),
-- Studenter Klass 3 (ID 19-23)
(19, 'Mushroom Kingdom 2', '22216', 2), (20, 'Dagobah-träsket 1', '33311', 3), (21, 'Tatooine Farm', '33312', 3), (22, 'Alderaan Palace', '33313', 3), (23, 'Bag End 1', '33314', 3),
-- Studenter Klass 4 (ID 24-28)
(24, 'Isengard Tower', '33315', 3), (25, 'The Shire 2', '33316', 3), (26, 'Gollum Cave', '33317', 3), (27, 'Arendelle Castle', '33318', 3), (28, 'Snowman Hill 1', '33319', 3),
-- Studenter Klass 5 (ID 29-33)
(29, 'Pride Rock 1', '44411', 3), (30, 'Pride Rock 2', '44412', 3), (31, 'Pride Rock 3', '44413', 3), (32, 'Hakuna Matata-djungeln', '44414', 3), (33, 'Elephant Graveyard', '44415', 3);

-- 3. SKOLOR & KONSULTBOLAG
INSERT INTO "School" (school_id, name, address_id) VALUES (1, 'Hogwarts Webb', 1), (2, 'Gotham Tech', 2);
INSERT INTO "ConsultingCo" (consultingco_id, name, organization_number, f_tax, address_id) VALUES (1, 'Vandelay Ind', '1234567890', true, 3);

-- 4. PERSONAL & KONSULTER
INSERT INTO "Staff" (staff_id, first_name, last_name, role, address_id) VALUES 
(1, 'Albus', 'Dumbledore', 'Utbildningsledare', 4), (2, 'Bruce', 'Wayne', 'Utbildare', 6), (3, 'Severus', 'Snape', 'Utbildningsledare', 5);
INSERT INTO "Consultant" (consultant_id, consultingco_id, first_name, last_name, role, address_id, consultantinfo_id) VALUES 
(1, 1, 'George', 'Costanza', 'Import Expert', 7, 1), (2, 1, 'Sarah', 'Connor', 'Security', 8, 2);

-- 5. ROLLER & KURSER & PROGRAM & KLASSER (Samma som innan)
INSERT INTO "EducationLeader" (educatorlead_id, staff_id) VALUES (1, 1), (2, 3);
INSERT INTO "Educator" (educator_id, staff_id, consultant_id) VALUES (1, 2, NULL), (2, NULL, 1), (3, NULL, 2);
INSERT INTO "Course" (course_id, course_code, name) VALUES (1, 'POTN1', 'Potion Making'), (2, 'DARK1', 'Defense Web'), (3, 'HERB1', 'Green-IT'), (4, 'BAT10', 'Batarang Eng'), (5, 'CRME1', 'SQL Crime'), (6, 'DET10', 'UX Det'), (7, 'JEDI1', 'Frontend Force'), (8, 'LIGHT', 'Debugging'), (9, 'MIND1', 'Business Mind'), (10, 'DISK1', 'Hob-matte'), (11, 'RING1', 'Kryptering'), (12, 'VOLC1', 'Mordor Cloud');
INSERT INTO "Program" (program_id, program_code, name, description, school_id) VALUES (1, 'HOG24', 'Trollkarl Fullstack', 'Magi-kod', 1), (2, 'GTM24', 'Crime Dev', 'Gotham Python', 2), (3, 'JED24', 'Jedi Cloud', 'Kraften', 2);
INSERT INTO "ProgramCourse" (programcourse_id, program_id, course_id) VALUES (1,1,1), (2,1,2), (3,1,3), (4,2,4), (5,2,5), (6,2,6), (7,3,7), (8,3,8), (9,3,9);
INSERT INTO "IndependentCourse" (ind_course_id, course_id, name, school_id) VALUES (1, 10, 'Hob-matte', 1), (2, 11, 'Kryptering', 2), (3, 12, 'Mordor Cloud', 2);
INSERT INTO "Class" (class_id, educatorlead_id, program_id, ind_course_id, class_start) VALUES (1, 1, 1, NULL, '2024-08-01'), (2, 2, 2, NULL, '2024-09-01'), (3, 2, 3, NULL, '2025-01-10'), (4, 1, NULL, 1, '2024-06-01'), (5, 2, NULL, 2, '2024-07-01'), (6, 1, NULL, 3, '2024-08-15');

-- 6. STUDENTINFO (25 ST)
INSERT INTO "StudentInfo" (student_info_id, phone_nr, social_security_nr, private_email) VALUES 
(1,'555-01','198001010001','h@a.se'), (2,'555-02','198001010002','h@b.se'), (3,'555-03','198001010003','r@c.se'), (4,'555-04','198001010004','l@d.se'), (5,'555-05','198001010005','d@e.se'), (6,'555-06','198001010006','b@f.se'), (7,'555-07','198001010007','d@g.se'), (8,'555-08','198001010008','j@h.se'), (9,'555-09','198001010009','p@i.se'), (10,'555-10','198001010010','m@j.se'), (11,'555-11','198001010011','l@k.se'), (12,'555-12','198001010012','y@l.se'), (13,'555-13','198001010013','l@m.se'), (14,'555-14','198001010014','l@n.se'), (15,'555-15','198001010015','f@o.se'), (16,'555-16','198001010016','g@p.se'), (17,'555-17','198001010017','s@q.se'), (18,'555-18','198001010018','g@r.se'), (19,'555-19','198001010019','e@s.se'), (20,'555-20','198001010020','o@t.se'), (21,'555-21','198001010021','s@u.se'), (22,'555-22','198001010022','n@v.se'), (23,'555-23','198001010023','m@w.se'), (24,'555-24','198001010024','p@x.se'), (25,'555-25','198001010025','s@y.se');

-- 7. STUDENTER (Kopplade till sina unika adresser 9-33)
INSERT INTO "Student" (student_id, class_id, first_name, last_name, address_id, email, student_info_id) VALUES 
(1,1,'Harry','Potter',9,'h.potter@yh.se',1), (2,1,'Hermione','Granger',10,'h.granger@yh.se',2), (3,1,'Ron','Weasley',11,'r.weasley@yh.se',3), (4,1,'Luna','Lovegood',12,'l.lovegood@yh.se',4), (5,1,'Draco','Malfoy',13,'d.malfoy@yh.se',5),
(6,2,'Batman','Wayne',14,'batman@yh.se',6), (7,2,'Robin','Wonder',15,'robin@yh.se',7), (8,2,'The','Joker',16,'joker@yh.se',8), (9,2,'Pikachu','Electric',17,'pika@yh.se',9), (10,2,'Mario','Bros',18,'mario@yh.se',10),
(11,3,'Luigi','Bros',19,'luigi@yh.se',11), (12,3,'Yoda','Master',20,'yoda@yh.se',12), (13,3,'Luke','Skywalker',21,'luke@yh.se',13), (14,3,'Leia','Organa',22,'leia@yh.se',14), (15,3,'Frodo','Baggins',23,'frodo@yh.se',15),
(16,4,'Gandalf','Grey',24,'gandalf@yh.se',16), (17,4,'Samwise','Gamgee',25,'sam@yh.se',17), (18,4,'Gollum','Smeagol',26,'gollum@yh.se',18), (19,4,'Elsa','Frozen',27,'elsa@yh.se',19), (20,4,'Olaf','Snowman',28,'olaf@yh.se',20),
(21,5,'Simba','King',29,'simba@yh.se',21), (22,5,'Nala','Queen',30,'nala@yh.se',22), (23,5,'Mufasa','Father',31,'mufasa@yh.se',23), (24,5,'Pumbaa','Boar',32,'pumbaa@yh.se',24), (25,5,'Scar','Uncle',33,'scar@yh.se',25);

-- 8. KOPPLING UTBILDARE-KURS
INSERT INTO "CourseEducator" (courseeducator_id, course_id, educator_id) VALUES (1, 1, 1), (2, 4, 1), (3, 5, 2), (4, 7, 3);