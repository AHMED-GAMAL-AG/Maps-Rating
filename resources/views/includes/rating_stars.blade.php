@for ($i = 1; $i <= 5; $i++)
    @if ($i <= $rating)
        <span class="fa fa-star" aria-hidden="true"></span>
        {{-- for ex if total eq 3.5 it will be rounded to 4 then if i = 4 show half star --}}
    @elseif($i == round($rating))
        <span class="fa fa-star-half-o fa-flip-horizontal" aria-hidden="true"></span>
    @else
        <span class="fa fa-star-o" aria-hidden="true"></span>
    @endif
@endfor
