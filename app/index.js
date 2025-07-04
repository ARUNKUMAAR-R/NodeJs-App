const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Application deployed on azure app services !!!');
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});

