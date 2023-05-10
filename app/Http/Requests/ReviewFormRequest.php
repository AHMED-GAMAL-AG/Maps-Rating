<?php

namespace App\Http\Requests;

use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Foundation\Http\FormRequest;

class ReviewFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        $this->redirect = url()->previous() . '#review-div'; // redirect to the previous page to the review div

        return [
            'review' => 'required|min:5',
            'service_rating' => 'required',
            'quality_rating' => 'required',
            'cleanliness_rating' => 'required',
            'pricing_rating' => 'required',
        ];
    }

    // use validation in lang folder instead
    // public function messages()
    // {
    //     return [
    //         'review.required' => 'حقل المراجعة فارغ',
    //         'review.min' => 'محتوى المراجعة قصير جدًا'
    //     ];
    // }

    public function failedAuthorization()
    {
        throw new AuthorizationException(__('لا تمتلك صلاحية إضافة مراجعة، فضلًا سجل دخولك للموقع')); // for custom 403 message in 403.blade.php
    }
}
