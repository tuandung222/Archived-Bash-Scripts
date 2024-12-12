# convert to html, include the image in html

NOTEBOOK_NAME=test_openai_api.ipynb
HTML_NAME_PREFIX=image_classification_result
! jupyter nbconvert --to html --output $HTML_NAME_PREFIX $NOTEBOOK_NAME
