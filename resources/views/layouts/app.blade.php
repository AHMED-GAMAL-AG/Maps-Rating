<!DOCTYPE html>
<html dir="rtl" lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">

    {{-- Font Awesome --}}
    <script src="https://kit.fontawesome.com/c49981de61.js" crossorigin="anonymous"></script>

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="crossorigin="anonymous"></script>

    <!-- Styles -->
    @livewireStyles
</head>

<body class="font-sans antialiased">
    <x-banner />

    <div class="min-h-screen bg-gray-100">
        @livewire('navigation-menu')

        <!-- Page Heading -->
        @if (isset($header))
            <header class="bg-white shadow">
                <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                    {{ $header }}
                </div>
            </header>
        @endif

        <!-- Page Content -->
        <main>
            {{ $slot }}
        </main>
    </div>

    @stack('modals')

    @livewireScripts

    {{-- for making suggestions when user types in the search field --}}
    <script>
        $(function() {
            $('#address').on('keyup', function() {
                var address = $(this).val();
                $('#address-list').fadeIn();
                $.ajax({
                    url: "{{ route('auto-complete') }}",
                    type: "GET",
                    data: {
                        "address": address
                    }
                }).done(function(data) {
                    $("#address-list").html(
                    data); // will put the data from the autoComplete method in the searchController in the div
                });
            });
            $('#address-list').on('click', 'li', function() { // when user clicks on one of the suggestions
                $('#address').val($(this).text());
                $('#address-list').fadeOut();
            });
        });
    </script>
</body>

</html>
