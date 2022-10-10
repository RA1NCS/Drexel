function returnRand() {
    var rand = Math.floor(Math.random() * 6);
    return rand;
}

var x = returnRand();

function writeRandomText() {
    var items = new Array();
    items[0] = "Yorkshire with Roast and Gravy";
    items[1] = "Duck Confit";
    items[2] = "Ravioli in Pesto";
    items[3] = "Butter Chicken with Rice";
    items[4] = "Red Red";
    items[5] = "Peking Duck";
    document.write(items[x]);
}

function outputImage() {
    var images = new Array();
    images[0] = "images/UK/yorkroast.webp"; //
    images[1] = "images/France/duckconfit.webp"; //
    images[2] = "images/Italy/pestoRavioli.jpg"; //
    images[3] = "images/India/butterchicken.jpg"; //
    images[4] = "images/Africa/redred.jpg"; //
    images[5] = "images/China/pekingduck.webp";
    return images[x];
}

/***************************************************************************************
 *    Title: Impressive Webs
 *    Author: Louis Lazaris
 *    Date: August 8, 2022
 *    Code version: v1.0
 *    Availability: https://www.impressivewebs.com/fading-in-page-on-load-with-css-javascript/
 *
 ***************************************************************************************/

function printImage() {
    document.write('<img src="' + outputImage() + '">');
}

window.addEventListener('DOMContentLoaded', function() {
    document.body.className = 'visible';
});
