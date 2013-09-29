USE kossy_training;

CREATE TABLE todos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    created_at datetime NOT NULL,
    updated_at TIMESTAMP on update current_timestamp,
    deadline datetime,
    comment text
)
