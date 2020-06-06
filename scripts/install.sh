
mvn clean install
echo "Copy files to remote server"
scp -r -i C:\Users\tonyi\Projects\AWS\aws-key.pem target ubuntu@3.135.224.42:/tmp/lib
echo "Files copied success"

ssh -i C:\Users\tonyi\Projects\AWS\aws-key.pem ubuntu@3.135.224.42 << EOF

pgrep java | xargs kill -9
nohup java -jar quarkus-0.1-runner.jar &

EOF

echo "Bye"