FROM debian:stretch as builder

ARG ZXING_VERSION=2.1.0

ADD sources.list /etc/apt/sources.list
RUN --mount=type=cache,id=apt-cache,target=/var/cache/apt set -x && \
    apt update && \
    apt install -y \
        debian-archive-keyring && \
    apt install -y \
        build-essential \
        cmake \
        pkg-config \
        g++ \
        gcc \
        libde265-dev \
        libjpeg-dev \
        libpng-dev \
        libwebp-dev \
        libx265-dev

ADD http://security.debian.org/debian-security/pool/updates/main/g/glibc/libc6_2.28-10+deb10u2_amd64.deb /tmp
ADD http://security.debian.org/debian-security/pool/updates/main/c/curl/libcurl4_7.64.0-4+deb10u6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/r/rhash/librhash0_1.3.8-1_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/libu/libuv1/libuv1_1.24.1-1+deb10u1_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.44.5-1+deb10u3_amd64.deb /tmp
ADD http://security.debian.org/debian-security/pool/updates/main/k/krb5/libgssapi-krb5-2_1.17-3+deb10u5_amd64.deb /tmp
ADD http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb10u6_amd64.deb /tmp
ADD http://security.debian.org/debian-security/pool/updates/main/k/krb5/libk5crypto3_1.17-3+deb10u5_amd64.deb /tmp
ADD http://security.debian.org/debian-security/pool/updates/main/k/krb5/libkrb5-3_1.17-3+deb10u5_amd64.deb /tmp
ADD http://security.debian.org/debian-security/pool/updates/main/k/krb5/libkrb5support0_1.17-3+deb10u5_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/c/cmake/cmake-data_3.18.4-2+deb11u1~bpo10+1_all.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/c/cmake/cmake_3.18.4-2+deb11u1~bpo10+1_amd64.deb /tmp
ADD http://security.debian.org/debian-security/pool/updates/main/liba/libarchive/libarchive13_3.3.3-4+deb10u3_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/libz/libzstd/libzstd1_1.3.8+dfsg-3+deb10u2_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-defaults/cpp_8.3.0-1_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/g++-8_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-defaults/gcc_8.3.0-1_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/gcc-8_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-defaults/g++_8.3.0-1_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/cpp-8_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/m/mpclib3/libmpc3_1.1.0-1_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/m/mpfr4/libmpfr6_4.0.2-1_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/i/isl/libisl19_0.20-2_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/gcc-8-base_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libcc1-0_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/b/binutils/binutils_2.31.1-16_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/b/binutils/libbinutils_2.31.1-16_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/b/binutils/binutils-common_2.31.1-16_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/b/binutils/binutils-x86-64-linux-gnu_2.31.1-16_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libgcc-8-dev_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libgcc1_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libgomp1_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libitm1_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libatomic1_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libasan5_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/liblsan0_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libtsan0_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libubsan1_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libmpx2_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libquadmath0_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libstdc++-8-dev_8.3.0-6_amd64.deb /tmp
ADD http://ftp.de.debian.org/debian/pool/main/g/gcc-8/libstdc++6_8.3.0-6_amd64.deb /tmp

RUN set -x && \
    dpkg -i --auto-deconfigure /tmp/*.deb ; \
    dpkg -r libcomerr2 ; \
    dpkg -i --auto-deconfigure /tmp/*.deb

ADD https://github.com/zxing-cpp/zxing-cpp/archive/refs/tags/v${ZXING_VERSION}.tar.gz /
ADD zxing.patch /

WORKDIR /

RUN set -x && \
    tar xfz v${ZXING_VERSION}.tar.gz && \
    patch zxing-cpp-${ZXING_VERSION}/zxing.cmake /zxing.patch && \
    cmake -S zxing-cpp-${ZXING_VERSION} -B zxing-cpp.release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WRITERS=OFF -DBUILD_READERS=ON -DBUILD_EXAMPLES=OFF && \
    cmake --build zxing-cpp.release -j8 && \
    cd zxing-cpp.release && \
    cpack -G DEB

FROM debian:stretch as built

ARG ZXING_VERSION=2.1.0
COPY --from=builder /zxing-cpp-${ZXING_VERSION}/_packages/zxing_${ZXING_VERSION}_amd64.deb /tmp