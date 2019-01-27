#!/bin/bash

env=$1
echo "env = $env";

# source ./org.$env.properties

admin=$2;
echo "creds=$admin";
curl -X GET https://api.enterprise.apigee.com/v1/organizations/rodvina-eval/companies -H 'Content-Type: application/json' -u $admin
