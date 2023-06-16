set -ev

rm -rf backup
mkdir backup
#Copying Certificates and Configuration files
sleep 5
cp -r organizations backup # crypto-config
cp -r channel-artifacts backup #config
cp -r system-genesis-block backup # 제네시스블록

cd backup
mkdir peer0.org1.example.com
mkdir peer0.org2.example.com
mkdir orderer.example.com
cd ..
#Copying Peer and orderer data
sleep 5
docker cp peer0.org1.example.com:/var/hyperledger/production/ backup/peer0.org1.example.com
docker cp peer0.org2.example.com:/var/hyperledger/production/ backup/peer0.org2.example.com

docker cp orderer.example.com:/var/hyperledger/production/orderer/ backup/orderer.example.com

#All done
exit 1