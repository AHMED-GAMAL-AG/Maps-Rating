<form action="" method="post">
    @csrf
    <div class="flex flex-row p-5">
        <div class="w-6/12">
            <input id="address" name="address" type="text" autocomplete="off" class="p-2 w-full bg-gray-200 rounded-md" placeholder="{{ __('حدد العنوان') }}">

            <div id="address-list">
                {{-- the div address-list is filled from the ajax request in the layouts.app view --}}
            </div>
        </div>

        <div class="w-6/12">
            <select class="mr-5 bg-gray-200 w-full rounded-md" name="category">
                <option value="">{{ __('حدد التصنيف ') }}</option>
            </select>
        </div>

        <div class="mr-5">
            <button type="submit"
                class="py-2 px-5 bg-gray-500 hover:bg-gray-400 text-white mr-5 rounded-md">{{ __('بحث') }}
            </button>
        </div>
    </div>
</form>

<section class="m-auto text-center">
    <div class="category mt-5">
        <ul>
            @foreach ($categories as $category)
                <li>
                    <a href="" class="bg-blue-900 hover:bg-gray-400">
                        {{ $category->title }}</a>
                </li>
            @endforeach
        </ul>
    </div>
</section>
