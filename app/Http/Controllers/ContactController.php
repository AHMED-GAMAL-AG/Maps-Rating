<?php

namespace App\Http\Controllers;

use App\Mail\SendReport;
use App\Models\Report;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function create()
    {
        return view('report');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required',
            'email' => 'required',
            'place_url' => 'required',
        ]);

        Report::create($data);
        Mail::send(new SendReport($request->all()));

        return back()->with('success', 'تم إرسال الإبلاغ بنجاح');
    }
}
