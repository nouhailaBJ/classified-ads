export default class Gate{

    constructor(user){
        this.user = user;
    }


    isAuth(){
        return this.user;
    }

}