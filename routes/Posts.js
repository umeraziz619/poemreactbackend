const express = require("express");
const router = express.Router();
const { Posts, Likes } = require("../models");
const { validteToken } = require("../Middlewavers/AuthMiddlewavers");
// router.post()
router.get("/", validteToken, async (req, res) => {
  // res.send("Hello world "
  const listOfPosts = await Posts.findAll({ include: [Likes] });
  const likedPosts = await Likes.findAll({ where: { UserId: req.user.id } });
  res.json({ listOfPosts: listOfPosts, likedPosts: likedPosts });
});
router.get("/userpost",validteToken, async (req, res) => {
  // const username = req.user.username;
  //   comment.username = username;
  const username = req.user.username;
  const listOfPosts = await Posts.findAll({where:{username:username}, include: [Likes]});
  const likedPosts = await Likes.findAll({ where: { UserId: req.user.id } });
  res.json({listOfPosts,likedPosts})
});
router.get("/homeposts",async(req,res)=>{
  const listOfPosts = await Posts.findAll({ include: [Likes] });
  res.json(listOfPosts)
})
router.get("/byId/:id", async (req, res) => {
  const id = req.params.id;
  const post = await Posts.findByPk(id);
  res.json(post);
});
router.post("/", validteToken, async (req, res) => {
  const post = req.body;
  post.username = req.user.username;
  await Posts.create(post);
  res.json(post);
  console.log(post);
});
router.delete("/:postId", validteToken, async (req, res) => {
  const postId = req.params.postId;
 
    await Posts.destroy({
        where:{
            id:postId
        },
    })
    res.json("Post delted successfully")
});

module.exports = router;
