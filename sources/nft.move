module openedu::nft {
    use sui::object;
    use std::string;
    use sui::url;
    use sui::tx_context;
    use sui::transfer;

    struct EDUNFT has key, store {
        id: object::UID,
        name: string::String,
        link: url::Url,
        image_url: url::Url,
        description: string::String,
        creator: string::String
    }

    public fun mint(_name: string::String, _link: vector<u8>, _image_url: vector<u8>, _description: vector<u8>, _creator: vector<u8>, ctx: &mut tx_context::TxContext){
        let nft = EDUNFT {
            id: object::new(ctx),
            name: _name,
            link: url::new_unsafe_from_bytes(_link),
            image_url: url::new_unsafe_from_bytes(_image_url),
            description: string::utf8(_description),
            creator: string::utf8(_creator)
        };
        transfer::transfer(nft, tx_context::sender(ctx));
    }
}