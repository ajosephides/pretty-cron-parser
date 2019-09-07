# Deliveroo tech test.

## Introduction
This is cron expression pretty printer as part of the technical interview for Deliveroo.

> Write a command line application or script which parses a cron string and expands each field to show the times at which it will run.

>You should not spend more than three hours on this exercise. If you do not have time to handle all possible cron strings, then an app which handles a subset of them correctly is better than one which does not run or produces incorrect results.

## Prerequisite
* ruby version 2.6.0
* bundler

## Installation
* please clone repo
* please run `bundle install`
* please navigate to `/bin/' directory and run `chmod + x pretty_cron.rb`
* to execute please run from within `/bin` and run for example `./pretty_cron.rb * * * * 1 /Some/Type/Of/Command`

## Tests
* in main project directory please run the command `rspec`

## Example
![](ADD URL HERE)

## Known issues to do work on
* currently the parser doesn't work with a compound expression e.g. `1,3,5,6,10-20`  or  `5-15/5`
* day of week and month do not work with 3 letter strings. Integer values only
* further error checking
* printing method is a little hacky