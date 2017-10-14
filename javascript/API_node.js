// Problem: we need a simple way to look at a user's badge count and Javascript points
// Solution: Use Node.js to connect to Treehouse's API to get profile information to print out

//function to print message to console

function printMessage(username, badgeCount, points){
  const message = ${username} has ${badgeCount} total badge(s) and ${points} points in Javascript;
  console.log(message);
 }

 printMessage("chalkers", 100, 2000000);

 