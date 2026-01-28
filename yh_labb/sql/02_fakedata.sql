-- 1. STÄDER
INSERT INTO "City" (city_name) VALUES 
('Göteborg'), 
('Stockholm'), 
('Narnia');

-- 2. KONSULTINFO
INSERT INTO "Consultant_info" (hour_fee) VALUES 
(1337.00), 
(9000.00), 
(42.00);

-- 3. ADRESSER (33 rader)
INSERT INTO "Address" (address, zip_code, city_id) VALUES 
('Vasagatan 1', '41108', 1), ('Sveavägen 10', '11157', 2), ('Cyberdyne HQ', '99999', 2),
('The Wardrobe 1', '10101', 3), ('Hogwarts Express', '00975', 3), ('Wayne Manor 1', '54321', 2),
('Avenyn 1', '41136', 1), ('Drottninggatan 5', '11151', 2),
('Privet Drive 4', '11111', 1), ('Granger-huset 2', '11112', 1), ('The Burrow 1', '11113', 1), ('Lovegood-tornet 1', '11114', 1), ('Malfoy Manor', '11115', 1),
('Gotham Square 1', '22211', 2), ('Robin-nästat 2', '22212', 2), ('Ha-Ha-Street 0', '22213', 2), ('Ash-gränd 1', '22214', 2), ('Mushroom Kingdom 1', '22215', 2),
('Mushroom Kingdom 2', '22216', 2), ('Dagobah-träsket 1', '33311', 3), ('Tatooine Farm', '33312', 3), ('Alderaan Palace', '33313', 3), ('Bag End 1', '33314', 3),
('Isengard Tower', '33315', 3), ('The Shire 2', '33316', 3), ('Gollum Cave', '33317', 3), ('Arendelle Castle', '33318', 3), ('Snowman Hill 1', '33319', 3),
('Pride Rock 1', '44411', 3), ('Pride Rock 2', '44412', 3), ('Pride Rock 3', '44413', 3), ('Hakuna Matata', '44414', 3), ('Elephant Graveyard', '44415', 3);

-- 4. SKOLOR & KONSULTBOLAG
INSERT INTO "School" (name, address_id) VALUES 
('YH Akademin Göteborg', 1), 
('YH Akademin Stockholm', 2);

INSERT INTO "ConsultingCo" (name, organization_number, f_tax, address_id) VALUES 
('Vandelay Ind', '1234567890', true, 3);

-- 5. PERSONAL
INSERT INTO "Staff" (first_name, last_name, role, address_id) VALUES 
('Albus', 'Dumbledore', 'Utbildningsledare', 4), 
('Bruce', 'Wayne', 'Utbildare', 6), 
('Severus', 'Snape', 'Utbildningsledare', 5);

INSERT INTO "Salary" (staff_id, monthly_salary) VALUES 
(1, 55000.00), (2, 48000.00), (3, 52000.00);

-- 6. KONSULTER
INSERT INTO "Consultant" (consultingco_id, first_name, last_name, role, address_id, consultantinfo_id) VALUES 
(1, 'George', 'Costanza', 'Import Expert', 7, 1), 
(1, 'Sarah', 'Connor', 'Security', 8, 2);

-- 7. ROLLER & KURSER
INSERT INTO "EducationLeader" (staff_id) VALUES (1), (3);
INSERT INTO "Educator" (staff_id, consultant_id) VALUES (2, NULL), (NULL, 1), (NULL, 2);

INSERT INTO "Course" (course_code, name, points, description) VALUES 
('DB101', 'Databasmodellering', 25, 'Lär dig bygga robusta SQL-databaser.'),
('JS202', 'JavaScript Fullstack', 50, 'Webbutveckling från frontend till backend.'),
('PY303', 'Python for Data', 35, 'Dataanalys och automatisering med Python.'),
('SEC44', 'Cybersecurity', 40, 'Skydda system mot digitala hot.'),
('UX505', 'UX Design', 20, 'Användarvänliga gränssnitt och flöden.'),
('CLOUD', 'Cloud Architecture', 45, 'Drift och skalbarhet i molnet.');

