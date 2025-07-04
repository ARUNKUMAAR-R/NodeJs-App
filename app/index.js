const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Azure App service successfully running on Development deployment slot!!!');
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});

