#!/bin/bash

exec 2>&1

rm -rf dist/ peerjs/
git clone https://github.com/peers/peerjs peerjs
cd peerjs
git apply ../decoupling.diff
../node_modules/.bin/parcel build lib/exports.ts --out-file peerjs.js --no-minify
cd ../
cat imports.js dist/peerjs.js > dist/react-native-peerjs.js
rm dist/peerjs.js

echo "Done. dist/react-native-peerjs.js"

