#!/bin/bash
#
# Varm kod - skers@kth.se 2013
# 
# Wrapper script for render_invoice.sh
# This takes arguments and passes them on to render_invoice.sh
# It then outputs a PDF file using pdflatex.
#

print_usage () {
    echo "USAGE:"
    echo "$0"
    echo "    \"<invoiceNumber>\""
    echo "    \"<name>\" \"<address>\" \"<zip/postal code>\" \"<city>\""
    echo "    \"<fromDate>\" \"<toDate>\""
    echo "    \"<firstName>\" \"<lastName>\" \"<hours>\" \"<rate>\""
}

if [[ $# -gt 4 ]]; then
    ./render_invoice.sh "$@" > source.tex
    FNAME=$1
    mv source.tex $FNAME.tex
    pdflatex $FNAME.tex
else
    print_usage
fi
