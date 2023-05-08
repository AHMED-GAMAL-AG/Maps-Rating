<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function store(Request $request)
    {
        $request->user()->likes()->attach($request->review_id); // attach the review id to the user id

        return Review::find($request->review_id)->likes()->count(); // return the count of the likes for the review to the ajax request
    }
}
