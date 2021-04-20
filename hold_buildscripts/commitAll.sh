cd cherokee-transliteration
git add .
git commit -m "$1"
git push
cd ../cherokeeconjugation
git add .
git commit -m "$1"
git push
cd ../newced
git add .
git commit -m "$1"
git push
cd ../cherokeeservices
git add .
git commit -m "$1"
git push

