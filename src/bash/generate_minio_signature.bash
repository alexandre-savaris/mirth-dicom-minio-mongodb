#!/bin/bash

## #########################################################################
## This script is an adaptation of the following references:
## - https://gist.github.com/PhilipSchmid/1fd2688ace9f51ecaca2788a91fec133
## - https://gist.github.com/JustinTimperio/7c7115f87b775618637d67ac911e595f
## #########################################################################

#set -x

## The content type for the upload (e.g. 'application/dicom').
if [ -z "$1" ]; then
  echo "The 'Content-Type' for the upload must be provided!"
  exit 1
fi

## The current date for the upload (e.g. 'Thu, 23 Nov 2023 18:48:18 +0000').
if [ -z "$2" ]; then
  echo "The current date for the upload must be provided!"
  exit 1
fi

## The object path for the resource to be uploaded (e.g. '/dicom/file.dcm').
if [ -z "$3" ]; then
  echo "The object path for the resource to be uploaded must be provided!"
  exit 1
fi

## The MinIO password.
if [ -z "$4" ]; then
  echo "The MinIO password must be provided!"
  exit 1
fi

CONTENT_TYPE="$1"
CURRENT_DATE_TIME="$2"
OBJECT_PATH="$3"
MINIO_PASSWORD="$4"

SIG_STRING="PUT\n\n${CONTENT_TYPE}\n${CURRENT_DATE_TIME}\n${OBJECT_PATH}"

echo -en ${SIG_STRING} | openssl sha1 -hmac ${MINIO_PASSWORD} -binary | base64

