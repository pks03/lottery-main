# Lottery
<h1>A lottery system using solidity</h1>
<hr>
It is a lottery system inspired from ancient Chinese lottery game.
How does the lottery work ? The lottery is managed by a manager externally. Manager interacts with the smart contract to see the total balance and declare the winner.
<br><br>
<ol>
<li>Each player has to deposit a fixed amount of ETH which is 1 ETH to the smart contract.</li>
<li>Player is allowed to make multiple deposits which can increase chances of winning</li>
<li>Manager can declare a winner once there are a minimum of 3 participants in the lottery.</li>
<li>A very large number is created using blocks-timestamp and difficulty</li>
<li>This number will be divided by number of players</li>
<li>Remainder will be the index of the array of players registered sequentially.</li>
<li>Winner is declared and is transferred the total balance of the lottery smart contract.</li>

</ol>
<b>WINNER IS DECLARED!!!</b>
