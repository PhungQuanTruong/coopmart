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

function getProduct(req, res){
    executeSQL(`select*from CONTENT`, (recordset) => {
        res.send(recordset.recordsets[0]);
    });
}

function updateProduct(req, res) {
    executeSQL(`update CONTENT set ProductImage='${req.body.ProductImage}', ProductName='${req.body.ProductName}' , ProductPrice='${req.body.ProductPrice}' where id='${req.body.id}'`, (recordset) => {
        res.send(recordset.recordsets[0]);
    });
}

function deleteProduct(req, res) {
    executeSQL(`delete CONTENT  where id='${req.body.id}'`, (recordset) => {
        res.send(recordset.recordsets[0]);
    });
}

function addProduct(ProductImage, ProductName, ProductPrice, MoTa, cb){
    executeSQL(`insert into CONTENT(ProductImage, ProductName, ProductPrice, MoTa) values ('${ProductImage}', '${ProductName}', '${ProductPrice}', '${MoTa}')`, (recordset) => {
        console.log(recordset)
        cb(recordset.recordsets[0])
        
    });
}

module.exports = {
    getProduct : getProduct,
    updateProduct : updateProduct,
    deleteProduct : deleteProduct,
    addProduct : addProduct
}