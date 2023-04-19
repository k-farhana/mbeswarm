#Multinode action using swarm:
## docker1: initialize swarm
docker swarm init --advertise-addr 10.201.1.4
# docker swarm join-token manager

# docker2: join using token generated 
#docker2:
docker swarm join --token SWMTKN-1-517litvosmfiwt7nu547derq41pzlc7d4qdkez2ox0tk828zqc-bvtto5akk6igzujirirde77y0 10.201.1.4:2377

##docker1: create network
docker network create --driver=overlay  --attachable test
ui0vjpkqh7m4ig7ekmgbn4sj8

#copy the repo to all servers, go to test network folder
cd mbeswarm/test-network

#docker1:
docker node ls
docker node update --label-add name=manager 
#<manager node id : here cfyvg4c9baasb81w1l124h8r5 >
docker node inspect
# cfyvg4c9baasb81w1l124h8r5
##(it will return name as manager)

##similarly name worker1 and worker2 

docker node update --label-add name=worker1 
#<worker id: p7flp9u42pwhl7o1jluml85a2 >
docker node update --label-add name=worker2 
#<worker id: gdi5nuqqqopcd8f320p84vmqm >

#docker1 : run containers (ca certificates for org1, org2, org3, orderer)
docker stack deploy -c docker/docker-compose-ca.yaml hlf

# if error : no contaqiner running

docker service ps --no-trunc hlf_ca_orderer

# ID                          NAME                   IMAGE                                                                                                  NODE             DESIRED STATE   CURRENT STATE             ERROR                                                                                                                                                    PORTS
# tksg5lait1n3cxctd3s1rw2a4   hlf_ca_orderer.1       hyperledger/fabric-ca:latest@sha256:c5c6dfa2d1d4cdee4d22dbfdd928506a9504931e53f60468e0efbad3773f9d30   LRCBlockchain1   Ready           Rejected 3 seconds ago    "invalid mount config for type "bind": bind source path does not exist: /home/ubuntu/hlf-docker-swarm/test-network/organizations/fabric-ca/ordererOrg"
# 66kg4nwaj3yea58bwwbvhg5q9    \_ hlf_ca_orderer.1   hyperledger/fabric-ca:latest@sha256:c5c6dfa2d1d4cdee4d22dbfdd928506a9504931e53f60468e0efbad3773f9d30   LRCBlockchain1   Shutdown        Rejected 8 seconds ago    "invalid mount config for type "bind": bind source path does not exist: /home/ubuntu/hlf-docker-swarm/test-network/organizations/fabric-ca/ordererOrg"
# lhhf9wj8b27er0fcxujupwegw    \_ hlf_ca_orderer.1   hyperledger/fabric-ca:latest@sha256:c5c6dfa2d1d4cdee4d22dbfdd928506a9504931e53f60468e0efbad3773f9d30   LRCBlockchain1   Shutdown        Rejected 13 seconds ago   "invalid mount config for type "bind": bind source path does not exist: /home/ubuntu/hlf-docker-swarm/test-network/organizations/fabric-ca/ordererOrg"
# azouku7p3suyiq1a0cdgo0tmt    \_ hlf_ca_orderer.1   hyperledger/fabric-ca:latest@sha256:c5c6dfa2d1d4cdee4d22dbfdd928506a9504931e53f60468e0efbad3773f9d30   LRCBlockchain1   Shutdown        Rejected 18 seconds ago   "invalid mount config for type "bind": bind source path does not exist: /home/ubuntu/hlf-docker-swarm/test-network/organizations/fabric-ca/ordererOrg"
# vn5bpcke2qmyo68vv4jy2dlp6    \_ hlf_ca_orderer.1   hyperledger/fabric-ca:latest@sha256:c5c6dfa2d1d4cdee4d22dbfdd928506a9504931e53f60468e0efbad3773f9d30   LRCBlockchain1   Shutdown        Rejected 23 seconds ago   "invalid mount config for type "bind": bind source path does not exist: /home/ubuntu/hlf-docker-swarm/test-network/organizations/fabric-ca/ordererOrg"
# it will start the container 


#docker1:
##create certificates for org1 & orderer
source ./organizations/fabric-ca/registerEnroll.sh
createOrg1
createOrderer

#docker2:
source ./organizations/fabric-ca/registerEnroll.sh
createOrg2

#docker3:
source ./organizations/fabric-ca/registerEnroll.sh
createOrg3

# now we've generated the certificates for all the orgs and peers
# copy the certificatyes of org2 &org3 to manager node
# from: test-network/organizations/peerOrganizations : org2.example.com
# similarly copy the certificate of org3 from worker2
# paste the certificates to manager node @organizations/peerOrganizations

# Docker 1: 
scp -r farhana_kottal-v@10.201.1.6:/home/farhana_kottal-v/mbeswarm/test-network/organizations/peerOrganizations/org2.example.com/ /home/farhana_kottal-v/mbeswarm/test-network/organizations/peerOrganizations

scp -r farhana_kottal-v@10.201.1.7:/home/farhana_kottal-v/mbeswarm/test-network/organizations/peerOrganizations/org3.example.com/ /home/farhana_kottal-v/mbeswarm/test-network/organizations/peerOrganizations

#Also, copy the orderer certificate from manager node and paste them to worker1&2 (I used VS code for copying)
#Docker 2&3:
scp -r farhana_kottal-v@10.201.1.4:/home/farhana_kottal-v/mbeswarm/test-network/organizations/ordererOrganizations/ /home/farhana_kottal-v/mbeswarm/test-network/organizations


##Generate genesis block:
#docker1: under test-network folder:
./scripts/createGenesis.sh

##create channel:
#docker1:
./scripts/createChannelTx.sh

