<?php

namespace App\Http\Controllers;

use App\Models\Place;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function autoComplete(Request $request)
    {
        if ($request->address) { // check if the user entered an input in the search field
            $input = $request->address;
            $data = Place::where('address', 'LIKE', "%$input%")->get(); // search for the input in the database

            // make a list of the results
            $output = '<ul class= "bg-gray-100 px-6">';
            foreach ($data as $row) {
                $output .= '<li class="flex items-center justify-between my-4">' . $row->address . '</li>';
            }
            $output .= '</ul>';

            return $output; // will be send to the ajax .done function in the layouts.app
        }
    }
}
