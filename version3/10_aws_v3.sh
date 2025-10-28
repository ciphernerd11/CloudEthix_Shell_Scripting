#!/bin/bash


REGION="$1"

if [ -z "$REGION" ]; then
    echo "Usage: $0 <aws-region>"
    exit 1
elif ! command -v aws &>/dev/null; then
    echo " AWS CLI not found. Please install it first."
    exit 1
elif ! command -v jq &>/dev/null; then
    echo "'jq' not installed. Please install jq to parse json."
    exit 1
else
    echo "Fetching EC2 instance details from region: $REGION ..."
    DATA=$(aws ec2 describe-instances --region "$REGION" --output json)
fi

if [ -z "$DATA" ]; then
    echo "No data found or invalid region provided."
    exit 1
fi

echo " Instance ID           | Private IP   | Public IP"

echo "$DATA" | jq -r '
    .Reservations[].Instances[] |
    [.InstanceId, .PrivateIpAddress, (.PublicIpAddress // "N/A")] |
    @tsv
' | awk '{printf "%-22s | %-13s | %-13s\n", $1, $2, $3}'


echo " EC2 instance information retrieved successfully."

