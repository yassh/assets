#!/usr/bin/env node

'use strict';

const argv = require('yargs')
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

const obj = { q: argv._.join(' ') };

if (argv.q) { obj.q = '"' + obj.q + '"'; }

if (argv.w) { obj.tbs = 'qdr:w'; }
if (argv.m) { obj.tbs = 'qdr:m'; }
if (argv.y) { obj.tbs = 'qdr:y'; }

if (argv.j) { obj.lr = 'lang_ja'; }
if (argv.e) { obj.lr = 'lang_en'; }
if (argv.r) { obj.lr = 'lang_ru'; }

const url = `https://www.google.co.jp/search?${param(obj)}`;
console.log(url);
opener(url);
