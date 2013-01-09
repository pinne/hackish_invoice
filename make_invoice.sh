#!/bin/bash

print_usage () {
    echo "USAGE:"
    echo "$0"
    echo "    \"<invoiceNumber>\""
    echo "    \"<name>\" \"<address>\" \"<zip/postal code>\" \"<city>\""
    echo "    \"<fromDate>\" \"<toDate>\""
    echo "    \"<firstName>\" \"<lastName>\" \"<hours>\" \"<rate>\" \"<cost>\""
}

if [[ $# -gt 4 ]]; then
    ./render_invoice.sh $@ > source.tex
    FNAME=$1
    mv source.tex $FNAME.tex
    pdflatex $FNAME.tex
else
    print_usage
fi
