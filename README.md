#Make invoice PDF

Very ugly, but still pretty, invoice using LaTeX and nasty scripts.

##Usage

###Input
    ./make_invoice
        "<invoiceNumber>"
        "<clientName>" "<clientAddress>" "<clientPostalCode>" "<clientCity>"
        "<projectDescription>"
        "<fromDate>" "<toDate>"
        "<consultantName>" "<hours>" "<rate>"
        "<consultantName>" "<hours>" "<rate>"
        "<consultantName>" "<hours>" "<rate>"
        . . .

###Output
    <invoiceNumber>.pdf

###Example
    ./make_invoice.sh "7ecc677" "Red Hat Enterprises" "Elite steet 3117" "90 201" "Raleigh" "January 1 2013" "January 31 2013" "Simon Kerouac" "120" "135" "David Wozniak" "145" "135"

