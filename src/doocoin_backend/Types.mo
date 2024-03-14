import Principal "mo:base/Principal";
import Nat64 "mo:base/Nat64";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat32 "mo:base/Nat32";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";
import Float "mo:base/Float";
import Result "mo:base/Result";



module {

    public type Metadata =  {
        logo: ?Text;
        name: ?Text;
        created_at: Nat64;
        upgraded_at: Nat64;
        custodians: [Principal];
        symbol: ?Text;
    };

    public type GenericValue = {
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

    public type TokenProperty = {
        text: Text;
        value: GenericValue;
    };

    public type TokenMetadata = {
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

    public type NftError = {
        #SelfTransfer;
        #TokenNotFound;
        #TxNotFound;
        #SelfApprove;
        #OperatorNotFound;
        #UnauthorizedOwner;
        #UnauthorizedOperator;
        #ExistedNFT;
        #OwnerNotFound;
        #Other : Text;
    };


    public type Nft = {
        owner: Principal;
        id: TokenId;
        metadata: MetadataDesc;
    };

    public type MetadataDesc = [MetadataPart];

    public type MetadataPart = {
        purpose: MetadataPurpose;
        key_val_data: [MetadataKeyVal];
        data: Blob;
    };

    public type MetadataPurpose = {
        #Preview;
        #Rendered;
    };

    public type MetadataKeyVal = {
        key: Text;
        val: MetadataVal;
    };

    public type MetadataVal = {
        #TextContent : Text;
        #BlobContent : Blob;
        #NatContent : Nat;
        #Nat8Content: Nat8;
        #Nat16Content: Nat16;
        #Nat32Content: Nat32;
        #Nat64Content: Nat64;
    };

    public type ApiError = {
        #Unauthorized;
        #InvalidTokenId;
        #ZeroAddress;
        #Other;
    };

    public type Result<S, E> = {
        #Ok : S;
        #Err : E;
    };

    public type MintReceipt = Result<MintReceiptPart, ApiError>;

    public type TokenId = Nat64;

    public type MintReceiptPart = {
        token_id: TokenId;
        id: Nat;
    };


}
