AWS CLI common commands

Find a specific filename in a bucket
```
aws s3api list-objects --bucket sinclairtbd --query "Contents[?contains(Key, '<your-filename>')].Key"
```
