import Types "./Types";
import Nat64 "mo:base/Nat64";
import List "mo:base/List";
import Result "mo:base/Result";



//Mint Candid mint : (principal, nat, vec record { text; GenericValue }) -> (variant { Ok : nat; Err : NftError });


actor {

  var custodians: [Text] = ["v6y2x-g3ib4-zffbg-pprid-3uhdj-jvxwj-zzqy3-p4vea-ikohi-fasvs-vqe"];
  var tokenId : Nat = 0; //Increase every time mint is called
  stable var nfts = List.nil<Types.Nft>();


  //Create a Type module to hold DIP721 specs
  //Create a Mint function that has a custom location key that points to a url
  

    public shared({ caller }) func mint(to: Principal, token_Identifier: Nat, metadata: Types.GenericValue) : async Result.Result<Nat, Types.NftError> {

      return #ok(1);
    }





};
