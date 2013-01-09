#!/bin/bash

print_usage () {
    echo "USAGE:"
    echo "$0"
    echo "    \"<invoiceNumber>\""
    echo "    \"<name>\" \"<address>\" \"<zip/postal code>\" \"<city>\""
    echo "    \"<fromDate>\" \"<toDate>\""
    echo "    \"<firstName>\" \"<lastName>\" \"<hours>\" \"<rate>\""
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
    NCELLS=3    # Number of cells on consultant row
    IFS=$'\n'   # This will make the for-loop preserve spaces
    for j in ${@:8}; do
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
            CONSULTANT_COST=$(( $CONSULTANT_COST * $j ))
            echo "   {$CONSULTANT_COST}"
        # Add to the total cost cell
            TOTAL_COST=$(( ${TOTAL_COST} + $CONSULTANT_COST ))
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

