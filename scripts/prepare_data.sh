
#!/bin/bash

## Run this script as ./prepare_data.sh 3DChairs   or  ./prepare_data.sh dsprites or  ./prepare_data.sh CelebA

# Change to the root directory of the script and create the data directory if it does not exist
cd "$(dirname "$0")"/.. 
mkdir -p data 
cd data

if [ "$1" = "3DChairs" ]; then

    # Define paths
    dataset_dir="3DChairs/images"
    tar_file="rendered_chairs.tar"
    root="rendered_chairs"

    # Check if the dataset already exists in 3DChairs/images folder
    if [ -d "$dataset_dir" ]; then
        echo "3DChairs dataset already exists. Exiting."
        exit 0
    fi

    # Check if rendered_chairs.tar is available; if not, download it
    if [ ! -f "$tar_file" ]; then
        echo "Downloading 3DChairs dataset..."
        wget https://www.di.ens.fr/willow/research/seeing3Dchairs/data/rendered_chairs.tar
    fi

    # Extract the dataset
    echo "Extracting dataset..."
    tar -xvf "$tar_file"
    rm "$root/all_chair_names.mat"

    # Prepare target directory
    mkdir -p "$dataset_dir"
    n=1

    # Move and rename images
    for dir in "$root"/*; do
        for imgpath in "$dir"/renders/*; do
            imgname=$(basename "$imgpath")
            newpath="$dataset_dir/${n}_$imgname"
            mv "$imgpath" "$newpath"
            n=$((n+1))
        done
    done

    # Clean up extracted directory
    rm -rf "$root"
    rm -f "$tar_file"

    echo "3DChairs dataset setup complete."

elif [ "$1" = "dsprites" ]; then

    # Create dataset folder if it does not exist
    if [ -d "dsprites-dataset" ]; then
        echo "Dsprites-dataset dataset already exists. Exiting"
        exit 0
    fi

    echo "Cloning dsprites dataset..."
    git clone https://github.com/deepmind/dsprites-dataset.git
    
    # Remove unnecessary files if cloning was successful
    cd dsprites-dataset
    rm -rf .git* *.md LICENSE *.ipynb *.gif *.hdf5

    echo "dsprites dataset setup complete."

elif [ "$1" = "CelebA" ]; then

    # Check if CelebA dataset already exists
    if [ -d "CelebA/img_align_celeba" ]; then
        echo "CelebA dataset already exists. Exiting."
        exit 0
    fi
    
    # Unzip and organize CelebA dataset
    if [ ! -f "img_align_celeba.zip" ]; then
        echo "Downloading CelebA dataset from Google Drive..."
        gdown "https://drive.google.com/uc?id=0B7EVK8r0v71pZjFTYXZWM3FlRnM"
    fi

    echo "Unzipping CelebA dataset..."
    unzip img_align_celeba.zip
    mkdir -p CelebA
    mv img_align_celeba CelebA
    rm img_align_celeba.zip

    echo "CelebA dataset setup complete."

else
    echo "Invalid argument. Please specify one of '3DChairs', 'dsprites', or 'CelebA' to set up the dataset."
fi
