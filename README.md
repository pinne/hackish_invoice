#Make invoice PDF

Very ugly, but still pretty, invoice using LaTeX and nasty scripts.

##Usage:
    ./make_invoice
        "<invoiceNumber>"
        "<name>" "<address>" "<postal code>" "<city>"
        "<fromDate>" "<toDate>"
        "<firstName>" "<lastName>" "<hours>" "<rate>" "<cost>"
        "<firstName>" "<lastName>" "<hours>" "<rate>" "<cost>"
        "<firstName>" "<lastName>" "<hours>" "<rate>" "<cost>"
        "<firstName>" "<lastName>" "<hours>" "<rate>" "<cost>"
        . . .

##Example
    ./make_invoice.sh "7ecc677" "Red Hat Enterprises" "Elite steet 3117" "90 201" "Raleigh" "January 1 2013" "January 31 2013" "Simon" "Kers" "120" "135" "10424" "David" "Wikmans" "125" "135" "24450"
    
##Output
    <invoiceNumber>.pdf
