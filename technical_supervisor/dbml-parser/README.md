# DBML parser

DBML syntax is parsed to postgresql statements via `dbml_parser.js `


To parse `.dbml` and obtain postgresql instructions run:
```bash
node dbml_parser.js
```

This will output a `database.sql` file with commands to implement the database in postgresql engine.