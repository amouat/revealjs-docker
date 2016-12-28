(function() {
    // take first h1 or h2 as title of the presentation
    var hs = document.querySelectorAll("h1, h2");
    if(hs.length) {
        document.title = hs[0].textContent;
    }
}());
