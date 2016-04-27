#!/usr/bin/env node

'use strict';

const argv = require('yargs')
  .options({
    'quote': { alias: 'q', type: 'boolean', describe: '引用符で囲む' },
    'lang': { alias: 'l', type: 'string', describe: '対象言語を指定する' },
    'week': { alias: 'w', type: 'boolean', describe: '期間指定: 1週間以内' },
    'month': { alias: 'm', type: 'boolean', describe: '期間指定: 1か月以内' },
    'year': { alias: 'y', type: 'boolean', describe: '期間指定: 1年以内' },
    'twitter': { alias: 'tw', type: 'boolean', describe: 'Twitterで検索する' },
    'realtime': { alias: 'rt', type: 'boolean', describe: 'リアルタイム検索する' },
    'github': { alias: 'gh', type: 'boolean', describe: 'GitHubで検索する' },
    'linguee': { alias: 'lg', type: 'boolean', describe: 'Lingueeで検索する' },
    'tatoeba': { alias: 'tt', type: 'boolean', describe: 'Tatoebaで検索する' },
    'google': { alias: 'gg', type: 'boolean', describe: 'Googleで検索する' }
  })
  .help('help').alias('help', 'h')
  .argv;
const param = require('jquery-param');
const opener = require('opener');

function open(baseUrl, data) {
  const url = baseUrl + param(data);
  console.log(url);
  opener(url);
}

const query = argv.quote ? '"' + argv._.join(' ') + '"' : argv._.join(' ');

let notYet = true;

if (argv.twitter) {
  notYet = false;
  const data = { q: query };
  if (argv.lang) data.lang = argv.lang;
  open('https://twitter.com/search?', data);
}

if (argv.realtime) {
  notYet = false;
  const data = { p: query };
  open('http://realtime.search.yahoo.co.jp/search?', data);
}

if (argv.github) {
  notYet = false;
  const data = { type: 'Code', q: query };
  if (argv.lang) data.l = argv.lang;
  open('https://github.com/search?', data);
}

if (argv.linguee) {
  notYet = false;
  const data = { query: query };
  open('http://www.linguee.jp/search?', data);
}

if (argv.tatoeba) {
  notYet = false;
  const data = { query: query };
  open('https://tatoeba.org/sentences/search?', data);
}

if (argv.google || notYet) {
  notYet = false;
  const data = { q: query };
  if (argv.week) data.tbs = 'qdr:w';
  if (argv.month) data.tbs = 'qdr:m';
  if (argv.year) data.tbs = 'qdr:y';
  if (argv.lang) data.lr = `lang_${argv.lang}`;
  open('https://www.google.co.jp/search?', data);
}
