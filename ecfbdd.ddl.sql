CREATE TABLE technologies
(
    id_technology SERIAL NOT NULL,
    code VARCHAR(255) NOT NULL,
    name_en VARCHAR(50) NOT NULL,
    name_fr VARCHAR(50) NOT NULL,
    CONSTRAINT technology_pkey PRIMARY KEY (id_technology),
    CONSTRAINT code_tech_unique UNIQUE (code),
    CONSTRAINT name_en_unique UNIQUE (name_en),
    CONSTRAINT name_fr_unique UNIQUE (name_fr)
);

CREATE TABLE developers
(
    id_developer SERIAL NOT NULL,
    registration_id VARCHAR(6) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    birthdate Date NOT NULL,
    hiring_date Date NOT NULL,
    favorite_tech_id SERIAL NOT NULL,
    CONSTRAINT developer_pkey PRIMARY KEY (id_developer),
    FOREIGN KEY (favorite_tech_id) REFERENCES technologies (id_technology),
    CONSTRAINT registration_id_unique UNIQUE (registration_id),
    CONSTRAINT favorite_tech_id_unique UNIQUE (favorite_tech_id)
);
CREATE INDEX favorite_tech_id_index ON developers (favorite_tech_id);
CREATE INDEX birthdate_index ON developers (birthdate DESC);
CREATE INDEX hiring_date_index ON developers (hiring_date DESC);

CREATE TABLE Developers_Technologies
(
    id_developer SERIAL,
    id_technology SERIAL,
    favorite_tech_id SERIAL CONSTRAINT favorite_tech_not_same CHECK (id_technology != favorite_tech_id),
    CONSTRAINT developers_technologies_pkey PRIMARY KEY (id_developer,id_technology),
    FOREIGN KEY (id_developer) REFERENCES developers (id_developer),
    FOREIGN KEY (favorite_tech_id) REFERENCES developers (favorite_tech_id),
    FOREIGN KEY (id_technology) REFERENCES technologies (id_technology)
);

