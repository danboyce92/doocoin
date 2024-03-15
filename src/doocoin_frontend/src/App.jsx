import { useState } from 'react';
// import { doocoin_backend } from 'declarations/doocoin_backend';

function App() {
  function handleSubmit(event) {
    event.preventDefault();
    const pid = event.target.elements.pid.value;
    doocoin_backend.foundEgg(pid).then(() => {
      // hide form
      // show message
      // set cookie
    });
    return false;
  }

  return (
    <main>

<section>
<form action="#" onSubmit={handleSubmit}>
<div class="input-container">
  <input id="pid" alt="Principal ID" placeholder="Enter your ICP Principal ID and click the egg..." type="text" />
 <br /><br /> <input type="image" src="egg-button.png" class="egg-button" alt="Egg Minting Button" />
 </div>
</form>







      
</section>
      <section id="message">Congrats, you just minted a golden egg! Check your wallet and keep an eye on your egg to see when it hatches.</section>
    </main>
  );
}

export default App;
