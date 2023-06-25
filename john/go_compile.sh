#!/bin/sh 

echo "#########################"
echo "## Compile"


JOHN_VERSION="john-1.9.0-jumbo-1"
JOHN_URL="https://www.openwall.com/john/k/${JOHN_VERSION}.tar.gz"
JOHN_DIR="/opt/john-1.9.0-jumbo-1"

# Extract sources
tar zfx john/john-1.9.0-jumbo-1.tar.gz -C /opt/

# Copy patch
cp /john/john_params.h $JOHN_DIR/src/params.h

#WORKDIR $JOHN_DIR/src
# Remove --enable-simd=sse4
cd $JOHN_DIR/src 
sh configure --disable-simd --disable-openmp --disable-opencl 
# fix a bug: size of array element is not a multiple of its alignment
sed -i 's/JTR_ALIGN(\s64\s)\stypedef\sstruct/typedef\ struct\ JTR_ALIGN(\ 64\ )\ /g' blake2.h
make -s clean Cflags=-DJOHN_SYSTEMWIDE=1 && make -sj4

mkdir -p /usr/share/john
cp -R $JOHN_DIR/run/* /usr/share/john/ && chmod -R a+rx /usr/share/john \
&& cp -R $JOHN_DIR/run/* /usr/local/bin && chmod -R a+rx /usr/local/bin \
&& mkdir /home/yolo/.john && chown yolo:yolo /home/yolo/.john \
&& cp $JOHN_DIR/run/john.conf /home/yolo/.john/john.conf && chown yolo:yolo /home/yolo/.john/john.conf \
&& rm -R $JOHN_DIR/src/

