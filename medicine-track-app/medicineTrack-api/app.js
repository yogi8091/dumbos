var express = require('express');
var app = express();


var swaggerUi = require('swagger-ui-express');
var swaggerDocument = require('./swagger.json');


var AsliMedicineController = require('./AsliMedicineController');

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
app.use('/aslimedicine', AsliMedicineController);

module.exports = app;
