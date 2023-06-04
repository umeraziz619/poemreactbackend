const express = require("express");
const router = express.Router();
const {Users} = require("../models")
const bcrypt = require("bcrypt")
const {sign} = require("jsonwebtoken")
const{validteToken} = require("../Middlewavers/AuthMiddlewavers")
// router.post()

router.post("/",async (req,res)=>{
    const {username,password} = req.body;
    bcrypt.hash(password,10).then((hashs)=>{
        Users.create({
            username:username,
            password:hashs,
        })
        res.json("success")
    })
})
router.post('/login',async (req,res)=>{
    const {username,password} = req.body;
    const user = await Users.findOne({where:{username:username}});
    if(!user){
        res.json({error:"Hey User doesn't eixt in the Database"})
    }
    else{
        bcrypt.compare(password,user.password).then((match)=>{
            if(!match){
                res.json("password not match please try again")
            }else{
                const accessToken = sign({username:user.username,id:user.id},"importantstring")
                res.json({token:accessToken,username:username,id:user.id})
            }
            
        })
    }
})
router.get("/auth",validteToken,(req,res)=>{
    res.json(req.user)
})

module.exports = router;