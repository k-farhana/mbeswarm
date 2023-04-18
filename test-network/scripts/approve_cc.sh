

echo "Approve for org ${CORE_PEER_LOCALMSPID}"
PACKAGE_ID=$(sed -n "/${CC_NAME}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME --version 1 --package-id $PACKAGE_ID --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "Approve for org ${CORE_PEER_LOCALMSPID}"
PACKAGE_ID=$(sed -n "/${CC_NAME1}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME1 --version 1 --package-id $PACKAGE_ID --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "Approve for org ${CORE_PEER_LOCALMSPID}"
PACKAGE_ID=$(sed -n "/${CC_NAME2}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME2 --version 1 --package-id $PACKAGE_ID --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "Approve for org ${CORE_PEER_LOCALMSPID}"
PACKAGE_ID=$(sed -n "/${CC_NAME3}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME3 --version 1 --package-id $PACKAGE_ID --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "Approve for org ${CORE_PEER_LOCALMSPID}"
PACKAGE_ID=$(sed -n "/${CC_NAME4}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME4 --version 1 --package-id $PACKAGE_ID --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "Approve for org ${CORE_PEER_LOCALMSPID}"
PACKAGE_ID=$(sed -n "/${CC_NAME5}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME5 --version 1 --package-id $PACKAGE_ID --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "Approve for org ${CORE_PEER_LOCALMSPID}"
PACKAGE_ID=$(sed -n "/${CC_NAME6}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME6 --version 1 --package-id $PACKAGE_ID --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "Approve for org ${CORE_PEER_LOCALMSPID}"
PACKAGE_ID=$(sed -n "/${CC_NAME7}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
peer lifecycle chaincode approveformyorg -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME7 --version 1 --package-id $PACKAGE_ID --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 
