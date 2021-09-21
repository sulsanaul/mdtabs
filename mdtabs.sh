#!/bin/bash
echo "Getting tabs..."

PRE_DIR=../mnt/tabs
LF_DIR=last-focused
TABS_DIRS=by-title/*
OUTPUT_FILE=tabs.md

tabs_copied=0
tabs_closed=0
targets_all=false
closes_tabs=false

while getopts adx:m: opt; do
    case $opt in
        a) targets_all=true ;;
        d) closes_tabs=true ;;
        x) query=$OPTARG ;;
        m) delimiter=$OPTARG ;;
    esac
done

function capture() {
    local TITLE=`cat $1/title.txt`
    local URL=`cat $1/url.txt`

    echo "$delimiter[$TITLE]($URL)" >> $OUTPUT_FILE
}
function capturex() {
    local TITLE=`cat $1/title.txt`
    local URL=`cat $1/url.txt`

    if ! grep -iq "$query" <<< $TITLE && ! grep -iq "$query" <<< $URL; then
        echo "$delimiter[$TITLE]($URL)" >> $OUTPUT_FILE
        echo true 
    else echo false
    fi 
}
function capture_all() {
    for DIR in $PRE_DIR/$TABS_DIRS
    do
        capture $DIR
        ((tabs_copied++))
        if $closes_tabs; then 
            rm $DIR
            ((tabs_closed++))
        fi
    done
}
function capturex_all() {
    for DIR in $PRE_DIR/$TABS_DIRS
    do
        local RES=$(capturex $DIR)
        if $RES; then
            ((tabs_copied++))
            if $closes_tabs; then
                rm $DIR
                ((tabs_closed++))
            fi
        fi 
    done
}
function md_tabs() {
    if $targets_all; then
        if [ -z "$query" ]; then
            capture_all
        else
            capturex_all
        fi
    else
        capture $PRE_DIR/$LF_DIR
        ((tabs_copied++))
    fi
}

> $OUTPUT_FILE
md_tabs
cat $OUTPUT_FILE | pbcopy
echo -e "Copied $tabs_copied tab(s) to clipboard."
echo -e "Closed $tabs_closed tab(s)."
