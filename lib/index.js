// Load in dependencies
var gui = require('nw.gui');

// Generate a window for Kindle Cloud Reader
var kindleWindow = window.open('https://read.amazon.com/');
var kindleWebkit = gui.Window.get(kindleWindow);

// When we close the kindleWebkit window, close the app
// https://github.com/rogerwang/node-webkit/wiki/Window#closed
kindleWebkit.on('closed', function closeApp () {
  gui.App.quit();
});
