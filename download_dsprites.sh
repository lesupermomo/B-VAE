#!/bin/sh

# Change directory to the location of this script
cd "$(dirname "$0")"

# Check if the 'data' directory exists; if not, create it
if [ ! -d "data" ]; then
    mkdir data
fi

# Change to 'data' directory
cd data

# Clone the dataset if the 'dsprites-dataset' directory does not already exist
if [ ! -d "dsprites-dataset" ]; then
    git clone https://github.com/deepmind/dsprites-dataset.git
    
    # Remove unnecessary files if cloning was successful
    cd dsprites-dataset
    rm -rf .git* *.md LICENSE *.ipynb *.gif *.hdf5
else
    echo "Directory 'dsprites-dataset' already exists. Skipping clone."
fi