<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    protected $table = "chats";
    protected $fillable = [
        'message', 'product_id', 'from', 'to', 'type','session_id'
    ];
    protected $guarded = [];

    public function user(){
        return $this->belongsTo(User::class,'from');
    }
}
