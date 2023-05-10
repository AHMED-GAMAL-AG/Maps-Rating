<?php

namespace App\Helpers;

use Illuminate\Support\Facades\DB;

class Slug
{


    public static function uniqueSlug($slug, $table) // to make the slug unique
    {
        $slug = self::createSlug($slug);

        $items = DB::table($table)->select('slug')->whereRaw("slug like '$slug%'")->get();

        $count = count($items) + 1; // add 1 to make it unique

        return $slug . '-' . $count;
    }


    protected static function createSlug($str) // take the title replace spaces with -
    {
        $string = trim($str);
        $string = mb_strtolower($string, 'UTF-8');

        $string = preg_replace("/[\s\-_]+/", ' ', $string);
        $string = preg_replace("/[\s\_]/", '-', $string);

        return rawurldecode($string);

        return $string;
    }
}
