<x-mail::message>
<h2> مرحبًا</h2>

{{ $data['name'] }} :المستخدم
<br>
{{ $data['place_url'] }}  :أبلغ عن الرابط

<x-mail::button :url="''">
Button Text
</x-mail::button>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
