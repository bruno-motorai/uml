const fs = require('fs');
const { exporter } = require('@dbml/core');

// get DBML file content
const dbml = fs.readFileSync('./database.dbml', 'utf-8');

// generate MySQL from DBML
const mysql = exporter.export(dbml, 'postgres');


// Write to file
fs.writeFile('./database.sql', mysql, { flag: "w+" }, err => {
    if (err) {
        console.error(err);
    } else {
        // file written successfully
    }
});