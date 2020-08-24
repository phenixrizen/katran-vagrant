# Update packages
sudo apt-get update

# Install Git
sudo apt-get install git -y

# Git Katran
git clone https://github.com/facebookincubator/katran.git

# Install Katran Deps
cd katran
./getdeps.sh 

# Build bpf
./build_bpf_modules_opensource.sh

# Build Katran
./build_katran.sh

# Show message about successfully install
echo "Everything done, you can now play with the eample Katran server and client"