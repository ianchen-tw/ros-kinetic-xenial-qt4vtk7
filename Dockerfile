FROM ianre657/ros-kinetic-desktop-full-nvidia

WORKDIR /root

    # dependency for qt4
RUN apt-get update && apt-get install -y \
    qt4-default  qt4-dev-tools  libqt4-dev 

    # dependency for vtk7
RUN apt-get update && apt-get install -y \
    libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev \
    libvtk-java

    # additional
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk

    # compile vtk7
RUN git clone https://github.com/Kitware/VTK.git \
    && cd VTK \
    && git checkout v7.1.1 \
    && mkdir build && cd build \
    && export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    && cmake .. \
        -DVTK_Group_Qt:BOOL=ON \
        -DVTK_WRAP_JAVA:BOOL=ON \
        -DVTK_WRAP_PYTHON=ON \
    && make -j$(nproc) -l$(nproc) install