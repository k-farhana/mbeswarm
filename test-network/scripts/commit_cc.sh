. ./scripts/envVar.sh
parsePeerConnectionParameters 1 2 3

echo "chaincode commit "
sleep 5
peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME $PEER_CONN_PARMS --version 1 --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "query commited"
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME 


echo "chaincode commit "
sleep 5
peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME1 $PEER_CONN_PARMS --version 1 --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "query commited"
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME1 


echo "chaincode commit "
sleep 5
peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME2 $PEER_CONN_PARMS --version 1 --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "query commited"
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME2


echo "chaincode commit "
sleep 5
peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME3 $PEER_CONN_PARMS --version 1 --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "query commited"
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME3


echo "chaincode commit "
sleep 5
peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME4 $PEER_CONN_PARMS --version 1 --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "query commited"
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME4 


echo "chaincode commit "
sleep 5
peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME5 $PEER_CONN_PARMS --version 1 --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "query commited"
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME5 


echo "chaincode commit "
sleep 5
peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME6 $PEER_CONN_PARMS --version 1 --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "query commited"
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME6 


echo "chaincode commit "
sleep 5
peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CC_NAME7 $PEER_CONN_PARMS --version 1 --sequence 1 --init-required --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')" 

echo "query commited"
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME7 
