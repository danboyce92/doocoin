import React, { useState, useEffect } from 'react';
import { doocoin_backend } from 'declarations/doocoin_backend';

function App() {
  const [submitted, setSubmitted] = useState(false);
  const SubmittedCookieName = 'eggMinted';

  useEffect(() => {
    const submittedCookie = document.cookie.split(';').find(
      (item) => item.trim().startsWith(`${SubmittedCookieName}=`)
    );

    if (submittedCookie) {
      setSubmitted(true);
    }
  }, []); 

  function handleSubmit(event) {
    event.preventDefault();
    const pid = event.target.elements.pid.value;
    console.log("Egg clicked!"+ pid);
    setSubmitted(true);
    document.cookie = `${SubmittedCookieName}=true; path=/`;
    doocoin_backend.easterMint(pid).then(() => {
      setSubmitted(true);
    });
    return false;
  }

  return (
    <main>
      <div className="claim-title"><img src="claim.png" /></div>
      {!submitted ? (
      <section>

        <form action="#" onSubmit={handleSubmit}>
          <div className="input-container">
            <input id="pid" alt="Principal ID" pattern="\S{63}" required placeholder="Enter your ICP Principal ID and click the egg..." type="text" />
            <br />
            <input type="image" src="egg-button.png" className="egg-button" alt="Egg Minting Button" />
          </div>
        </form> 
      </section>
      ) : (
      <div id="message">Eggcelent! You minted a golden egg!<br />Check your wallet and keep an eye on your egg to see when it hatches.</div>
      )}
    </main>
  );
}

export default App;
