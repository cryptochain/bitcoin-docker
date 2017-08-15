#!/bin/bash

docker run --name bitcoin-testnet -d -p 18333:18333 amacneil/bitcoin bitcoind -testnet
