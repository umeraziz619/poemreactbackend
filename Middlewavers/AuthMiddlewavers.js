const {verify} = require("jsonwebtoken")
const validteToken = (req,res,next)=>{
    const accessToken = req.header("accessToken");

    if(!accessToken) return res.json({error:"user not exist at"});
    try {
        const validToken = verify(accessToken,"importantstring");
        req.user = validToken;
        if(validToken){
            next()
        }
    } catch (error) {
        res.json({error:error})
    }
}
module.exports ={validteToken}