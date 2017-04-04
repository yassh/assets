#!/usr/bin/env node

const argv = require('yargs').argv;
const temp = require('temp');
const Imagemin = require('imagemin');
const datauri = require('datauri');

// Automatically track and cleanup files at exit
temp.track();

argv._.forEach((srcFile, i) => {
  const destDir = temp.mkdirSync();
  new Imagemin().src(srcFile).dest(destDir).run((err, files) => {
    console.log('');
    console.log(srcFile);

    if (err) {
      console.log(err);
    } else {
      console.log(datauri(files[0].path));
    }
  });
});
