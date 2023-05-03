<?php

namespace Database\Seeders;

use App\Models\Review;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ReviewSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('reviews')->truncate(); // to avoid redundant data when re-run the seeder // truncate will make the id = 0 and auto increment from that but delete will auto increment from the last id for ex. 9

        Review::create([
            'review' => "ممتاز جدًا ممتاز جدًا ممتاز جدًا ممتاز جدًا ممتاز جدًا ممتاز جدًا ممتاز جدًا",
            'service_rating' => 5,
            'quality_rating' => 5,
            'cleanliness_rating' => 5,
            'pricing_rating' => 5,
            'place_id' => 1,
            'user_id' => 1,
        ]);

        Review::create([
            'review' => "جيد جدًا جيد جدًا جيد جدًا جيد جدًا جيد جدًا جيد جدًا جيد جدًا جيد جدًا",
            'service_rating' => 5,
            'quality_rating' => 4,
            'cleanliness_rating' => 3,
            'pricing_rating' => 4,
            'place_id' => 1,
            'user_id' => 2,
        ]);

        Review::create([
            'review' => " جيد جيد جيد جيد جيد جيد جيد جيد جيد جيد جيد ",
            'service_rating' => 4,
            'quality_rating' => 1,
            'cleanliness_rating' => 3,
            'pricing_rating' => 3,
            'place_id' => 1,
            'user_id' => 3,
        ]);

        Review::create([
            'review' => "  جيد جدًاجيد جدًا جيد جدًا",
            'service_rating' => 5,
            'quality_rating' => 4,
            'cleanliness_rating' => 3,
            'pricing_rating' => 4,
            'place_id' => 2,
            'user_id' => 1,
        ]);
    }
}
