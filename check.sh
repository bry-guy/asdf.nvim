#!/bin/bash

# Define ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Initialize a flag to indicate if any version is missing
missing_version=false

# Read each line from .tool-versions and check if the tool is installed with the correct version
while read -r line; do
  # Skip empty lines
  if [ -z "$line" ]; then
    continue
  fi

  tool=$(echo "$line" | awk '{print $1}')

  # Extracting all versions for the tool into an array
  versions=$(echo "$line" | cut -d ' ' -f 2-)

	# Split the versions into an array
	IFS=' ' read -ra varr <<< "$versions"

  # Checking each version
  for version in "${varr[@]}"; do
	  if asdf list "$tool" 2>/dev/null | grep -q "$version"; then
		  echo -e "${GREEN}$tool $version is installed.${NC}"
	  else
		  echo -e "${RED}Missing $tool version $version.${NC}"
	  fi
  done
done < .tool-versions

# Exit with code 1 if any versions were missing
if [ "$missing_version" = true ]; then
  exit 1
fi
