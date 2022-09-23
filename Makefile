-include .env

# Dependencies
update:; forge update

# Build & Test
build:; forge build
test:; forge test
trace:; forge test -vvv
clean:; forge clean
snapshot:; forge snapshot
lint:; yarn lint

# Solve

solve:; @forge script ./src/${level}/${level}.s.sol:${level}Solver --private-key ${PRIVATE_KEY} --rpc-url ${RPC_URL} --broadcast
