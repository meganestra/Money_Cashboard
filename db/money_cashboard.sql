DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE targets;

CREATE TABLE merchants (
  id SERIAL4 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE tags (
  id SERIAL4 primary key,
  description VARCHAR(255) not null
);

CREATE TABLE targets (
  id SERIAL4 primary key,
  type VARCHAR(255) not null,
  month VARCHAR(255) not null,
  value INT2 not null
);

CREATE TABLE transactions (
  id SERIAL4 primary key,
  merchant_id INT4 references merchants(id),
  tag_id INT4 references tags(id),
  amount INT2 not null,
  date DATE not null,
  time TIME not null,
  transaction_type VARCHAR(255) not null,
  payment_type VARCHAR(255) not null,
  shopping_method VARCHAR(255) not null
);
