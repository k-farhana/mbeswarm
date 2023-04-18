
echo "peer lifecycle chaincode install <path>"

peer lifecycle chaincode install ${CC_PATH}/$CC_NAME.tar.gz 
peer lifecycle chaincode install ${CC_PATH}/$CC_NAME1.tar.gz 
peer lifecycle chaincode install ${CC_PATH}/$CC_NAME2.tar.gz 
peer lifecycle chaincode install ${CC_PATH}/$CC_NAME3.tar.gz 
peer lifecycle chaincode install ${CC_PATH}/$CC_NAME4.tar.gz 
peer lifecycle chaincode install ${CC_PATH}/$CC_NAME5.tar.gz 
peer lifecycle chaincode install ${CC_PATH}/$CC_NAME6.tar.gz 
peer lifecycle chaincode install ${CC_PATH}/$CC_NAME7.tar.gz 

peer lifecycle chaincode queryinstalled>&log.txt
