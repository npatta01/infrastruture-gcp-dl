ANACONDA_VERSION=Anaconda3-5.2.0-Linux-x86_64
wget https://repo.anaconda.com/archive/${ANACONDA_VERSION}.sh
chmod +x ${ANACONDA_VERSION}.sh
bash ${ANACONDA_VERSION}.sh -b -p $HOME/anaconda3

echo "export PATH=$HOME/anaconda3/bin:\${PATH}" >> ~/.bash_profile

echo "unset SUDO_UID SUDO_GID SUDO_USER" >>  ~/.bashrc

source  ~/.bashrc
source activate base


#conda create -n py36 python=3.6 anaconda -y
#source activate py36
conda install nb_conda_kernels -y
pip install tensorflow-gpu==1.11.0rc1
pip install git+https://github.com/fastai/fastai.git
pip install jupyter_http_over_ws
conda install jupyter ipykernel -y
