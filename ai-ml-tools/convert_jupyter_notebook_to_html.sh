#!/bin/bash
# Description: Convert Jupyter notebook to HTML with embedded images
# Usage: Edit NOTEBOOK_NAME and HTML_NAME_PREFIX variables, then run

set -e

NOTEBOOK_NAME="test_openai_api.ipynb"
HTML_NAME_PREFIX="image_classification_result"

echo "Converting $NOTEBOOK_NAME to HTML..."
jupyter nbconvert --to html --output "$HTML_NAME_PREFIX" "$NOTEBOOK_NAME"

echo "Conversion complete! Output: ${HTML_NAME_PREFIX}.html"
