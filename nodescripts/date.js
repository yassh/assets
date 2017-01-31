#!/usr/bin/env node

const moment = require('moment');

const date = moment().format('YYYY-MM-DDTHH:mmZ');
console.log(date);