##copy the artifacts to worker nodes
##copy channel-artifacts and paste it to worker2&3
#docker2&3: 
scp -r farhana_kottal-v@10.201.1.4:/home/farhana_kottal-v/mbeswarm/test-network/channel-artifacts/ /home/farhana_kottal-v/mbeswarm/test-network

#lecture #20 
#bla bla bla explaining yaml files

##Start peers and ordering services:
#docker1:
docker stack deploy -c docker/docker-compose-test-net.yaml -c docker/docker-compose-couch.yaml hlf

docker ps
# 5 orderers, 1 peer amd 1 couchdb running on docker1
# 1 peer, 1 couchdb on worker1
# 1 peer, 1 couchdb on worker2


# create channel:
# lecture #22 
# bla bla bla: docker-compose-cli.yaml config explanation 

#docker1:
docker stack deploy -c docker/docker-compose-cli.yaml hlf 
##//hlf is the application name

docker ps | grep cli
##e8f6b1ef4d95 //returns id of cli


########### go to cli bash ############
#docker1: --it interacting mode 
docker exec -it e8f6b1ef4d95 bash
export CHANNEL_NAME=mychannel
echo $CHANNEL_NAME
# mychannel


./scripts/create_app_channel.sh


#23 Joining application channel(mychannel)
# copy mychannel.block to worker1&2 from manager node
#docker2&3:
scp -r farhana_kottal-v@10.201.1.4:/home/farhana_kottal-v/mbeswarm/test-network/channel-artifacts/ /home/farhana_kottal-v/mbeswarm/test-network

# in all nodes:
peer channel join -b ./channel-artifacts/mychannel.block
# on worker nodes, go to cli bash and check if the peer has joined any channel:
#docker2&3:
peer channel list

# if not joined to any channels, (it should be not)
peer channel join -b ./channel-artifacts/mychannel.block

#24 Updating anchor peers:
##responsible for cross peer communication

#docker1:
./scripts/updateAnchorPeer.sh mychannel Org1MSP

#docker2:
./scripts/updateAnchorPeer.sh mychannel Org2MSP

#docker3:
./scripts/updateAnchorPeer.sh mychannel Org3MSP


#25 chaincode package and instllation
#pass env variables(CC_NAME)
export CHANNEL_NAME=mychannel
export CC_NAME=BondHolding
export CC_NAME1=BuyOrder
export CC_NAME2=CBDCwallet
export CC_NAME3=MBEmarket
export CC_NAME4=PurchaseLog
export CC_NAME5=SellOrder
export CC_NAME6=TokenHolding
export CC_NAME7=Transactions

./scripts/package_cc.sh


#now basic.tar.gz will be created (packaged chaincode ) inside chaincodes folder. copy this file to all worker nodes (I got permission error while trying to copy, so I packaged in all 3 nodes)

#install chaincode in all nodes
./scripts/install_cc.sh

#26 Approve chaincode in all nodes
./scripts/approve_cc.sh
#check commit
./scripts/check_commit.sh

#27 Commiting chaincode 
#docker1:
./scripts/commit_cc.sh

#docker2: //query 
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME 
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME1 
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME2 
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME3 
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME4 
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME5 
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME6 
peer lifecycle chaincode querycommitted --channelID mychannel --name $CC_NAME7


#28 transaction invocation
source ./scripts/envVar.sh
parsePeerConnectionParameters 1 2 3 
# //since manager node has the certs of all the 3 organizations, then we can pass 1 2 3 as argument to this function

echo $PEER
echo $PEER_CONN_PARMS
##edit the invoke_cc.sh : comment line number 7&8
./scripts/invoke_cc.sh
##edit invoke_cc.sh : comment ine #3,4 
./scripts/invoke_cc.sh

##Invoke transaction from other node 
#docker2:
source ./scripts/envVar.sh
parsePeerConnectionParameters 2 //since worker1 node has the certs of only Og=rg2, we can only pass 2 as argument to this function

echo $PEER_CONN_PARMS
fcn_call='{"function":"CreateAsset","Args":["101","Silver","10","Farhana","500000"]}'
peer chaincode invoke -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C mychannel -n ${CC_NAME} $PEER_CONN_PARMS -c ${fcn_call} 

#docker3:
source ./scripts/envVar.sh
parsePeerConnectionParameters 3 //since worker1 node has the certs of only Og=rg2, we can only pass 2 as argument to this function

echo $PEER_CONN_PARMS
fcn_call='{"function":"CreateAsset","Args":["3788","Silver","10","Farhana","500000"]}'
peer chaincode invoke -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C mychannel -n ${CC_NAME} $PEER_CONN_PARMS -c ${fcn_call} 

#if you check the couchdb (http://10.201.1.4:5984/_utils), you can see the assets there under mychannel_basic


#Query 
#docker2:
peer chaincode query -C mychannel -n basic -c '{"function":"GetAllAssets", "Args":[]}'






##docker1:
docker node ls 
# ID                            HOSTNAME         STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
# 6z88rzqxpuzfzvfem6hqm8252 *   LRCBlockchain1   Ready     Active         Leader           20.10.22
# jk8cprtf5bfmz3ch20qukh8le     LRCBlockchain3   Ready     Active         Reachable        20.10.12

##docker1:
docker service create --name web --publish 80:80 --replicas 3 nginx

##docker1:
##portainer:
curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
docker stack deploy -c portainer-agent-stack.yml portainer

##portainer runs at 9000
http://10.201.1.4:9000/#!/home
pw: admin123


# docekr permission error:
sudo usermod -aG docker farhana_kottal-v
sudo reboot

# docker installation:
https://docs.docker.com/engine/install/ubuntu/

# leaving the swarm:
docker swarm leave --force

# cleanup the constainers:
docker rm -f $(docker ps -aq) 
docker volume rm $(docker volume ls)
