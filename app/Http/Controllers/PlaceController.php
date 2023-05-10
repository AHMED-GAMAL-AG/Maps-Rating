<?php

namespace App\Http\Controllers;

use App\Models\Place;
use App\Traits\ReadableTrait;
use Illuminate\Http\Request;

class PlaceController extends Controller
{
    use ReadableTrait;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $places = Place::orderBy('view_count', 'desc')->take(3)->get(); // array with most visited places descending

        return view('welcome', compact('places'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('add_place');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'category_id' => 'required',
            'overview' => 'required',
            'image' => 'image|nullable',
            'address' => 'required',
            'longitude' => 'required',
            'latitude' => 'required',
        ]);

        if ($request->image) {
            $image_name = time() . '.' . $request->image->extension(); // get the image name and extension
            $request->image->storeAs('public\images' , $image_name); // store the image in the public\images folder
            $request->user()->places()->create($request->except('image') + ['image' => $image_name]); // except the old image and add the new image name to the request // create a new place with the user id in the places table
        }else{
            $request->user()->places()->create($request->all()); // create a new place with the user id in the places table
        }

        return back()->with('success', __('تم إضافة المكان بنجاح'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Place $place)
    {
        // get the place data with the reviews and the user associated with the review
        $place = $place::withCount('reviews')->with(['reviews' => function ($query) {
            $query->with('user');
            $query->withCount('likes');
        }])->find($place->id); // get the review count for the place and the reviews data // reviews.user means get the review data with the user associated with it to make the sql query faster and less

        $avg = $this->averageRating($place);
        $service_rating = $avg['service_rating'];
        $quality_rating = $avg['quality_rating'];
        $cleanliness_rating = $avg['cleanliness_rating'];
        $pricing_rating = $avg['pricing_rating'];
        $total = $avg['total'];

        return view('details', compact('place', 'service_rating', 'quality_rating', 'cleanliness_rating', 'pricing_rating', 'total'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
