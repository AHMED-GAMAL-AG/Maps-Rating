<x-app-layout>
    <x-slot name="header">
        @include('includes/header')
    </x-slot>

    <div class="py-12">
        @if (!$places->count())
            <div class="text-blue-900 px-6 py-4 rounded relative bg-gray-200 max-w-7xl mx-auto">
                <span class="inline-block align-middle mr-8">
                    {{ __('لا يوجد مواقع ضمن هذا التصنيف.') }}
                </span>
            </div>
        @else
            <div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-4">
                <div>
                    @foreach ($places as $place)
                        <div class="flex mb-5 bg-white">
                            <div class="flex-none w-48 relative">
                                <a href="{{ route('place.show', [$place->id, $place->slug]) }}">
                                    <img src="{{ $place->image }}" alt="" class="absolute inset-0 w-full h-full object-cover" />
                                </a>
                            </div>
                            <div class="flex-auto p-6">
                                <div class="flex flex-wrap">
                                    <h1 class="flex-auto text-xl font-semibold">
                                        {{ $place->name }}
                                    </h1>
                                </div>
                                <div class="flex space-x-3 mb-4 text-sm font-medium mt-5">
                                    <div class="flex-auto flex space-x-3">
                                        {{ $place->address }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>

                <div class="ml-3">
                    <div id="mapid" style="height: 500px"></div>
                </div>
                <div>
        @endif
    </div>

</x-app-layout>

<script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js" integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
<script>
    var longitude = {!! $places->pluck('longitude') !!};
    var latitude = {!! $places->pluck('latitude') !!};
    var names = {!! $places->pluck('name') !!};

    var map = L.map('mapid');

    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);

    var markers = [];

    for (var i = 0; i < longitude.length; i++) { // loop through the array and add markers to show the places
        var placeName = names[i];

        var marker = L.marker([latitude[i], longitude[i]]).addTo(map);

        marker.bindPopup(placeName).openPopup();

        markers.push(marker);
    }

    var group = new L.featureGroup(markers).getBounds();

    map.fitBounds(group); // auto zoom to show all the markers
</script>

