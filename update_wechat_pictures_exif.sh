for pic in *.jpg ; do
    date=$(date -d @$( echo $pic | egrep -o '[0-9]{10}' ) +'%Y:%m:%d %k:%M:%S')
    echo "Updating $pic with date $date"
    exiv2 -M"set Exif.Image.DateTime Ascii $date" $pic
done
