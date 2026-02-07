# List all extension into a file
code --list-extensions > extensions.txt

# install all extension from a file
cat extensions.txt | xargs -L 1 code --install-extension
