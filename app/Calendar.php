<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Calendar extends Model
{
    protected $table = "calendars";
    protected $fillable = [
        'event_name', 'start_date', 'end_date'
    ];
}
