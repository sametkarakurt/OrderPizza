const { Client } = require("pg");

const client = new Client({
  host: "localhost",
  user: "postgres",
  port: 5432,
  password: "Smt1728+",
  database: "test_2",
});

module.exports = client;
