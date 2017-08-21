#!/bin/bash

docker run --name bitcoin-testnet -d -p 18333:18333 cryptochain/bitcoin-docker bitcoind -testnet -datadir=/home/bitcoin/.bitcoin
