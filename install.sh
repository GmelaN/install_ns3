#!/bin/bash

# requirement
# install C/C++ Extension Pack on vscode

# install dependencies

echo "installing dependencies..."

echo "running: sudo apt update"
sudo apt update 2> /dev/null

echo "running: sudo apt install"

sudo apt install -y build-essential autoconf cmake automake libtool libxml2-dev \
libsqlite3-dev libgtk-3-dev gsl-bin libgsl-dev libgslcblas0 mpi-default-dev \
openmpi-bin openmpi-common openmpi-doc libboost-all-dev libbz2-dev \
zlib1g-dev python3 python3-dev python3-pygraphviz python3-dev \
python3-setuptools git-core qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools gnuplot \
gnuplot-x11 gir1.2-goocanvas-2.0 python3-gi python3-gi-cairo \
python3-pygraphviz python3-numpy python3-scipy python3-matplotlib \
python3-pandas python3-pygraphviz python3-sklearn python3-seaborn \
libfltk1.3 libfltk1.3-dev python3-pybindgen cmake libc6-dev libc6-dev-i386 \
libc6-i386 libclang-dev llvm-dev libc6-dev libc6-dev-i386 libclang-dev llvm-dev gdb  2> /dev/null


# install ns-3

echo "downloading ns-3..."
echo "running: wget"

wget https://www.nsnam.org/releases/ns-allinone-3.42.tar.bz2  2> /dev/null

echo "decompressing..."

tar -xjf "ns-allinone-3.42.tar.bz2"  2> /dev/null

cd ns-allinone-3.42

# create launch.json and tasks.json
echo "setting up vscode JSON files..."

mkdir .vscode && cd .vscode

cat <<EOF > tasks.json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build",
            "type": "shell",
            "command": "./ns-3.42/ns3 build",
            "group": {
                "kind": "build",
                "isDefault": true
            }
        },
        {
            "label": "configure",
            "type": "shell",
            "command": "./ns-3.42/ns3",
            "args": [
                "configure",
                "--enable-tests",
                "--enable-examples",
                "--disable-werror",
                "--build-profile",
                "debug"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ]
}
EOF


cat << EOF > launch.json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "debug",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${workspaceFolder}/ns-3.42/build/scratch/ns3.42-\${fileBasenameNoExtension}-debug",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "preLaunchTask": "Build",
            "environment": [
                {
                    "name": "LD_LIBRARY_PATH",
                    "value": "\${workspaceFolder}/build/lib/"
                }
            ],
            "externalConsole": false,
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        },
        {
            "name": "launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${workspaceFolder}/ns-3.42/build/scratch/ns3.42-\${fileBasenameNoExtension}-debug",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "preLaunchTask": "Build",
            "environment": [
                {
                    "name": "LD_LIBRARY_PATH",
                    "value": "\${workspaceFolder}/build/lib/"
                }
            ],
            "externalConsole": false,
        },
    ],
}
EOF

echo "install complete. please run "configure" task first and run "build" task in vscode."
