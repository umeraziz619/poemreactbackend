module.exports = (sequelize,DataType)=>{
    const Users = sequelize.define("Users",{
        username:{
            type: DataType.STRING,
            allowNull: false,
        },
        password:{
            type: DataType.STRING,
            allowNull: false,
        },
    });

     Users.associate =(models)=>{
        Users.hasMany(models.Likes,{
            onDelete:"cascade"
        })
    }
    return Users;
}