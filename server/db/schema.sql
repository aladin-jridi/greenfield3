DROP DATABASE IF EXISTS youcamp;
CREATE DATABASE youcamp;
USE youcamp;

CREATE TABLE users (
  userId int NOT NULL AUTO_INCREMENT ,
  userName varchar (255),
  email varchar(255),
  Adress varchar (255),
  image varchar(255)  ,
  password varchar(255),
  PRIMARY KEY (userId)
);

CREATE TABLE products (
  productId int NOT NULL AUTO_INCREMENT ,
  productName varchar(255),
  price int ,
  img varchar(255),
  buyerId int ,
  ownerId int(8),
  createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ownerId) REFERENCES users(userId),
  FOREIGN KEY (buyerId) REFERENCES users(userId),
  PRIMARY KEY (productId)
);


CREATE TABLE posts (
  postId int NOT NULL AUTO_INCREMENT ,
  content varchar(10000),
  imgUrl varchar(255),
  title varchar (255),
  place varchar (255),
  createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ownerId int(8),
  PRIMARY KEY (postId),
      CONSTRAINT ownerId
    FOREIGN KEY (ownerId)
    REFERENCES users (userId)
    ON DELETE CASCADE
);

CREATE TABLE comments (
  commentId int NOT NULL AUTO_INCREMENT ,
  content varchar(50),
  commenter int(8),
  postId int ,
  createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (commentId),
        CONSTRAINT commenter
    FOREIGN KEY (commenter)
    REFERENCES users(userId)
    ON DELETE CASCADE,
          CONSTRAINT postId
    FOREIGN KEY (postId)
    REFERENCES posts (postId)
    ON DELETE CASCADE
);


