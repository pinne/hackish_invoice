#!/bin/bash

print_usage () {
    echo "USAGE:"
    echo "$0"
    echo "    \"<invoiceNumber>\""
    echo "    \"<name>\" \"<address>\" \"<zip/postal code>\" \"<city>\""
    echo "    \"<projectDescription>\""
    echo "    \"<fromDate>\" \"<toDate>\""
    echo "    \"<consultantName>\" \"<hours>\" \"<rate>\""
}

if [[ $# -gt 4 ]]; then
    cat template_top.tex
    echo "\client"
    echo "   {${2}}"
    echo "   {${3}}"
    echo "   {${4}}"
    echo "   {${5}}"
    #echo "   {${1}}"
    cat template_mid.tex
    echo ""
    echo "\invoiceNumber"
    echo "   {${1}}"
    echo ""
    echo "\projectDetails"
    echo "   {${6}}"
    echo ""
    echo "\invoiceDate"
    echo "   {${7}}"
    echo "   {${8}}"
    cat template_mid2.tex

    TOTAL_COST=0
    # Print consultant rows
    i=0
    NCELLS=3    # Number of cells on consultant row
    IFS=$'\n'   # This will make the for-loop preserve spaces
    for j in ${@:9}; do
        ATTR=$(( ((i++)) % $NCELLS ))

        case "${ATTR}" in

        # Name cell
        0)  echo "\consultant"
            echo -e "   {${j}}"
            ;;

        # Hours cell
        1)  echo -e "   {$j}"
            CONSULTANT_COST=$j
            ;;

        # Rate cell
        2)  echo -e "   {$j}"
        # Consultant cost cell
            CONSULTANT_COST=`echo -e "$CONSULTANT_COST * $j" | bc`
            echo "   {$CONSULTANT_COST}"
        # Add to the total cost cell
            TOTAL_COST=`echo -e "$TOTAL_COST + $CONSULTANT_COST" | bc`
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

