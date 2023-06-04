const express = require("express");
const router = express.Router();
const {Comments} = require("../models")
const {validteToken} = require("../Middlewavers/AuthMiddlewavers");
// const { where } = require("sequelize/types");
router.get("/:postId", async (req,res)=>{
    const postId = req.params.postId;
    const comments = await Comments.findAll({ where : {PostId : postId}})
    res.json(comments)
})
router.get("/getcomment",validteToken, async (req,res)=>{
    // const postId = req.params.postId;
    const username = req.user.username;
    const comments = await Comments.findAll({where:{username:username}})
    res.json(comments)
})
router.post("/",validteToken,async(req,res)=>{
    const comment = req.body;
    const username = req.user.username;
    comment.username = username;
    await Comments.create(comment)
    comment.username = username;
    res.json(comment)
})
router.delete("/:commentId",validteToken,async(req,res)=>{
    const commentId = req.params.commentId;
    await Comments.destroy({where:({
        id:commentId,
    })})
    res.json("deltd success")
})

module.exports = router