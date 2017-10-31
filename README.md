# mitya profile

### Requirements

1. vim >=8.0 with +python3. To install vim from source with python3 support run in home directory:
```
sudo apt-get install build-essential ncurses-dev python3-dev

mkdir install
mkdir external
cd external
git clone https://github.com/vim/vim.git

cd vim
./configure --prefix=$HOME/install --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu
make && make_install
```
2. tmux >=2.1
3. git
4. YouCompleteMe requirements (build-essential, cmake, python-dev, python3-dev), see [here](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64)
5. pylint: ```pip3 install --user pylint```
6. [fzf](https://github.com/junegunn/fzf#using-git)

### Installation

Run in home directory:
```
git clone https://github.com/mityakrylov/mitya_profile.git
cd mitya_profile
./setup.sh
```

### After installation

1. Install tmux plugins: run in tmux ```prefix + I```.

2. Setup git user and email if necessary.
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

3. Change hostname if necessary: replace \h with hostname in PS1 in .profile.
