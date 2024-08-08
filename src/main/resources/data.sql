DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT PRIMARY KEY,
  FIRST_NAME VARCHAR(250) NOT NULL,
  LAST_NAME VARCHAR(250) NOT NULL,
  EMAIL VARCHAR(250) NOT NULL
);

INSERT INTO users (ID, FIRST_NAME, LAST_NAME, EMAIL) VALUES
  (1, 'Sergio', 'GALARZA', 'sergio.GALARZA@gmail.com'),
  (2, 'Sebastien', 'BODIN', 'sebastien.BODIN@gmail.com'),
  (3, 'Abdel', 'HAMOUDI', 'abdel.HAMOUDI@gmail.com');