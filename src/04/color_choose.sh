#!/bin/bash

function choose() {
    if [[ $1 -eq 1 ]]; then
        echo "white"
    elif [[ $1 -eq 2 ]]; then
        echo "red"
    elif [[ $1 -eq 3 ]]; then
        echo "green"
    elif [[ $1 -eq 4 ]]; then
        echo "blue"
    elif [[ $1 -eq 5 ]]; then
        echo "purple"
    else
        echo "black"
    fi
}