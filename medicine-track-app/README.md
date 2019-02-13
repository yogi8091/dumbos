Terminal 1 
====================================================
git clone https://github.com/yogi8091/dumbos.git
cd dumbos/
./Team_4_cleanup.sh
cd medicine-track-app/
./start.sh
./setup.sh
cd medicineTrack-api/
rm hfc-key-store/*
rm package-lock.json
npm install
node enrollDistributorUser.js
node enrollRetailerUser.js
node enrollManufacturerUser.js
npm start    <<<< Listening port 3000


Terminal 2
==================================================
cd dumbos/medicine-track-app/medicineTrack-api

Steps  to check
---------------

UserSpace@ps1ccp2dt:~/FABRIC/HLF/TEMP/dumbos/medicine-track-app/medicineTrack-api$ ./CurlRequestLC
{"code":"200","message":"LC requested successsfully."}

UserSpace@ps1ccp2dt:~/FABRIC/HLF/TEMP/dumbos/medicine-track-app/medicineTrack-api$ ./CurlIssueLC
{"code":"200","message":"LC issued successsfully."}

UserSpace@ps1ccp2dt:~/FABRIC/HLF/TEMP/dumbos/medicine-track-app/medicineTrack-api$ ./CurlAcceptLC
{"code":"200","message":"LC accepted successsfully."}

UserSpace@ps1ccp2dt:~/FABRIC/HLF/TEMP/dumbos/medicine-track-app/medicineTrack-api$ ./CurlGetLC
{"code":"200","data":{"amount":100000,"bank":"distributorUser","buyer":"retailerUser","expiryDate":"30-Dec-2019","lcId":"LC001","seller":"manufacturerUser","status":"Accepted"}}UserSpace@ps1ccp2dt:~/FABRIC/HLF/TEMP/dumbos/medicine-track-app/medicineTrack-api$


