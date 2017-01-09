#!/bin/bash

git reset --hard

find . -name \*.rej | xargs rm 
