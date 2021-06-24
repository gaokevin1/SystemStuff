#!/usr/bin/env bash

pgroup=$(ps -o pgid= $$ | grep -o '[0-9]*')
kill -s SIGINT "-${pgroup}"

