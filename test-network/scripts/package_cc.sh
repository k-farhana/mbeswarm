# export CHANNEL_NAME=mychannel
# export CC_NAME=BondHolding
# export CC_NAME1=BuyOrder
# export CC_NAME2=CBDCwallet
# export CC_NAME3=MBEmarket
# export CC_NAME4=PurchaseLog
# export CC_NAME5=SellOrder
# export CC_NAME6=TokenHolding
# export CC_NAME7=Transactions


infoln "Vendoring Go dependencies at ${CC_PATH}/${CC_NAME}"
pushd ${CC_PATH}/${CC_NAME}
pushd ${CC_PATH}/${CC_NAME1}
pushd ${CC_PATH}/${CC_NAME2}
pushd ${CC_PATH}/${CC_NAME3}
pushd ${CC_PATH}/${CC_NAME4}
pushd ${CC_PATH}/${CC_NAME5}
pushd ${CC_PATH}/${CC_NAME6}
pushd ${CC_PATH}/${CC_NAME7}
GO111MODULE=on go mod vendor
popd
successln "Finished vendoring Go dependencies"


peer lifecycle chaincode package ${CC_PATH}/${CC_NAME}.tar.gz --path ${CC_PATH}/$CC_NAME --label ${CC_NAME}_1
peer lifecycle chaincode package ${CC_PATH}/${CC_NAME1}.tar.gz --path ${CC_PATH}/$CC_NAME1 --label ${CC_NAME1}_1
peer lifecycle chaincode package ${CC_PATH}/${CC_NAME2}.tar.gz --path ${CC_PATH}/$CC_NAME2 --label ${CC_NAME2}_1
peer lifecycle chaincode package ${CC_PATH}/${CC_NAME3}.tar.gz --path ${CC_PATH}/$CC_NAME3 --label ${CC_NAME3}_1
peer lifecycle chaincode package ${CC_PATH}/${CC_NAME4}.tar.gz --path ${CC_PATH}/$CC_NAME4 --label ${CC_NAME4}_1
peer lifecycle chaincode package ${CC_PATH}/${CC_NAME5}.tar.gz --path ${CC_PATH}/$CC_NAME5 --label ${CC_NAME5}_1
peer lifecycle chaincode package ${CC_PATH}/${CC_NAME6}.tar.gz --path ${CC_PATH}/$CC_NAME6 --label ${CC_NAME6}_1
peer lifecycle chaincode package ${CC_PATH}/${CC_NAME7}.tar.gz --path ${CC_PATH}/$CC_NAME7 --label ${CC_NAME7}_1