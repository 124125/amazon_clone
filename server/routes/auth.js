const express = require("express");
const User = require('../models/User');
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

const authRouter = express.Router();

// SIGN UP route

authRouter.post('/api/signup/', async (req, res) => {
    try {
        const { name, email, password } = req.body;


        const existingUser = await User.findOne({ email: email });
        if (existingUser) {
            return res.status(400).json({ msg: "email is already in use." });
        }

        if (password.length < 6) {
            return res.status(400).json({ msg: "password is short than 6 character." });
        }

        const hashPassword = await bcryptjs.hash(password, 8);

        let user = new User({ name, email, password: hashPassword,});
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})


authRouter.post('/api/signin/', async (req, res) => {
    
    try{
        const { email, password } = req.body;

        const user = await User.findOne({ email: email });
        if (!user) {
            return res.status(400).json({ msg: "no account exist with this email address, please signup using this email to create an account." });
        }
        
        const isMatch = bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg: "Wrong Password"});
        }

        const token = jwt.sign({id: user._id},"passwordKey");
        res.json({token, ...user._doc });
        
    } catch(e){
        res.status(500).json({ error: e.error });
    }
})

// verify if token is valid or not

authRouter.post('/tokenIsValid/', async (req, res) => {
    
    try{
        const token = req.header('x-auth-token');
        if(!token) return res.json(false);

        const verified = jwt.verify(token,"passwordKey");
        if(!token) return res.json(false);

        const user = User.findById(verified.id);
        if(!user) return res.json(false);

        res.json(true);
        
    } catch(e){
        res.status(500).json({ error: e.error });
    }
});


// get user data if token is valid 

authRouter.get('/',auth, async (req,res) => {
    const user = await User.findById(req.user);
    res.json({...user._doc, token : req.token });
});

authRouter.get("/api/list_users/",auth, async (req,res) => {
    const users = await User.find();
    return res.json({users});
})


module.exports = authRouter;