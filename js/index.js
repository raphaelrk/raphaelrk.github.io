/*
var blockSize = 0; // Math.min(window.innerWidth, window.innerHeight)/5;
var blockPadding = Math.min(window.innerWidth, window.innerHeight)/4/2; // blockSize / 5;
var colors = ["dd0000", "dd7700", "ddaa00", "dddd00", "aadd00", "77dd00", "00dd00", "00ddaa", "0000dd", "7700dd", "aa00dd", "dd00dd", "dd77dd", "ddaadd", "ddccdd", "dddddd"];
var div = '<div style="position:absolute; left: 50%;">';
var s = div + '<table style="position: absolute; transform: translate(-50%, 0px);">';
for(var i = 0; i < 4; i++) {
    s += '<tr style="padding: ' + blockPadding + 'px">';
    for(var j = 0; j < 4; j++) {
        var col = 'background-color: #' + colors[4*i + j] + ';';
        var pad = 'padding: ' + blockPadding + 'px;';
        var size = 'size: ' + blockSize + 'px;';
        var round = 'border-radius: 5px;';
        s += '<td style="' + col + pad + size + round + '">';
        s += i*4 + j + 1;
        s += '</td>';
    }
    s += '</tr>';
}
s += '</table></div>';
document.getElementsByTagName("body")[0].innerHTML += s;
*/