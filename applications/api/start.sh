#!/bin/sh

mix do deps.get, compile
mix phoenix.server
