import Principal "mo:base/Principal";
import Nat64 "mo:base/Nat64";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat32 "mo:base/Nat32";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";
import Float "mo:base/Float";



module {

    type Metadata =  {
        logo: ?Text;
        name: ?Text;
        created_at: Nat64;
        upgraded_at: Nat64;
        custodians: [Principal];
        symbol: ?Text;
    };

    type GenericValue = {
        Nat64Content : Nat64;
        Nat32Content : Nat32;
        BoolContent : Bool;
        Nat8Content : Nat8;
        Int64Content : Int64;
        IntContent : Int;
        NatContent : Nat;
        Nat16Content : Nat16;
        Int32Content : Int32;
        Int8Content : Int8;
        FloatContent : Float;
        Int16Content : Int16;
        BlobContent : [Nat8];
        NestedContent : GenericValue;
        Principal : Principal;
        TextContent : Text;
    };

    type TokenProperty = {
        text: Text;
        value: GenericValue;
    };

    type TokenMetadata = {
        transferred_at: ?Nat64;
        transferred_by: ?Principal;
        owner: ?Principal;
        operator: ?Principal;
        properties: [TokenProperty];
        is_burned: Bool;
        token_identifier: Nat;
        burned_at: ?Nat64;
        burned_by: ?Principal;
        approved_at: ?Nat64;
        approved_by: ?Principal;
        minted_at: Nat64;
        minted_by: Principal;
    };



}
