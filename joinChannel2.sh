# Create the channel
docker exec peer0.rs1.hospital.com peer channel create -o orderer.hospital.com:7050 -c rschannel -f /var/hyperledger/channel-artifacts/channel.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/hospital.com/msp/tlscacerts/tlsca.hospital.com-cert.pem

# Join peer0.rs1.hospital.com to the channel.
docker exec peer0.rs1.hospital.com peer channel join -b rschannel.block

# Join peer1.rs1.hospital.com to the channel.
docker exec peer1.rs1.hospital.com peer channel fetch config -o orderer.hospital.com:7050 -c rschannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/hospital.com/msp/tlscacerts/tlsca.hospital.com-cert.pem
docker exec peer1.rs1.hospital.com peer channel join -b rschannel_config.block
