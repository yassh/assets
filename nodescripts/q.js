#!/usr/bin/env node

'use strict';

const argv = require('yargs')
  .alias('s', 'service').describe('s', 'サービスを指定する')
  .alias('l', 'lang').describe('l', '対象言語を指定する')
  .boolean('q').alias('q', 'quote').describe('q', '引用符で囲む')
  .boolean('w').alias('w', 'week').describe('w', '期間指定: 1週間以内')
  .boolean('m').alias('m', 'month').describe('m', '期間指定: 1か月以内')
  .boolean('y').alias('y', 'year').describe('y', '期間指定: 1年以内')
  .help('h').alias('h', 'help')
  .argv;
const param = require('jquery-param');
const opener = require('opener');

const query = argv._.join(' ');
let baseUrl = '';
const data = {};

switch (argv.service) {
  case 't':
  case 'twitter':
    baseUrl = 'https://twitter.com/search?';

    data.q = argv.quote ? `"${query}"` : query;

    if (argv.lang) data.lang = argv.lang;
  break;

  case 'r':
  case 'realtime':
    baseUrl = 'http://realtime.search.yahoo.co.jp/search?';

    data.p = argv.quote ? `"${query}"` : query;
  break;

  case 'l':
  case 'linguee':
    baseUrl = 'http://www.linguee.jp/search?';

    data.query = argv.quote ? `"${query}"` : query;
  break;

  case 'tatoeba':
    baseUrl = 'https://tatoeba.org/sentences/search?';

    data.query = argv.quote ? `"${query}"` : query;
  break;

  case 'g':
  case 'google':
  default:
    baseUrl = 'https://www.google.co.jp/search?';

    data.q = argv.quote ? `"${query}"` : query;

    if (argv.lang) data.lr = `lang_${argv.lang}`;

    if (argv.week) data.tbs = 'qdr:w';
    if (argv.month) data.tbs = 'qdr:m';
    if (argv.year) data.tbs = 'qdr:y';
  break;
}

const url = baseUrl + param(data);
console.log(url);
opener(url);
