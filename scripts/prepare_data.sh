
#!/bin/bash

## Run this script as ./prepare_data 3DChairs    or     ./prepare_data dsprites, etc 

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
        echo "Dataset already exists in $dataset_dir. Exiting."
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
    if [ ! -d "dsprites-dataset" ]; then
        echo "Cloning dsprites dataset..."
        git clone https://github.com/deepmind/dsprites-dataset.git
        
        # Remove unnecessary files if cloning was successful
        cd dsprites-dataset
        rm -rf .git* *.md LICENSE *.ipynb *.gif *.hdf5
        echo "dsprites dataset setup complete."
    else
        echo "Directory 'dsprites-dataset' already exists."
    fi

elif [ "$1" = "CelebA" ]; then

    # Check if CelebA dataset already exists
    if [ -d "CelebA/img_align_celeba" ]; then
        echo "CelebA dataset already exists. Exiting."
        exit 0
    fi

    # TODO: DOWNLOAD THE DATASET IF IT IS NOT DOWNLOADED BY USER

    # Unzip and organize CelebA dataset
    if [ ! -f "img_align_celeba.zip" ]; then
        echo "Please download img_align_celeba.zip and place it in the current directory."
        exit 1
    fi

    echo "Unzipping CelebA dataset..."
    unzip img_align_celeba.zip
    mkdir -p CelebA
    mv img_align_celeba CelebA
    echo "CelebA dataset setup complete."

else
    echo "Invalid argument. Please specify one of '3DChairs', 'dsprites', or 'CelebA' to set up the dataset."
fi
