#!/usr/bin/env node

'use strict';

const NOW = new Date();


// https://www.npmjs.com/package/yargs
const argv = require('yargs')
  .options({
    'id': { alias: 'i', type: 'string' },
    'category': { alias: 'c', type: 'string' },
    'description': { alias: 'd', type: 'string' }
  })
  .argv;

// https://www.npmjs.com/package/request
const request = require('request');

// https://www.npmjs.com/package/user-home
var userHome = require('user-home');

// https://www.npmjs.com/package/shortid
const shortid = require('shortid');

// http://momentjs.com/
const moment = require('moment');


const config = require(userHome + '/.golconfig.json');
if (!config.api_url || !config.api_key || !config.api_secret) throw new Error();

const API_URL = config.api_url;
const API_AUTH = { user: config.api_key, pass: config.api_secret };


function callback(error, response, body) {
  if (error) throw new Error();

  const sc = response.statusCode;
  if (200 <= sc && sc < 300) {
    console.log(JSON.stringify(body));
  } else if (400 <= sc && sc < 500) {
    throw new Error(JSON.stringify(body));
  } else {
    throw new Error();
  }
}

function post() {
  const body = {
    id: shortid.generate(),
    datetime: moment(NOW).format('YYYY-MM-DD HH:mm:ss'),
    content: argv._.join(' ')
  };

  if (argv.description) body.description = argv.description;
  if (argv.category) body.category = argv.category;

  request({
    url: API_URL,
    auth: API_AUTH,
    method: 'POST',
    body: body,
    json: true,
    callback: callback
  });
}

function patch() {
  if (!argv.id) return;

  const body = {};

  if (argv._.length) body.content = argv._.join(' ');
  if (argv.description) body.description = argv.description;
  if (argv.category) body.category = argv.category;

  request({
    url: API_URL + '/id/' + argv.id,
    auth: API_AUTH,
    method: 'PATCH',
    body: body,
    json: true,
    callback: callback
  });
}

function get() {
  if (argv.id) {
    request({
      url: API_URL + '/search',
      auth: API_AUTH,
      qs: { id: argv.id },
      json: true,
      callback: callback
    });
  } else if (argv.category) {
    request({
      url: API_URL + '/search',
      auth: API_AUTH,
      qs: { category: argv.category },
      json: true,
      callback: callback
    });
  } else {
    request({
      url: API_URL,
      auth: API_AUTH,
      json: true,
      callback: callback
    });
  }
}


if (argv.id) {
  if (argv._.length || argv.description || argv.category) {
    patch();
  } else {
    get();
  }
} else if (argv._.length) {
  post();
} else {
  get();
}
