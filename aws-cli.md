'''
aws s3api list-objects --bucket sinclairtbd --query "Contents[?contains(Key, '<your-filename>')].Key"
'''
