var express = require('express');
var sql = require("mssql/msnodesqlv8");
const { dirname } = require('path');
var app = express();
const path = require('path');
const login = require('./login')
const admin = require('./admin');
app.use(express.static(path.join(__dirname, 'public')));
var bodyParser = require('body-parser');
const register = require('./register');
app.use(bodyParser.urlencoded({extended:true}))

app.use("/css", express.static("css"));
app.use("/public/image", express.static("public/image"));

var server = app.listen(3000, function () {
    console.log('Listening on port 3000....');
});

app.get('/index', function (req, res) {
    res.sendFile(__dirname + "/index.html");
});

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

app.get('/', function (req, res) {

    executeSQL("select*from CONTENT", (recordset) => {

        var result = "<table class = 'main'>";
        var i = 0;
        var tmp = "";
        recordset.recordsets[0].forEach(row => {
            if (i < 3) {
                tmp += `
                    <div>
                        <td>
                        <a href="/detail/${row['id']}"><img class="productimage zoom" src='image/${row['ProductImage']}'/></br></a>
                        <h1><div class="name zoom"><a class="link" href="/detail/${row['id']}">${row['ProductName']}</a></div></h1>
                        <div class="price"><span>${row['ProductPrice']}$</span></div>
                        </td> 
                    </div>
                `;
                i++;
            }
            if (i >= 3) {
                result += `<tr>${tmp}</tr>`;
                i = 0;
                tmp = "";
            }
        });

        result += "</table>";
        console.log(result);
        res.send(result);

    });
});

app.post('/search', function (req, res) {
    var search = req.body.search;
    executeSQL(`select*from CONTENT where ProductName like '${search}%'`, (recordset) => {

        var tmp = "";
        if(recordset.recordsets[0] === null || recordset.recordsets[0].length === 0){
            res.send("Không tìm thấy sản phẩm")
        }
        
        recordset.recordsets[0].forEach(row => {
           
                tmp += `
                    <div>
                        <td>
                        <a href="/detail/${row['id']}"><img class="productimage zoom"; style="margin-left: 35.5%;" src='image/${row['ProductImage']}'/></br></a>
                        <h1><div class="name zoom"><a class="link" href="/detail/${row['id']}">${row['ProductName']}</a></div></h1>
                        <div class="price"><span>${row['ProductPrice']}$</span></div>
                        </td> 
                    </div>
                `;
                           
        });

        res.send(tmp);

    });
});

app.post('/getProductByCatId', function (req, res) {
    var catId = req.body.catId;
    executeSQL(`select*from CONTENT where catId=${catId}`, (recordset) => {

        var tmp = "";
        if(recordset.recordsets[0] === null || recordset.recordsets[0].length === 0){
            res.send("Không tìm thấy sản phẩm")
        }
        
        recordset.recordsets[0].forEach(row => {
           
                tmp += `
                    <div>
                        <td>
                        <a href="/detail/${row['id']}"><img class="productimage zoom"; style="margin-left: 35.5%;" src='image/${row['ProductImage']}'/></br></a>
                        <h1><div class="name zoom"><a class="link" href="/detail/${row['id']}">${row['ProductName']}</a></div></h1>
                        <div class="price"><span>${row['ProductPrice']}$</span></div>
                        </td> 
                    </div>
                `;
                           
        });

        res.send(tmp);

    });
});

app.get('/detail/:id', function (req, res) {
    res.sendFile(__dirname + "/detail.html");
});

app.get('/login', function (req, res) {
    res.sendFile(__dirname + "/public/login.html");
});
app.post('/getlogin', function (req, res) {
    login.login(req.body.username, req.body.pass, (user) => {
        res.send(user)
    });
});

app.get('/getdetailData/:id', function (req, res, next) {

    executeSQL(`select*from CONTENT where id = ${req.params.id}`, (recordset) => {

        var row = recordset.recordsets[0][0];
        res.send(row);

    });

});

app.get('/register', function (req, res) {
    res.sendFile(__dirname + "/public/register.html");
});
app.post('/getregister', function (req, res) {
    register.register(req.body.username, req.body.pass, req.body.fullname, (recordset) => {
        res.send(recordset)
    });
});

app.get('/admin', function (req, res) {
    res.sendFile(__dirname + "/public/admin.html");
});

app.post('/getProductAdmin', function (req, res) {
    admin.getProduct(req, res) 
});

app.post('/updateProduct', function (req, res) {
    admin.updateProduct(req, res) 
});

app.post('/deleteProduct', function (req, res) {
    admin.deleteProduct(req, res);
});

app.post('/addProduct', function (req, res) {
    admin.addProduct(req.body.ProductImage, req.body.ProductName, req.body.ProductPrice, req.body.MoTa, (recordset) => {
        res.send(recordset)
    });
});

