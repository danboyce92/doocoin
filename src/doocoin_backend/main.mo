import Types "./Types";
import Doos "./Doos";
import Nat64 "mo:base/Nat64";
import List "mo:base/List";
import Result "mo:base/Result";



//Mint Candid mint : (principal, nat, vec record { text; GenericValue }) -> (variant { Ok : nat; Err : NftError });


shared actor class Dip721NFT(custodian: Principal, init : Types.Dip721NonFungibleToken) = Self {
  stable var transactionId: Types.TransactionId = 0;
  stable var custodians = List.make<Principal>(custodian);
  var tokenId : Nat = 0; //Increase every time mint is called
  stable var nfts = List.nil<Types.Nft>();
  let dooBase64 = Doos.doo;

  //Create a Type module to hold DIP721 specs
  //Create a Mint function that has a custom location key that points to a url
  

    // public shared({ caller }) func mint(to: Principal, token_Identifier: Nat, metadata: Types.GenericValue) : async Result.Result<Nat, Types.NftError> {
    //   return #ok(1);
    // }


  public shared({ caller }) func mintDip721(to: Principal, metadata: Types.MetadataDesc) : async Types.MintReceipt {
    if (not List.some(custodians, func (custodian : Principal) : Bool { custodian == caller })) {
      return #Err(#Unauthorized);
    };

    let newId = Nat64.fromNat(List.size(nfts));
    let nft : Types.Nft = {
      owner = to;
      id = newId;
      metadata = metadata;
    };

    nfts := List.push(nft, nfts);

    transactionId += 1;

    return #Ok({
      token_id = newId;
      id = transactionId;
    });
  };


};
