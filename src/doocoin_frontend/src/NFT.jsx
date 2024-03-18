import React, { useState, useEffect } from 'react';

export const NFT = () => {
  const [imageData, setImageData] = useState(null);

  const fetchImageData = async () => {
    const response = await fetch('https://qivvz-uiaaa-aaaah-qdcxq-cai.raw.icp0.io/?canisterId=bkyz2-fmaaa-aaaaa-qaaaq-cai');
    const text = await response.text(); // Get the response as text
    // Extract the Base64 data from the received HTML
    const regex = /data:image\/(png|jpeg);base64,([^"]+)/;
    const match = regex.exec(text);
  
    if (match) {
      const contentType = match[1]; // Extract image type (png or jpeg)
      const base64Data = match[2]; // Extract Base64 encoded data
  
      setImageData(`data:image/${contentType};base64,${base64Data}`);
    } else {
      console.error('Failed to extract image data from response');
    }
  };
  
  useEffect(() => {
    fetchImageData();
  }, []);

  return (
    <div>
      {imageData && (
        <img src={imageData} alt="Dooza NFT" />
      )}
    </div>
  );
};
