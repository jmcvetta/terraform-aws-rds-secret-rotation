#!/usr/bin/env bash
#===============================================================================
#
# Fetch latest code for Lambda functions from Github
#
#===============================================================================

set -x

CHECKOUT_DIR=`pwd`
TMPDIR=`mktemp -d -t terraform-aws-rds-secret-rotation.XXXXXXXXXX`


cd $TMPDIR

git clone git@github.com:aws-samples/aws-secrets-manager-rotation-lambdas.git

cd aws-secrets-manager-rotation-lambdas

cp -r SecretsManager*Rotation* $CHECKOUT_DIR/functions/

rm -rf $TMPDIR
