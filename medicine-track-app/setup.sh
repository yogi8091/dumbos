echo "Setting up the network.."

echo "Creating channel genesis block.."

# Create the channel
docker exec -e "CORE_PEER_LOCALMSPID=DistributorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/distributor.aslimedicine.com/users/Admin@distributor.aslimedicine.com/msp" -e "CORE_PEER_ADDRESS=peer0.distributor.aslimedicine.com:7051" cli peer channel create -o orderer.aslimedicine.com:7050 -c aslimedicinechannel -f /etc/hyperledger/configtx/aslimedicinechannel.tx


sleep 5

echo "Channel genesis block created."

echo "peer0.distributor.aslimedicine.com joining the channel..."
# Join peer0.distributor.aslimedicine.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=DistributorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/distributor.aslimedicine.com/users/Admin@distributor.aslimedicine.com/msp" -e "CORE_PEER_ADDRESS=peer0.distributor.aslimedicine.com:7051" cli peer channel join -b aslimedicinechannel.block

echo "peer0.distributor.aslimedicine.com joined the channel"

echo "peer0.retailer.aslimedicine.com joining the channel..."

# Join peer0.retailer.aslimedicine.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=RetailerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/retailer.aslimedicine.com/users/Admin@retailer.aslimedicine.com/msp" -e "CORE_PEER_ADDRESS=peer0.retailer.aslimedicine.com:7051" cli peer channel join -b aslimedicinechannel.block

echo "peer0.retailer.aslimedicine.com joined the channel"

echo "peer0.manufacturer.aslimedicine.com joining the channel..."
# Join peer0.manufacturer.aslimedicine.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=ManufacturerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/manufacturer.aslimedicine.com/users/Admin@manufacturer.aslimedicine.com/msp" -e "CORE_PEER_ADDRESS=peer0.manufacturer.aslimedicine.com:7051" cli peer channel join -b aslimedicinechannel.block
sleep 5

echo "peer0.manufacturer.aslimedicine.com joined the channel"

echo "Installing aslimedicine chaincode to peer0.distributor.aslimedicine.com..."

# install chaincode
# Install code on distributor peer
docker exec -e "CORE_PEER_LOCALMSPID=DistributorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/distributor.aslimedicine.com/users/Admin@distributor.aslimedicine.com/msp" -e "CORE_PEER_ADDRESS=peer0.distributor.aslimedicine.com:7051" cli peer chaincode install -n aslimedicinecc -v 1.0 -p github.com/aslimedicine/go -l golang

echo "Installed aslimedicine chaincode to peer0.distributor.aslimedicine.com"

echo "Installing aslimedicine chaincode to peer0.retailer.aslimedicine.com...."

# Install code on retailer peer
docker exec -e "CORE_PEER_LOCALMSPID=RetailerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/retailer.aslimedicine.com/users/Admin@retailer.aslimedicine.com/msp" -e "CORE_PEER_ADDRESS=peer0.retailer.aslimedicine.com:7051" cli peer chaincode install -n aslimedicinecc -v 1.0 -p github.com/aslimedicine/go -l golang

echo "Installed aslimedicine chaincode to peer0.retailer.aslimedicine.com"

echo "Installing aslimedicine chaincode to peer0.manufacturer.aslimedicine.com..."
# Install code on manufacturer peer
docker exec -e "CORE_PEER_LOCALMSPID=ManufacturerMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/manufacturer.aslimedicine.com/users/Admin@manufacturer.aslimedicine.com/msp" -e "CORE_PEER_ADDRESS=peer0.manufacturer.aslimedicine.com:7051" cli peer chaincode install -n aslimedicinecc -v 1.0 -p github.com/aslimedicine/go -l golang

sleep 5

echo "Installed aslimedicine chaincode to peer0.retailer.aslimedicine.com"

echo "Instantiating aslimedicine chaincode.."

docker exec -e "CORE_PEER_LOCALMSPID=DistributorMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/distributor.aslimedicine.com/users/Admin@distributor.aslimedicine.com/msp" -e "CORE_PEER_ADDRESS=peer0.distributor.aslimedicine.com:7051" cli peer chaincode instantiate -o orderer.aslimedicine.com:7050 -C aslimedicinechannel -n aslimedicinecc -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('DistributorMSP.member','RetailerMSP.member','ManufacturerMSP.member')"

echo "Instantiated aslimedicine chaincode."

echo "Following is the docker network....."

docker ps
