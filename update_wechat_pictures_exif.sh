for pic in *.jpg ; do
    old_date=$(exiv2 -g "Exif.Image.DateTime" $pic)
    if [ ! "$old_date" ];then
      date=$(date -d @$( echo $pic | egrep -o '[0-9]{10}' ) +'%Y:%m:%d %k:%M:%S')
      echo "Updating $pic with date $date"
      exiv2 -M"set Exif.Image.DateTime Ascii $date" $pic
    fi
done
