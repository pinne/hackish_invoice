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
    cat template_top.tex
    echo "\client"
    echo "   {${2}}"
    echo "   {${3}}"
    echo "   {${4}}"
    echo "   {${5}}"
    echo "   {${1}}"
    echo ""
    echo "\vspace*{10px}"
    echo "\invoiceDate"
    echo "   {${6}}"
    echo "   {${7}}"
    echo "\hline"
    cat template_mid.tex

    i=0
    for j in ${@:8}; do
        ATTR=$(( ((i++)) % 5 ))
        case "${ATTR}" in

        0)  echo "\consultant"
            echo -e "   {$j}"
            ;;

        1)  echo -e "   {$j}"
            ;;

        2)  echo -e "   {$j}"
            ;;

        3)  echo -e "   {$j}"
            ;;

        4)  echo -e "   {$j}"
            TOTAL_COST=$(( ${TOTAL_COST} + $j ))
            ;;

        esac
    done

    echo ""
    echo "   \\\\"
    echo "   \hline"
    echo "   \totalCost"
    echo "      {${TOTAL_COST}}"
    cat template_end.tex
else
    print_usage
fi

