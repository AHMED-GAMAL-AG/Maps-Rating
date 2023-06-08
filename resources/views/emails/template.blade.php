<x-mail::message>
<h2> مرحبًا</h2>

{{ $data['name'] }} :المستخدم
<br>
{{ $data['place_url'] }}  :أبلغت عن الرابط

<x-mail::button :url="''">
الذهاب إلى الرابط
</x-mail::button>

Thanks,<br>
maps-rating
</x-mail::message>
