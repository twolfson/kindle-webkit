// Load in dependencies
var gui = require('nw.gui');

gui.App.clearCache();

// Generate a frameless window for Kindle Cloud Reader
var kindleWindow = window.open('http://read.amazon.com/');
var kindleWebkit = gui.Window.get(kindleWindow);

// When we close the kindleWebkit window, close the app
// https://github.com/rogerwang/node-webkit/wiki/Window#closed
kindleWebkit.on('closed', function closeApp () {
  gui.App.quit();
});
