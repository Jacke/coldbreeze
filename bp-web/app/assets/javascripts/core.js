var popupoverlay = require('popupoverlay');
var jsRoutesLoader = require('routeLoader');
var test1 = require('./test1.js');
//require("imports?window=>{}!exports?window.XModule!./file.js
var test1 = require('imports?this=>global!exports?global.Zeta!./test1.js');



//var a = require("script!./jsRoutes.js");
console.log('good');
//console.log(popupoverlay);
console.log(jsRoutesLoader);
console.log(jsRoutes);
console.log(test1);
//console.log(a);
//console.log(jsRoutes.load());
document.routes = jsRoutes;
document.popupoverlay = popupoverlay;
document.test1 = test1;