(function() {
    // take first h1 as title of the presentation
    var h1 = document.getElementsByTagName('h1');
    if(h1.length) {
        document.title = h1[0].textContent;
    }
}());
