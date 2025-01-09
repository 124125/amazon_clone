const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const {Product} = require('../models/Product');

/* add product detail on server database(mongoDB) */

adminRouter.post('/admin/add-product',admin, async (req, res) => {
    try{
        const {name, description, images, quantity, price, category} = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category
        });

        await product.save();
        res.json(product);
        
    } catch(e){
        res.status(500).json({error : e.message});
    }
});


/* send all product data to admin to show it on app */

adminRouter.get('/admin/get-products',admin, async (req,res) => {
    try{
        const products = await Product.find({});
        res.status(200).json({products});

    }catch(e){
        res.status(500).json({error : e.message});
    }
})

/*  delete product from database */

// adminRouter.delete('/admin/delete-product',admin, async (req, res) => {
//     try{
//         const {productId} = await req.body;
//         if (await Product.findByIdAndDelete(productId) == true){
//             res.status(200).json({result: true});
//         }
//         else{
//             res.status(500).json({result: false});
//         }
//     }catch(e){
//         res.status(500).json({error : e.message});
//     }
// })


adminRouter.post('/admin/delete-product',admin, async (req, res) => {
    try{
        const {productId} = await req.body;
        let product = await Product.findByIdAndDelete(productId);
        res.json(product);
        
    }catch(e){
        res.status(500).json({error : e.message});
    }
})

module.exports = adminRouter;