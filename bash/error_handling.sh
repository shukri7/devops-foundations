#!/bin/bash

set -o pipefail 

cat nonexistentfile | grep "something"