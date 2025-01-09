const express = require('express');
const auth = require('../middlewares/auth');
const { Product } = require('../models/Product');
const User = require('../models/User');
const userRouter = express.Router();



userRouter.post('/api/add-to-cart',auth, async (req, res) => {
    try{
        const { id } = req.body;
        const product = Product.findById(id);
        let user = User.findById(req.user);
        
        if(user.cart.length == 0){
            user.cart.push({product, quantity: 1});
        } else {
            isProductFound = false;
            for( let i = 0; i < user.cart.length;i++){
                if( user.cart[i].product._id.equals(product._id)){
                    isProductFound = true;
                }   
            }
            if(isProductFound){
                let producttt = user.cart.find((productt) => productt.product._id.equals(product._id));
                producttt.quantity +=1;
            } else{
                user.cart.push({product, quantity: 1});
            }
        }
        
        user = await user.save();
        res.json(user);
    } catch(e){
        res.status(500).json({error : e.message});
    }
});

module.exports = userRouter;