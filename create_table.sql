USE kossy_training;

CREATE TABLE todos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    created_at TIMESTAMP default current_timestamp,
    updated_at TIMESTAMP
)
