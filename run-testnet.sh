#!/bin/bash

docker run --name bitcoin-container -tid -p 18333:18333 amacneil/bitcoin -testnet
