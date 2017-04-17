.pragma library
var scaleFactor;

var defWidth = 900;
var defHeight = 480;

function config(screen) {
    var defRatio = defWidth / defHeight;
    var ratio = screen.width / screen.height;

    var width = 0;
    var height = 0;

    if (ratio < defRatio) {
        width = screen.width;
        height = width / defRatio;
    } else {
        height = screen.height;
        width = height * defRatio;
    }

    scaleFactor = height / defHeight;
}

