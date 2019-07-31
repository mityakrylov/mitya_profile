# mitya profile

### Requirements

1. git
   ```
   sudo apt-get install git
   ```
2. vim >=8.0 with +python3.

   To install vim with apt-get on Ubuntu 16.04 run:
   ```
   sudo add-apt-repository ppa:jonathonf/vim
   sudo apt-get update
   sudo apt-get install vim
   ```
   To install vim from source with python3 support run in home directory:
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
3. tmux >=2.1
   ```
   sudo apt-get install tmux
   ```
4. YouCompleteMe requirements (build-essential, cmake, python-dev, python3-dev), see [here](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64)
   ```
   sudo apt-get install build-essential cmake
   sudo apt-get install python-dev python3-dev
   ```
5. flake8:
   ```
   pip3 install --user flake8
   ```
6. [fzf](https://github.com/junegunn/fzf#using-git)
   ```
   Do you want to enable fuzzy auto-completion? ([y]/n) y
   Do you want to enable key bindings? ([y]/n) y
   
   Do you want to update your shell configuration files? ([y]/n) n
   ```

### Installation

Run in home directory:
```
git clone https://github.com/mityakrylov/mitya_profile.git
cd mitya_profile
./setup.sh
```

Or use ```./setup_vim.sh``` instead of ```./setup.sh``` if only vim is needed.

### After installation

1. Install tmux plugins: run in tmux ```prefix + I```.

2. Setup git user and email if necessary.
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

3. Change hostname if necessary: replace \h with hostname in PS1 in .profile.

4. Setup virtaulenv for python
   ```
   sudo pip3 install virtualenv
   pip3 install --user virtualenvwrapper
   ```
  
   Add something like this to ```.profile_custom```:
  
   ```
   export WORKON_HOME=~/envs
   export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
   source $HOME/.local/bin/virtualenvwrapper.sh
   ```
