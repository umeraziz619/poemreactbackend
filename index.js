const express = require('express');
const app = express()
const db = require("./models")
const postRouter = require("./routes/Posts.js")
const Comments = require("./routes/Comments.js")
const usersRouter = require("./routes/Users.js")
const cors = require("cors");
const likesRouter = require("./routes/Likes")
app.use(cors());


app.use(express.json())
app.use("/posts",postRouter)
app.use("/comments",Comments)
app.use("/auth",usersRouter)
app.use("/likes",likesRouter)
db.sequelize.sync().then(()=>{
    app.listen(3001,()=>{
        
        console.log("server is running on the pport 3001")
    })
})