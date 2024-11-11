const Joi = require('joi');
const { signup } = require('../controllers/AuthController');
const signupValidation = (req,res,next)=>{
    const schema = Joi.object({
        name:Joi.string().min(3).max(100).required(),
        email:Joi.string().email().required(),
        password:Joi.string().min(8 ).max(100).required()  
    });
    const{error} =schema.validate(req.body);
    if(error) return res.status(400).json({message:"Badrequest",error });
    next();
}
const loginValidation = (req,res,next)=>{
    const schema = Joi.object({
        email:Joi.string().email().required(),
        password:Joi.string().min(8 ).max(100).required()  
    });
    const{error} =schema.validate(req.body);
    if(error) return res.status(400).json({message:"Badrequest",error });
    next();
}
module.exports = {
    signupValidation,
    loginValidation,
}