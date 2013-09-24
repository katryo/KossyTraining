USE kossy_training;

CREATE TABLE texts (
    id MEDIUMINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    body TEXT NOT NULL,
    created TIMESTAMP default current_timestamp
)