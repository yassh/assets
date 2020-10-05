#!/usr/bin/env node

const argv = require("yargs").argv;
const temp = require("temp");
const imagemin = require("imagemin");
const datauri = require("datauri");

// Automatically track and cleanup files at exit
temp.track();

const destDir = temp.mkdirSync();

(async () => {
  try {
    const files = await imagemin(argv._, { destination: destDir });

    for (const file of files) {
      const content = await datauri(file.destinationPath);
      console.log(content);
    }
  } catch (error) {
    console.error(error);
  }
})();
