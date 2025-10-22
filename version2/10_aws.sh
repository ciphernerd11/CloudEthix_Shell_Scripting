#!/bin/bash


REGION="$1"

if [ -z "$REGION" ]; then
    echo "Usage: $0 <aws-region>"
    exit 1
fi

if ! command -v aws &>/dev/null; then
    echo " AWS CLI not found. Please install it first."
    exit 1
fi

echo "Fetching EC2 instance details from region: $REGION ..."
DATA=$(aws ec2 describe-instances --region "$REGION" --output json)

if ! command -v jq &>/dev/null; then
    echo " 'jq' not installed. Please install jq to parse JSON."
    exit 1
fi


echo " Instance ID           | Private IP   | Public IP"

echo "$DATA" | jq -r '
    .Reservations[].Instances[] |
    [.InstanceId, .PrivateIpAddress, (.PublicIpAddress // "N/A")] |
    @tsv
' | awk '{printf "%-22s | %-13s | %-13s\n", $1, $2, $3}'


echo " EC2 instance information retrieved successfully."