-- 8. PROGRAM & KLASSER
INSERT INTO "Program" (program_code, name, description, school_id) VALUES 
('DE25G', 'Data Engineer', 'Hantering av data', 1), 
('FS25S', 'Fullstack Dev', 'Komplett webbutveckling', 2);

INSERT INTO "ProgramCourse" (program_id, course_id) VALUES (1,1), (1,3), (2,2), (2,5);

INSERT INTO "IndependentCourse" (ind_course_code, course_id, name, school_id) VALUES 
('IC10', 4, 'Cybersecurity Intro', 1), 
('IC20', 6, 'Cloud for Beginners', 2);

INSERT INTO "Class" (class_code, educatorlead_id, program_id, ind_course_id, class_start) VALUES 
('DE25G', 1, 1, NULL, '2025-08-01'), 
('FS25S', 2, 2, NULL, '2025-09-01'), 
('SEC25', 1, NULL, 1, '2025-10-15');

-- 9. STUDENTINFO & STUDENTER
INSERT INTO "StudentInfo" (phone_nr, social_security_nr, private_email) VALUES 
('555-01','198001010001','h@a.se'), ('555-02','198001010002','h@b.se'), ('555-03','198001010003','r@c.se'), ('555-04','198001010004','l@d.se'), ('555-05','198001010005','d@e.se'), ('555-06','198001010006','b@f.se'), ('555-07','198001010007','d@g.se'), ('555-08','198001010008','j@h.se'), ('555-09','198001010009','p@i.se'), ('555-10','198001010010','m@j.se'), ('555-11','198001010011','l@k.se'), ('555-12','198001010012','y@l.se'), ('555-13','198001010013','l@m.se'), ('555-14','198001010014','l@n.se'), ('555-15','198001010015','f@o.se'), ('555-16','198001010016','g@p.se'), ('555-17','198001010017','s@q.se'), ('555-18','198001010018','g@r.se'), ('555-19','198001010019','e@s.se'), ('555-20','198001010020','o@t.se'), ('555-21','198001010021','s@u.se'), ('555-22','198001010022','n@v.se'), ('555-23','198001010023','m@w.se'), ('555-24','198001010024','p@x.se'), ('555-25','198001010025','s@y.se');

INSERT INTO "Student" (class_id, first_name, last_name, address_id, email, student_info_id) VALUES 
(1,'Harry','Potter',9,'h.potter@yh.se',1), (1,'Hermione','Granger',10,'h.granger@yh.se',2), (1,'Ron','Weasley',11,'r.weasley@yh.se',3), (1,'Luna','Lovegood',12,'l.lovegood@yh.se',4), (1,'Draco','Malfoy',13,'d.malfoy@yh.se',5),
(2,'Batman','Wayne',14,'batman@yh.se',6), (2,'Robin','Wonder',15,'robin@yh.se',7), (2,'The','Joker',16,'joker@yh.se',8), (2,'Pikachu','Electric',17,'pika@yh.se',9), (2,'Mario','Bros',18,'mario@yh.se',10),
(2,'Luigi','Bros',19,'luigi@yh.se',11), (3,'Yoda','Master',20,'yoda@yh.se',12), (3,'Luke','Skywalker',21,'luke@yh.se',13), (3,'Leia','Organa',22,'leia@yh.se',14), (3,'Frodo','Baggins',23,'frodo@yh.se',15),
(1,'Gandalf','Grey',24,'gandalf@yh.se',16), (1,'Samwise','Gamgee',25,'sam@yh.se',17), (1,'Gollum','Smeagol',26,'gollum@yh.se',18), (2,'Elsa','Frozen',27,'elsa@yh.se',19), (2,'Olaf','Snowman',28,'olaf@yh.se',20),
(1,'Simba','King',29,'simba@yh.se',21), (1,'Nala','Queen',30,'nala@yh.se',22), (1,'Mufasa','Father',31,'mufasa@yh.se',23), (2,'Pumbaa','Boar',32,'pumbaa@yh.se',24), (2,'Scar','Uncle',33,'scar@yh.se',25);

-- 10. KOPPLING UTBILDARE-KURS
INSERT INTO "CourseEducator" (course_id, educator_id) VALUES (1, 1), (4, 1), (5, 2), (6, 3);