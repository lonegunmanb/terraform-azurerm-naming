error=false
cp main.tf main.tf.bak
cp outputs.tf outputs.tf.bak
go run main.go
expected=$(cat main.tf.bak | md5sum | cut -d ' ' -f1)
actual=$(cat main.tf | md5sum | cut -d ' ' -f1)
if [ "$expected" != "$actual" ]; then
      echo "main.tf need to be regenerated, you can fix this by running make generate"
      error=true
fi
rm main.tf
mv main.tf.bak main.tf
expected=$(cat outputs.tf.bak | md5sum | cut -d ' ' -f1)
actual=$(cat outputs.tf | md5sum | cut -d ' ' -f1)
if [ "$expected" != "$actual" ]; then
      echo "outputs.tf need to be regenerated, you can fix this by running make generate"
      error=true
fi
rm outputs.tf
mv outputs.tf.bak outputs.tf

if ${error}; then
  exit 1
fi
exit 0