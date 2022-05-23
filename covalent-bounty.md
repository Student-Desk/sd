# Covalent integration for getting NFTs metadata

https://github.com/Student-Desk/sd/blob/master/src/pages/MIntedNftPosts.js

```javascript

 const covalent = Moralis.Plugins.covalent;
    async function getMintedNft() { 
        const ids = [...tokenid];
        const result = await covalent.getNftTokenIdForContract({
            chainId: 80001,
            contractAddress: tokenAddres,
        }) 
        const dd = result.data.items && result.data.items.map(async (e) => {
            ids.push(e.token_id); 
        })
        setTokenid(ids);
    }

    useEffect(() => {
        Moralis.initPlugins();
        getMintedNft();
    }, []);

    useEffect(async () => {
        const getUri = [...data];
        const tokenUriData = [...uriData];
        const metadata = [...meta];

        for (let index = 0; index < tokenid.length; index++) {
            const element = tokenid[index];
            const res = await covalent.getNftExternalMetadataForContract({
                chainId: 80001,
                contractAddress: tokenAddres,
                tokenId: element,
            }) 
            getUri.push(res.data);
        }
        setData(getUri);

        for (let index = 0; index < getUri.length; index++) {
            const element = getUri[index];
      
            tokenUriData.push(element.items[0].nft_data[0].token_url);
        }

        for (let index = 0; index < tokenUriData.length; index++) {
            const element = tokenUriData[index];
           
            var newStr = element.replace("http://10.128.0.18", "https://ipfs.moralis.io:2053");
            const dd = await axios.get(newStr);
        
            metadata.push(dd.data);
        }
        setMeta(metadata);
    }, [tokenid]);
 

```
