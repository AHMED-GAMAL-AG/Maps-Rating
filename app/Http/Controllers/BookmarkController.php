<?php

namespace App\Http\Controllers;

use App\Models\Bookmark;
use Illuminate\Http\Request;

class BookmarkController extends Controller
{
    public function bookmark($place_id) // acts as a pivot table between the user and the place
    {
        auth()->user()->bookmarks()->toggle($place_id); // toggle() will add the user_id and the place_id to the bookmarks table if they are not there, and will remove them if they are there

        return back();
    }

    public function getAllBookmarks()
    {
        $bookmarks = auth()->user()->bookmarks; // get all the bookmarks of the authenticated user

        return view('user_bookmarks' , compact('bookmarks'));
    }
}
