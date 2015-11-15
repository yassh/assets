#!/usr/bin/env node

var argv = require("yargs").argv;
var temp = require("temp");
var Imagemin = require("imagemin");
var datauri = require("datauri");

// Automatically track and cleanup files at exit
temp.track();

argv._.forEach(function(srcFile, i) {
  var destDir = temp.mkdirSync();
  new Imagemin().src(srcFile).dest(destDir).run(function(err, files) {
    console.log("");
    console.log(srcFile);

    if (err) {
      console.log(err);
    } else {
      console.log(datauri(files[0].path));
    }
  });
});
