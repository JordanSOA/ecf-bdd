use `ecf`;

INSERT INTO technologies (code,name_en,name_fr) VALUES
('CD_001','EN_java','FR_java'),
('CD_002','EN_javascript','FR_javascript'),
('CD_003','EN_html','FR_html'),
('CD_004','EN_css','FR_css'),

INSERT INTO developers (registration_id,lastname,firstname,birthdate,hiring_date,favorite_tech_id) VALUES 
('dev_01',
'Jordan',
'Micheal',
TO_DATE('1975,02,25','YYYY,MM,DD'),
TO_DATE('2020,02,12','YYYY,MM,DD'),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 1)),
('dev_02',
'Bryant',
'Kobe',
TO_DATE('1965,09,23','YYYY,MM,DD'),
TO_DATE('2020,01,05','YYYY,MM,DD'),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 2)),
('dev_03',
'Iverson',
'Allen',
TO_DATE('1987,09,23','YYYY,MM,DD'),
TO_DATE('2020,06,22','YYYY,MM,DD'),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 3));


INSERT INTO developers_technologies (id_developer,id_technology,favorite_tech_id) 
VALUES
((SELECT de.id_developer FROM developers de WHERE de.id_developer = 1),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 1),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 3)),
((SELECT de.id_developer FROM developers de WHERE de.id_developer = 1),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 2),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 3)),
((SELECT de.id_developer FROM developers de WHERE de.id_developer = 2),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 1),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 2)),
((SELECT de.id_developer FROM developers de WHERE de.id_developer = 2),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 3),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 2)),
((SELECT de.id_developer FROM developers de WHERE de.id_developer = 2),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 4),
(SELECT te.id_technology FROM technologies te WHERE te.id_technology = 2));


