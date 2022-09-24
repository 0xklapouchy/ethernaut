-include .env

# Dependencies
update:; forge update

# Build & Test
build:; forge build
test:; forge test --match-path src/${level}/${level}.t.sol
testall:; forge test
trace:; forge test -vvvv --match-path src/${level}/${level}.t.sol
traceall:; forge test -vvvv
clean:; forge clean

# Solve

solve:; @forge script ./src/${level}/${level}.t.sol:${level}Solver --private-key ${PRIVATE_KEY} --rpc-url ${RPC_URL} --broadcast
coinflip:; @forge script ./src/CoinFlip/CoinFlip.t.sol:CoinFlipSolver --private-key ${PRIVATE_KEY} --rpc-url ${RPC_URL} --skip-simulation --slow --delay 15 --broadcast