# SPUR – Foundry Starter Project


| File | What it does |
|------|--------------|
| `src/token.sol` | The Solidity contract. It inherits from OpenZeppelin’s `ERC20` and mints **1,000,000 tokens** (18 decimals) straight to the deployer. |
| `test/token.t.sol` | A few Forge unit tests that prove the basics work (name, symbol, supply, transfers). |
| `script/deploy.s.sol` | A deployment script you run with one command to push the token on‑chain. |

Everything else (`foundry.toml`, `lib/…`) is just boilerplate that Foundry/Forge needs to run.

---

## Prereqs (takes 5 min)

| Tool | Why | Quick install |
|------|-----|---------------|
| **Git** | Grab the repo | <https://git-scm.com> |
| **Foundry** | Builds/tests/scripts | `curl -L https://foundry.paradigm.xyz | bash && foundryup` |
| **Node >= 18** (nice to have) | Run local JSON‑RPC nodes like Anvil | <https://nodejs.org> |

No prior Solidity or blockchain wizardry required—promise.

---

## Clone & build

```bash
git clone <YOUR-FORK-URL> simple-token
cd simple-token

# pull OpenZeppelin + forge-std
forge install

# compile everything
forge build
```

You should see “Compiler run successful!”—if not, ping me on Discord.

---

## Run the tests

```bash
forge test -vvv
```

You’ll get green ✔️s for:

* `testBasicInfo`
* `testInitialSupply`
* `testTransfer`

If something fails, it probably means you changed the token name/symbol without updating the assertions.

---

## Deploy to Sepolia (or any testnet)

1. **Add secrets** – create a `.env` file:

   ```dotenv
   RPC_URL=https://sepolia.infura.io/v3/<YOUR-KEY>
   PRIVATE_KEY=0x<YOUR-PRIVATE-KEY>   # test wallet only!
   ```

2. **Ship it**:

   ```bash
   forge script script/deploy.s.sol:DeploySimple      --rpc-url $RPC_URL      --broadcast      --verify      -vvvv
   ```

   Forge spits out the contract address plus your freshly‑minted balance (1 000 000 tokens).

3. **Flex** – paste the address into <https://sepolia.etherscan.io> and watch it appear.

---

## Quick interactions

```bash
# show total supply
cast call <TOKEN_ADDR> "totalSupply()(uint256)" --rpc-url $RPC_URL

# send 100 tokens to a friend
cast send <TOKEN_ADDR> "transfer(address,uint256)" <FRIEND> 100e18   --private-key $PRIVATE_KEY --rpc-url $RPC_URL
```

---

## Gotchas

| Headache | Likely fix |
|----------|------------|
| `forge: command not found` | Forgot `foundryup`. Rerun install command. |
| Deploy gas fails | Wallet missing test ETH or wrong RPC URL. |
| Tests complain about name/symbol | Keep assertions in sync with `token.sol`. |

---

## More resources

* Foundry Book – <https://book.getfoundry.sh/>
* OpenZeppelin ERC‑20 docs – <https://docs.openzeppelin.com/contracts/erc20>
* Solidity by Example – <https://solidity‑by‑example.org/>

---

MIT license. Have fun experimenting! 🚀
