var sql = require("mssql/msnodesqlv8");

function executeSQL(strSQL, cb) {
    //config for your database
    var config = {
        user: 'sa',
        password: '18022002',
        server: 'DESKTOP-9LRNS0A\\PHUNGQUANTRUONG',
        database: 'nodejs',
        options: {
            encrypt: false,
            trustedConnection: true,
        },
    };
    //connect to your database
    sql.connect(config, function (err, db) {
        //console.log(db);
        if (err) console.log(err);
        //create Request object
        var request = new sql.Request();
        //query to the database and get the records
        request.query(strSQL, function (err, recordset) {
            if (err) console.log(err)
            cb(recordset);
        });
    });

}

function login(username, pass, cb){
    executeSQL(`select*from USERS where [name]= '${username}' and pass = '${pass}'`, (recordset) => {
        cb(recordset.recordsets[0])
    });
}

module.exports = {
    login: login
}