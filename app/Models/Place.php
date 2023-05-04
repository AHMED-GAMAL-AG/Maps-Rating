<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Place extends Model
{
    use HasFactory;

    public function ScopeSearch($query, $request)
    {
        if ($request->category_id) { // check if the user selected a category
            $query->whereCategory_id($request->category_id);
        }

        if ($request->address) { // check if the user entered an input in the search field
            $query->where('address', 'LIKE', '%' . $request->address . '%');
        }

        return $query;
    }
}
