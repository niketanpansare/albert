#!/usr/bin/env bash

CUDA_INSTALL_PATH=/usr/local;
aws --endpoint-url https://blob.mr3.simcloud.apple.com s3 cp s3://yoda_blobby/cudnn/cudnn-10.0-linux-x64-v7.4.2.24.tar .;
tar xvf cudnn-10.0-linux-x64-v7.4.2.24.tar -C ${{CUDA_INSTALL_PATH}};
chmod a+r ${{CUDA_INSTALL_PATH}}/cuda/include/cudnn.h ${{CUDA_INSTALL_PATH}}/cuda/lib64/libcudnn*;
apt-get update;
apt-get install -y software-properties-common;
add-apt-repository --yes ppa:deadsnakes/ppa;
apt-get update;
apt-get install -y python3.6 python3.6-dev;
ln --force --symbolic /usr/bin/python3.6 /usr/bin/python3;
wget https://bootstrap.pypa.io/get-pip.py;
python3 get-pip.py;
pip3 install --upgrade turibolt --index https://pypi.apple.com/simple;
python3 -m pip install --upgrade .;
pip3 install --user --upgrade tensorflow-gpu==2.3.1 keras==2.2.4 coremltools==4.0b2 numpy nvidia-ml-py3
pip3 install -U grpcio==1.18.0;
pip3 install appleconnect_utils -i https://pypi.apple.com/simple
pip3 install sh
pip3 install heston -i https://pypi.apple.com/simple
pip3 install tfcoreml --no-deps -i https://pypi.apple.com/simple
cd ..;