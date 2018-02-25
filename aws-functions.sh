awsgetprivateip() {
  aws ec2 describe-instances --instance-id "$1" | jq -r '.Reservations[].Instances[].PrivateIpAddress'
}

awsgetpublicip() {
  aws ec2 describe-instances --instance-id "$1" | jq -r '.Reservations[].Instances[].NetworkInterfaces[].Association.PublicIp'
}

awsgetimageid() {
  aws ec2 describe-images | jq '.Images[] | select(.Name | contains("$1")) | .ImageId'
}
