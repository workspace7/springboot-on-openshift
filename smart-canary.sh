#!/bin/bash 

set -eu

source ./setenv.sh

$TUTORIAL_HOME/scripts/clean.sh tutorial

! kubectl create -f $TUTORIAL_HOME/istiofiles/destination-rule-recommendation-v1-v2.yml -n tutorial

! kubectl create -f $TUTORIAL_HOME/istiofiles/virtual-service-recommendation-v1.yml -n tutorial

# send v2 to safari
! kubectl replace -f $TUTORIAL_HOME/istiofiles/virtual-service-safari-recommendation-v2.yml -n tutorial