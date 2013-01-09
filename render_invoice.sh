#!/bin/bash

print_usage () {
    echo "USAGE:"
    echo "$0"
    echo "    \"<invoiceNumber>\""
    echo "    \"<name>\" \"<address>\" \"<zip/postal code>\" \"<city>\""
    echo "    \"<firstName>\" \"<lastName>\" \"<hours>\" \"<rate>\" \"<cost>\""
    echo "    \"<fromDate>\" \"<toDate>\""
}

if [[ $# -gt 4 ]]; then
    cat template_top.tex
    echo "\client"
    echo "   {${2}}"
    echo "   {${3}}"
    echo "   {${4}}"
    echo "   {${5}}"
    #echo "   {${1}}"
    echo ""
    echo "\vspace*{10px}"
    echo "Invoice: \invoiceNumber"
    echo "   {${1}}"
    echo ""
    echo "\vspace*{10px}"
    echo "\invoiceDate"
    echo "   {${6}}"
    echo "   {${7}}"
    echo "\hline"
    cat template_mid.tex

    # Print consultant rows
    i=0
    for j in ${@:8}; do
        ATTR=$(( ((i++)) % 5 ))
        case "${ATTR}" in

        0)  echo "\consultant"
            echo -e "   {$j}"   # Name cell (first name)
            ;;

        1)  echo -e "   {$j}"   # Name cell (last name)
            ;;

        2)  echo -e "   {$j}"   # Hours cell
            ;;

        3)  echo -e "   {$j}"   # Rate cell
            ;;

        4)  echo -e "   {$j}"   # Consultant cost cell
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

