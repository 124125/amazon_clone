const express = require("express");
const User = require('../models/User');
const bcryptjs = require("bcryptjs");

const authRouter = express.Router();

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

        let user = new User({ name, email, password: hashPassword });
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})


authRouter.get("/api/list_users/", async (req,res) => {
    const users = await User.find();
    return res.json({users});
})


module.exports = authRouter;