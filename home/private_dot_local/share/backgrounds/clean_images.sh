#!/bin/bash

check_extension() {
	for extension in $1; do
		[ "${2##*.}" == "$extension" ] && return 0
	done
	return 1
}


for fname in *; do
	# already avif image
	if check_extension "avif" "$fname"; then
		continue
	fi

	# conversion to avif not supported
	if ! check_extension "jpeg jpg png" "$fname"; then
		echo "[NS]" "$fname"
		continue
	fi

	# convert to avif and update slides
	fname_avif="$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)".avif
	echo "[OK]" "$fname"
	avifenc "$fname" "$fname_avif" > /dev/null
	rm -rf "$fname"
done
