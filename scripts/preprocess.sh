
clear
read -p 'Enter the directory path: ' directory
echo "generating models... \n"
for file in "$directory"/*; do
    echo $file
    python -m apps.obj -i $file
done
echo "computing spherical harmonics coefficients for precomputed radiance transfer (PRT)... \n"
for file in "$directory"/*; do
    python -m apps.prt_util -i $file
done
echo "generating training data... \n"
for file in "$directory"/*; do
    python -m apps.render_data -i $file -o training_data -e
done
echo "Done, ready for training"