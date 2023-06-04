const express = require("express");
const router = express.Router();
const {Likes} = require("../models")
const {validteToken} = require("../Middlewavers/AuthMiddlewavers")


router.post("/",validteToken,async(req,res)=>{
    try {
        
   
    const {PostId} = req.body;
    const UserId = req.user.id;
    const found = await Likes.findOne({where:{PostId:PostId,UserId:UserId}});
    if(!found){
        await Likes.create({PostId:PostId,UserId:UserId});
        res.json({liked:true})
        }
        else{
            await Likes.destroy({
                where:{
                    PostId:PostId,UserId:UserId
                }
            })
            res.json({liked:false})
        }
    } catch (error) {
        console.log(error)

    }
    
})


module.exports = router