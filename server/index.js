const express = require("express");
const authRouter = require("./routes/auth");
const adminRouter = require('./routes/admin');
const mongoose = require("mongoose");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

// const DB_URL = ""
const DB_URL = "mongodb://localhost:27017/amazon_clone_app"
const PORT = 3000;
const app = express();


mongoose.connect(DB_URL).then(()=>{console.log("connection successful.")}).catch((e)=>{console.error(e);});
app.use(express.json());
app.use('/',authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`server started at port : ${PORT}`)
});