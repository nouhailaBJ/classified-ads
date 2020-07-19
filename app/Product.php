<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = "products";
    protected $fillable = [
        'title', 'description', 'tags', 'status', 'price', 'cat_id','sub_id', 'image','user_id','location'
    ];
}
