#!/bin/sh

set -e

: "${SCW_ACCESS_KEY?SCW_ACCESS_KEY environment variable must be set}"
: "${SCW_SECRET_KEY?SCW_SECRET_KEY environment variable must be set}"
: "${SCW_REGION?SCW_REGION environment variable must be set}"

cat <<EOF > ~/.s3cfg
[default]
signature = s3v4
use_https = True

bucket_location = ${SCW_REGION}
host_base = s3.${SCW_REGION}.scw.cloud
host_bucket = %(bucket)s.s3.${SCW_REGION}.scw.cloud

# Bucket Website feature configuration (https://www.scaleway.com/en/docs/s3-bucket-website-console/)
website_endpoint = https://%(bucket)s.s3-website.%(location)s.scw.cloud/
website_index = index.html # Website index filename
website_error = error.html # Website error filename

access_key = ${SCW_ACCESS_KEY}
secret_key = ${SCW_SECRET_KEY}
EOF

# Run and preserve output for consumption by downstream actions
s3cmd "$@" >"${GITHUB_WORKSPACE}/s3cmd.output"

# Write output to STDOUT
cat "${GITHUB_WORKSPACE}/s3cmd.output"
