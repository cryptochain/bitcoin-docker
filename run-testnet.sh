#!/bin/bash

docker run --name bitcoin-container -d -p 18333:18333 amacneil/bitcoin bitcoind -testnet
