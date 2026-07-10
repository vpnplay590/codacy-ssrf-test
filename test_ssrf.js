// Test file for ESLint
const http = require('http');

http.get('http://169.254.169.254/latest/meta-data/', (resp) => {
  let data = '';
  resp.on('data', (chunk) => { data += chunk; });
  resp.on('end', () => { console.log(data); });
}).on("error", (err) => {
  console.log("Error: " + err.message);
});
