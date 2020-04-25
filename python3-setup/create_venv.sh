destination=$1
set -e
set -x
ml suite/intel-parallel_studio_2019_3
python3 -m venv --without-pip $destination
(
    set -e
    source ${destination}/bin/activate
    cd ${destination}/bin
    wget --timestamp https://bootstrap.pypa.io/get-pip.py
    ${destination}/bin/python get-pip.py
    rm get-pip.py
    pip3 install --upgrade pip
)



