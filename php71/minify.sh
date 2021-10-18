#!/usr/bin/env bash
echo "Su dosyalar minify edilecek (yuicompressor ün yüklü olduğuna emin olun)"

while IFS= read -r line; do
    echo "dosya compress ediliyor: ${line}"
    java -jar /tools/yuicompressor-2.4.8.jar  ${line} -o ${line} --charset utf-8
    echo "edildi..."
done < "$1"
echo "--- bitti----"
