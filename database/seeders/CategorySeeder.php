<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('categories')->truncate(); // to avoid redundant data when re-run the seeder // truncate will make the id = 0 and auto increment from that but delete will auto increment from the last id for ex. 9

        Category::create([
            'title' => "فنادق",
            'slug' => "فنادق",
        ]);

        Category::create([
            'title' => "مطاعم",
            'slug' => "مطاعم",
        ]);

        Category::create([
            'title' => "تسوق",
            'slug' => "تسوق",
        ]);

        Category::create([
            'title' => "مدارس وجامعات",
            'slug' => "مدارس-جامعات",
        ]);

        Category::create([
            'title' => "مستشفيات",
            'slug' => "مستشفيات",
        ]);

        Category::create([
            'title' => "صيدليات",
            'slug' => "صيدليات",
        ]);
    }
}
