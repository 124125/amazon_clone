const express = require("express");
const authRouter = require("./routes/auth");
const mongoose = require("mongoose");

// const DB_URL = "mongodb+srv://devilsmachine:devilsmachine@cluster0.uzitvym.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
const DB_URL = "mongodb://localhost:27017/amazon_clone_app"
const PORT = 3000;
const app = express();


mongoose.connect(DB_URL).then(()=>{console.log("connection successful.")}).catch((e)=>{console.error(e);});
app.use(express.json())
app.use('/',authRouter)

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`server started at port : ${PORT}`)
})