#!/bin/bash
set -e

if [[ "$1" == "bitcoin-cli" || "$1" == "bitcoin-tx" || "$1" == "bitcoind" || "$1" == "test_bitcoin" ]]; then
	mkdir -p "$BITCOIN_DATA"

	if [[ ! -s "$BITCOIN_DATA/bitcoin.conf" ]]; then
		cat <<-EOF > "$BITCOIN_DATA/bitcoin.conf"
		printtoconsole=1
		server=1
		rpcallowip=0.0.0.0/0
		rpcuser=admin1
		rpcpassword=123
                addressindex=1
                timestampindex=1
                spentindex=1
                txindex=1
		EOF
		chown bitcoin:bitcoin "$BITCOIN_DATA/bitcoin.conf"
	fi

	# ensure correct ownership and linking of data directory
	# we do not update group ownership here, in case users want to mount
	# a host directory and still retain access to it
	chown -R bitcoin "$BITCOIN_DATA"
	ln -sfn "$BITCOIN_DATA" /home/bitcoin/.bitcoin
	chown -h bitcoin:bitcoin /home/bitcoin/.bitcoin

	exec gosu bitcoin "$@"
fi

exec "$@"
