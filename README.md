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
* please navigate to `/bin/` directory and run `chmod +x pretty_cron.rb`
* to execute please run from within `/bin` and run for example `./pretty_cron.rb * * * * 1 /Some/Type/Of/Command`

## Tests
* in main project directory please run the command `rspec`

## Example
![example](https://github.com/ajosephides/pretty-cron-parser/blob/master/public/cron_parser_working_example_screenshot.png)

## Areas to improve
* currently the parser doesn't work with a compound expression e.g. `1,3,5,6,10-20`  or  `5-15/5`
* day of week and month do not work with 3 letter strings. Integer values only
* further error checking - currently validation tests assume input valid unless certain criteria. It is permissive rather than strict.
* printing method is a little hacky
* output doesn't validate against itself... e.g input `* * * 2 * /some/command` will output all dom (1-31) and not (1-28 or 29). Unknown if this is a requirement