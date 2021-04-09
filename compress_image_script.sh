# Instructions: You should pass the name of file and the dpi value
# Usage example: ./compress_image_script.sh filename.pdf 300

# Not yet tested...

#References
#https://stackoverflow.com/questions/11850776/reducing-pdf-file-size-using-ghostscript-on-linux-didnt-work

#!/bin/bash
file=$1
quality=$2
filebase=$(basename $file .pdf)
#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/${quality} -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${filebase}_${quality}.pdf ${filebase}.pdf

# Example:
gs \
  -o ${filebase}_${quality}.png \
  -sDEVICE=pngalpha \
  -r300 \
   ${filebase}.pdf