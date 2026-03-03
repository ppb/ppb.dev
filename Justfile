set windows-powershell := true

# Show this help
@help:
  just --list

# Install jekyll and friends
install:
  bundle install

# Run dev server
serve:
  ./build.sh
  bundle exec jekyll serve --watch --drafts --unpublished --future --open-url -P 0 --livereload
