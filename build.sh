#!/bin/sh -eu

prefix() {
    tmpfile=$(mktemp)
    cat - $1 > $tmpfile
    mv $tmpfile $1
}

# Pull some files from other repos
wget https://github.com/ppb/pursuedpybear/raw/HEAD/CONTRIBUTING.md -O contributing.md
prefix contributing.md <<EOF
---
layout: default
title: How to Contribute
---
EOF

wget https://github.com/ppb/pursuedpybear/raw/HEAD/CONTRIBUTORS.md -O contributors.md
prefix contributors.md <<EOF
---
layout: default
title: Contributors
---
EOF

wget https://github.com/ppb/.github/raw/HEAD/CODE_OF_CONDUCT.md -O coc.md
prefix coc.md <<EOF
---
layout: default
title: Code of Conduct
---
EOF

# Do the build
jekyll build

# Copy some Netlify stuff to the output directory
cp _redirects _site/_redirects
