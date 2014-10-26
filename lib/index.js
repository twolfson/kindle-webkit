// Load in dependencies
var gui = require('nw.gui');

// Generate a frameless window for Kindle Cloud Reader
var kindleWindow = window.open('https://read.amazon.com/', {
  'user-agent': 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36'
});
var kindleWebkit = gui.Window.get(kindleWindow);

// When we close the kindleWebkit window, close the app
// https://github.com/rogerwang/node-webkit/wiki/Window#closed
kindleWebkit.on('closed', function closeApp () {
  gui.App.quit();
});
