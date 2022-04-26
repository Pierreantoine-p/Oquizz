CREATE TABLE IF NOT EXISTS user(
  id INT SERIAL PRIMARY KEY,
  mail VARCHAR(255) UNIQUE NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  password VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  id_role INT FOREIGN KEY
);

CREATE TABLE role IF NOT EXISTS(
  id INT SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE quizz (
  id INT SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  author VARCHAR(255),
  id_user INT FOREIGN KEY
);

CREATE TABLE category (
  id INT SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE answer (
  id INT SERIAL PRIMARY KEY,
  description VARCHAR(255),
  id_question INT FOREIGN KEY
);

CREATE TABLE question (
  id INT SERIAL PRIMARY KEY,
  description TEXT,
  anecdote VARCHAR(255),
  wiki VARCHAR(255),
  id_category INT FOREIGN KEY,
  id_quizz INT FOREIGN KEY,
  id_answer INT FOREIGN KEY,
  id_level INT FOREIGN KEY
);

CREATE TABLE IF NOT EXISTS "level" (
  id INT SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

ALTER TABLE user ADD FOREIGN KEY (id_role) REFERENCES role(id);
ALTER TABLE quizz ADD FOREIGN KEY (id_user) REFERENCES user(id);
ALTER TABLE ANSWER ADD FOREIGN KEY (id_question) REFERENCES question(id);
ALTER TABLE question ADD FOREIGN KEY (id_level) REFERENCES level(id);
ALTER TABLE question ADD FOREIGN KEY (id_answer) REFERENCES answer(id);
ALTER TABLE question ADD FOREIGN KEY (id_quizz) REFERENCES quizz(id);
ALTER TABLE question ADD FOREIGN KEY (id_category) REFERENCES category(id);