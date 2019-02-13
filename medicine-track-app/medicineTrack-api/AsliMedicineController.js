var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

var AsliMedicine = require("./FabricHelper")


// Request LC
router.post('/requestLC', function (req, res) {

AsliMedicine.requestLC(req, res);

});

// Issue LC
router.post('/issueLC', function (req, res) {

    AsliMedicine.issueLC(req, res);
    
});

// Accept LC
router.post('/acceptLC', function (req, res) {

    AsliMedicine.acceptLC(req, res);
    
});

// Get LC
router.post('/getLC', function (req, res) {

    AsliMedicine.getLC(req, res);
    
});

// Get LC history
router.post('/getLCHistory', function (req, res) {

    AsliMedicine.getLCHistory(req, res);
    
});


module.exports = router;
