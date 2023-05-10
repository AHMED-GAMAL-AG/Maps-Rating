<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function store(Request $request) // the request has the review id that comes from the ajax request in details.blade.php
    {
        $review = Review::find($request->review_id);

        if ($request->user()->can('like-review', $review)) {

            $request->user()->likes()->toggle($request->review_id); // toggle attach or detach the like to the user reviews

            return Review::find($request->review_id)->likes()->count(); // return the count of the likes for the review to the ajax request
        }
    }
}
