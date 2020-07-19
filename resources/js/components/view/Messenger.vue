<style>
.message-history {
    overflow: scroll;
    height: 800px;
}
.messages {
    overflow: scroll;
    height: 400px;
}
</style>
<template>
    <div class="main-content-area clearfix">
        <div  v-if="$gate.isAuth()">
            <!-- =-=-=-=-=-=-= Main Content Area =-=-=-=-=-=-= -->
            <div >
                <!-- =-=-=-=-=-=-= Breadcrumb =-=-=-=-=-=-= -->
                <div class="page-header-area-2 gray">
                    <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="small-breadcrumb">
                                <div class="header-page">
                                <h1>Messenger</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div> 
                <!-- =-=-=-=-=-=-= Latest Ads =-=-=-=-=-=-= -->
                <!-- COURSE CONCERN -->
                <section class="section-padding no-top gray">
                    <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-xs-12 col-sm-12 ">
                            <div class="message-body">
                                <div class="col-md-4 col-sm-5 col-xs-12">
                                <div class="message-inbox">
                                    <div class="message-header">
                                        <h4>Inbox</h4>
                                    </div>
                                    <ul class="message-history">
                                        <!-- LIST ITEM -->
                                        <li class="message-grid" v-for="session in sessions" :key="session.id" @click.prevent="selectUser(session.id)">
                                            <a href="#">
                                            <div class="image">
                                                <img  :src="'/uploads/avatar/'+session.user.avatar" alt="">
                                            </div>
                                            <div class="user-name">
                                                <div class="author">
                                                    <span>{{ session.user.name }}</span>
                                                    <div class="user-status"></div>
                                                </div>
                                                <p>{{ session.product.title }}</p>
                                                <div class="time">
                                                    <span><i class="icon-envelope"></i></span>
                                                </div>
                                            </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                </div>
                                <div class="col-md-8 clearfix col-sm-5 col-xs-12 message-content">
                                <div class="message-details">
                                    <div class="author" v-if="messages.session">
                                        <div class="image">
                                            <img :src="'/uploads/avatar/'+messages.session.user.avatar" alt="">
                                        </div>
                                        <span class="author-name" >{{ messages.session.user.name }}</span>
                                        <em>{{messages.session.user.created_at | myDay}}</em>
                                    </div>
                                    <h2><a href="#" v-if="messages.session">{{ messages.session.product.title }}</a></h2>
                                    <h2><a href="#" v-if="!messages.session">Select A conversation</a></h2>
                                    <div role="alert" v-if="messages.session" class="alert alert-success alert-dismissible alert-outline">
                                        <strong>Message </strong> - {{ messages.session.message }}
                                    </div>
                                    <ul class="messages" v-chat-scroll>
                                        <li :class="`clearfix  ${message.user.id == messages.session.user.id ? 'friend-message' : 'my-message'}`"  v-for="message in messages.messages" :key="message.id">  
                                            <figure class="profile-picture">
                                            <img :src="'/uploads/avatar/'+message.user.avatar" class="img-circle" alt="Profile Pic">
                                            </figure>
                                            <div class="message">
                                           {{ message.message}}
                                            <div class="time"><i class="fa fa-clock-o"></i> {{ message.created_at | myDay}}</div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="chat-form ">
                                            <div class="form-group">
                                            <input  v-if="messages.session" style="width: 100%" name="message" v-model="message" @keyup.enter="sendMessage" placeholder="Type a message here..." class="form-control" type="text">
                                            <input v-else disabled  style="width: 100%" placeholder="Type a message here..." class="form-control" type="text">
                                            </div>
                                            <button v-if="messages.session" @click="sendMessage" class="btn btn-theme" >Send</button>
                                            <button v-else disabled class="btn btn-theme" >Send</button>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </section>
            </div>
            <!-- Main Content Area End --> 
        </div>
        <div  v-if="!$gate.isAuth()">
            not load
        </div>
    </div>
    
</template>

<script>
    export default {
        data()
        {
            return {
                sessions:{},
                messages: [],
                message: ''
            }
        },
        methods:
        {
            getUser()
            {
                axios.get('api/userList').then( ({data}) => this.sessions = data)
            },
            selectUser(id)
            {
                 axios.get('api/userMessage/'+id).then( ({data}) => this.messages = data)
            },
            sendMessage(e)
            {
                if(this.message!=''){
                    axios.post('/api/sendmessage',{message:this.message,user_id:this.messages.session.user.id, session_id: this.messages.session.id})
                    .then(response=>{
                        this.selectUser(this.messages.session.id);
                    })
                    this.message = '';
                }
            },
        },
        created()
        {
            this.getUser()
             Echo.private(`chat.${authuser.id}`)
            .listen('MessageSend', (e) => {
                this.selectUser(e.message.session_id);
                // console.log(e.message.message);
            });
        },
        mounted()
        {
           
        }
    }
</script>
