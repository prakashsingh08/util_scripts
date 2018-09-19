# util_scripts


### To connect to any GCP using ServiceAccount and it's key follow below procedure:

* gcloud config set project demo1-183919
* gcloud config set account test-bucket@demo1-183919.iam.gserviceaccount.com
* gcloud auth activate-service-account test-bucket@demo1-183919.iam.gserviceaccount.com --key-file=$HOME/demo1-183919-e535bb01c5da.json
* export GOOGLE_APPLICATION_CREDENTIALS="$HOME/demo1-183919-e535bb01c5da.json"
* gcloud auth list

### Listing bucket items

https://cloud.google.com/storage/docs/gsutil/commands/ls

* gsutil ls gs://bucket_name

### Viewing existing role in ServiceAccount

gcloud iam service-accounts get-iam-policy test-bucket@demo1-183919.iam.gserviceaccount.com


