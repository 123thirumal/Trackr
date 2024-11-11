const AuthRouter = require('./routes/authRouter.js')
const express = require('express')
const app = express()
const bodyParser = require('body-parser');
const cors = require('cors')



require('dotenv').config();
require('./models/db.js')

const PORT  = process.env.PORT || 5000;
app.use(bodyParser.json());
app.use(cors())
app.use('/auth',AuthRouter)
app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server is listening on port ${PORT}`);
});