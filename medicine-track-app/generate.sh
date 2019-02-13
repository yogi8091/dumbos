rm -R crypto-config/*

bin/cryptogen generate --config=crypto-config.yaml

rm config/*

bin/configtxgen -profile AsliMedicineOrgOrdererGenesis -outputBlock ./config/genesis.block

bin/configtxgen -profile AsliMedicineOrgChannel -outputCreateChannelTx ./config/aslimedicinechannel.tx -channelID aslimedicinechannel
