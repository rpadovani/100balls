#!/bin/sh

xgettext -o po/100balls.pot --package-name 100balls --qt --c++ --add-comments=TRANSLATORS --keyword=tr `find . -type f -name "*.qml"`
