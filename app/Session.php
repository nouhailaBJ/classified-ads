<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    protected $table = "sessions";
    protected $fillable = [
        'product_id','from_id', 'message','to_id', 'status'
    ];
}
