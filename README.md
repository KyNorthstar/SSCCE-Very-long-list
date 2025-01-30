# SSCCE-Very-long-list

This is  short, self-contained, correct example of behavior in SwiftUI scrolling a very long list.

This demo allows you to test SwiftUI's `LazyVStack` with up to 192,759,564 simple generated text-only items.


## Why? 

I created this on my 2019 Intel MacBook Pro to see if I could replicate a performance issue.

This demo showcases procedurally generating millions of entries and scrolling the whole list with no issue, using only standard, simple, built-in SwiftUI components & best-practices. 

Running this, you'll be able to change that length on-the-fly with no hiccups.

However, at least with my setup, when I adjust the list length when I'm scrolled **to the bottom of the list**, it lags.
When I'm removing thousands of items like this, it freezes for a couple seconds.
When I'm removing millions of items like this, it freezes for several minutes.
There's some other condition which triggers that same behavior, but I haven't been able to pin it down.

When it's scrolled to the top, though? Everything is just fine. Usually. Sometimes it freezes there too.

I don't know if this is related to the performance issue I was trying to replicate, but it's certainly behvior worth considering.
