# Clean previous build cache (if any)
rm -rf build
make clean
# Reconfigure NVCC environment variables + CMake flags
# Initialize System Paths
export CUDA_PATH=/usr/local/cuda
export CXX=g++-13
export CC=gcc-13
export NVCC=/usr/local/cuda/bin/nvcc
export LDFLAGS="-lstdc++"
export PATH=$PATH:/usr/local/cuda/bin
# Force the NVCC to shut-up about compute_70 deprecation
export NVCC_PREPEND_FLAGS="-Wno-deprecated-gpu-targets"
# Cont...
NVCC_CCBIN=/usr/bin/g++-13 CUDAHOSTCXX=/usr/bin/g++-13 CC=gcc-13 CXX=g++-13 
#
make -j 10 src.build NVCC_GENCODE="-gencode=arch=compute_70,code=sm_70 -gencode=arch=compute_75,code=sm_75 -gencode=arch=compute_75,code=compute_75"

# When building for private runs, use below to save time
# NVCC_GENCODE="-gencode=arch=compute_70,code=sm_70"