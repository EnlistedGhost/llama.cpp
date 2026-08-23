# Reconfigure NVCC environment variables + CMake flags
PATH=$PATH:/usr/local/cuda/bin
# Force the NVCC to shut-up about compute_70 deprecation
export NVCC_PREPEND_FLAGS="-Wno-deprecated-gpu-targets"
# Cont...
NVCC_CCBIN=/usr/bin/g++-13 CUDAHOSTCXX=/usr/bin/g++-13 CC=gcc-13 CXX=g++-13 
#
make -j 10 src.build NVCC_GENCODE="-gencode=arch=compute_70,code=sm_70"