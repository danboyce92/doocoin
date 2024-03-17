import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Nat16 "mo:base/Nat16";
import Nat32 "mo:base/Nat32";
import Nat64 "mo:base/Nat64";
import List "mo:base/List";
import Array "mo:base/Array";
import Option "mo:base/Option";
import Bool "mo:base/Bool";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
// import Cap "mo:cap/Cap";
import Types "./Types";
import Doos "./Doos";


shared actor class DoosNFTCanister(custodian : Principal, init : Types.Dip721NonFungibleToken) = Self {

  stable var transactionId : Types.TransactionId = 0;
  stable var nfts = List.nil<Types.Nft>();
  stable var custodians = List.make<Principal>(custodian);
  stable var logo : Types.LogoResult = init.logo;
  stable var name : Text = init.name;
  stable var symbol : Text = init.symbol;
  stable var maxLimit : Nat16 = init.maxLimit;

  //Used to verify the easterMint function sends ownership of the egg to the correct principal
  public query func ownerOfDoo(token_id : Types.TokenId) : async Types.OwnerResult {
    let item = List.find(nfts, func(token : Types.Nft) : Bool { token.id == token_id });
    switch (item) {
      case (null) {
        return #Err(#InvalidTokenId);
      };
      case (?token) {
        return #Ok(token.owner);
      };
    };
  };

  // Define a public function that queries and returns the NFT's name:
  public query func nameOfNFTCollection() : async Text {
    return name;
  };

  // Define a public function that queries and returns the NFT's symbol:
  public query func nFTSymbol() : async Text {
    return symbol;
  };

  // Define a public function that queries and returns the NFT's total supply value:
  public query func totalSupplyDip721() : async Nat64 {
    return Nat64.fromNat(
      List.size(nfts)
    );
  };


  // Define a public function that queries and returns the NFT's max limit value:
  public query func getMaxLimitDip721() : async Nat16 {
    return maxLimit;
  };

  //Mints an nft and gives ownership to the provided principal address
  public func easterMint(to: Text) : async Text {
    let principal = Principal.fromText(to);

    let newId = Nat64.fromNat(List.size(nfts));
    let nft : Types.Nft = {
      owner = principal;
      id = newId;
      metadata = "HardCoded";
    };
    nfts := List.push(nft, nfts);
    transactionId += 1;
    return to # " is now the proud owner of a Doo Egg!";
  };

  //Renders the relevant nft image
  public query func http_request(request : Types.HttpRequest) : async Types.HttpResponse {
    let ctype = "text/html";
    let path = Iter.toArray(Text.tokens(request.url, #text("/")));

    return {
      status_code = 200;
      headers = [("content-type", ctype),("cache-control", "public, max-age=15552000")];
      body = Text.encodeUtf8("<img src=\"data:image/png;base64 ," # Doos.getNFTindex() # "\" alt=\"Red dot\" />");
      streaming_strategy = null;
    };

  };


  //Returns tokenId of the doo that needs to evolve.
  //Not implemented
  public func evolve(owner: Text) : async Types.TokenId {
    let principal = Principal.fromText(owner);

    let items = List.filter(nfts, func(token : Types.Nft) : Bool { token.owner == principal });
    let tokenIds = List.map(items, func(item : Types.Nft) : Types.TokenId { item.id });
    let array = List.toArray(tokenIds);
    return array[0];

  };

};
