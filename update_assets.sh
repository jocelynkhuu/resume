#!/bin/bash
set -e

# Download latest CSS + JS from your live site
echo "Fetching latest assets from https://khuuj.com/ ..."
curl -s https://khuuj.com/ | grep -Eo 'main\.min\.[^"]+\.css' | head -1 | xargs -I{} curl -O https://khuuj.com/{}
curl -s https://khuuj.com/ | grep -Eo 'bundle\.min\.[^"]+\.js' | head -1 | xargs -I{} curl -O https://khuuj.com/{}

# Rename to static filenames (no hash)
mv main.min.*.css main.min.css
mv bundle.min.*.js bundle.min.js

echo "✅ Downloaded and renamed assets: main.min.css, bundle.min.js"

# Update index.html to use local copies
if grep -q "khuuj.com/main.min" index.html; then
  sed -i.bak 's#https://khuuj.com/main\.min\.[^"]*\.css#main.min.css#g' index.html
  sed -i.bak 's#https://khuuj.com/bundle\.min\.[^"]*\.js#bundle.min.js#g' index.html
  sed -i.bak 's#crossorigin="anonymous"##g' index.html
  echo "✅ Updated index.html to use local assets"
else
  echo "⚠️ index.html not modified (URLs not found)"
fi

# Clean up backup
rm -f index.html.bak
