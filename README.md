# Dooza Dynamic NFT Factory

<img src="./src/doocoin_backend/images/nft-logo.png" />


## Welcome to the Dooza NFT Factory

## TO RUN LOCALLY

Run this command to set up your local environment:

```
dfx start --clean --background
```

Once up and running, run this command to deploy the backend NFT canister:

```
dfx deploy --argument "(
principal\"$(dfx identity get-principal)\",
record {
logo = record {
logo_type = \"image/png\";
data = \"./src/doocoin_backend/images/nft-logo.png\";
};
name = \"Doo Dynamic NFT Factory\";
symbol = \"DOO\";
maxLimit = 1000;
}
)" doocoin_backend
```



## For live deployment only

## IC

dfx deploy --network ic --argument "(
principal\"$(dfx identity get-principal)\",
record {
logo = record {
logo_type = \"image/png\";
data = \"./src/doocoin_backend/images/nft-logo.png\";
};
name = \"Doo Dynamic NFT Factory\";
symbol = \"DOO\";
maxLimit = 1000;
}
)" doocoin_backend

## Staging

dfx deploy --network staging --argument "(
principal\"$(dfx identity get-principal)\",
record {
logo = record {
logo_type = \"image/png\";
data = \"\";
};
name = \"Doo Dynamic NFT Factory\";
symbol = \"DOO\";
maxLimit = 1000;
}
)" doocoin_backend

