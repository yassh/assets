#!/usr/bin/env node

'use strict';

const argv = require('yargs')
  .alias('s', 'service').describe('s', 'サービスを指定する')
  .boolean('q').alias('q', 'quote').describe('q', '引用符で囲む')
  .boolean('w').alias('w', 'week').describe('w', '期間指定: 1週間以内')
  .boolean('m').alias('m', 'month').describe('m', '期間指定: 1か月以内')
  .boolean('y').alias('y', 'year').describe('y', '期間指定: 1年以内')
  .boolean('j').alias('j', 'ja').describe('j', '日本語のページを検索')
  .boolean('e').alias('e', 'en').describe('e', '英語のページを検索')
  .boolean('r').alias('r', 'ru').describe('r', 'ロシア語のページを検索')
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

    if (argv.ja) data.lang = 'ja';
    if (argv.en) data.lang = 'en';
    if (argv.ru) data.lang = 'ru';
  break;

  case 'l':
  case 'linguee':
    baseUrl = 'http://www.linguee.jp/search?';

    data.query = argv.quote ? `"${query}"` : query;
  break;

  case 'g':
  case 'google':
  default:
    baseUrl = 'https://www.google.co.jp/search?';

    data.q = argv.quote ? `"${query}"` : query;

    if (argv.week) data.tbs = 'qdr:w';
    if (argv.month) data.tbs = 'qdr:m';
    if (argv.year) data.tbs = 'qdr:y';

    if (argv.ja) data.lr = 'lang_ja';
    if (argv.en) data.lr = 'lang_en';
    if (argv.ru) data.lr = 'lang_ru';
  break;
}

const url = baseUrl + param(data);
console.log(url);
opener(url);
