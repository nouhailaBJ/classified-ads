<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductImg extends Model
{
    protected $table = "products_imgs";
    protected $fillable = [
        'product_id', 'image'
    ];
}
