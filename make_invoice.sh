#!/bin/bash
#
# Varm kod - skers@kth.se 2013
# 
# Wrapper script for render_invoice.sh
# This takes arguments and passes them on to render_invoice.sh
# It then outputs a PDF file using pdflatex.
#

MYPATH=hackish_invoice

print_usage () {
    echo "USAGE:"
    echo "$0"
    echo "    \"<invoiceNumber>\""
    echo "    \"<name>\" \"<address>\" \"<zip/postal code>\" \"<city>\""
    echo "    \"<fromDate>\" \"<toDate>\""
    echo "    \"<firstName>\" \"<lastName>\" \"<hours>\" \"<rate>\""
}

if [[ $# -gt 4 ]]; then
    FNAME=$1
    cd $MYPATH
    . render_invoice.sh "$@" > $FNAME.tex
    pdflatex $FNAME.tex
    rm $FNAME.aux
    rm $FNAME.log
    rm $FNAME.tex
    cd -
    echo "PDF DONE: $FNAME"
else
    print_usage
fi
