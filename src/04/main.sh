#!/bin/bash

. ../03/system_info.sh
. ../03/condition.sh

if [[ $# -eq 0 ]]; then
    . ./color_choose.sh
    cb1=`grep "column1_background=" colors.conf | sed -e "s/^.\{,19\}//"`
    cf1=`grep "column1_font_color=" colors.conf | sed -e "s/^.\{,19\}//"`
    cb2=`grep "column2_background=" colors.conf | sed -e "s/^.\{,19\}//"`
    cf2=`grep "column2_font_color=" colors.conf | sed -e "s/^.\{,19\}//"`
    check=`condition $cb1 $cf1 $cb2 $cf2`
    if [[ -z $cb1 ]] || [[ -z $cf1 ]] || [[ -z $cb2 ]] || [[ -z $cf2 ]] || [[ $check -ne 1 ]]; then
        . ./default_colors.conf
        cb1=`grep "column1_background=" default_colors.conf | sed -e "s/^.\{,19\}//"`
        cf1=`grep "column1_font_color=" default_colors.conf | sed -e "s/^.\{,19\}//"`
        cb2=`grep "column2_background=" default_colors.conf | sed -e "s/^.\{,19\}//"`
        cf2=`grep "column2_font_color=" default_colors.conf | sed -e "s/^.\{,19\}//"`
        col1_back=$cb1
        col1_font=$cf1
        col2_back=$cb2
        col2_font=$cf2
        output $cb1 $cf1 $cb2 $cf2
        echo ""
        echo "Column 1 background = default (`choose $col1_back`)"
        echo "Column 1 font color = default (`choose $col1_font`)"
        echo "Column 1 background = default (`choose $col2_back`)"
        echo "Column 1 font color = default (`choose $col2_font`)"
    else 
        col1_back=$cb1
        col1_font=$cf1
        col2_back=$cb2
        col2_font=$cf2
        output $cb1 $cf1 $cb2 $cf2
        echo ""
        echo "Column 1 background = "$col1_back" (`choose $col1_back`)"
        echo "Column 1 font color = "$col1_font" (`choose $col1_font`)"
        echo "Column 1 background = "$col2_back" (`choose $col2_back`)"
        echo "Column 1 font color = "$col2_font" (`choose $col2_font`)"
    fi 
else
    echo "This script runs without parametrs. Input is unnecessary"
fi

