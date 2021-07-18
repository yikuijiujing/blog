# Ubuntu上安装DSP开发环境

### Pyenv 安装

1. Install the Python build dependencies

   ```bash
   sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
   libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
   libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
   ```

2. Check out Pyenv where you want it installed. A good place to choose is `$HOME/.pyenv`:

   ```
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
   ```

   Optionally, try to compile a dynamic Bash extension to speed up Pyenv

   ```
    cd ~/.pyenv && src/configure && make -C src
   ```

3. Put these lines into `~/.profile` *before* the part that sources `~/.bashrc`:

   ```bash
   export PYENV_ROOT="$HOME/.pyenv"
   export PATH="$PYENV_ROOT/bin:$PATH"
   ```

4. And put this line at the *bottom* of `~/.profile`:

   ```bash
   eval "$(pyenv init --path)"
   ```

4. Add `pyenv` into your shell by running the output of `pyenv init -` to enable autocompletion and all subcommands.

   ```bash
   echo 'eval "$(pyenv init -)"' >> ~/.bashrc
   ```

5. **Restart your login session for the changes to take effect.**

6. Install Python versions into `$(pyenv root)/versions`. For DSP development

   ```bash
   pyenv install --list |grep miniconda3
   pyenv install miniconda3-4.7.12
   ```

7. Switch to the new installed version

   ```bash
   pyenv shell miniconda3-4.7.12
   ```

8. Set the new installed version as the default version

   ```bash
   pyenv global miniconda3-4.7.12
   ```

   

Pyenv configuration layers

<img src="D:\blog\docs\tools\pyenv-pyramid.png" alt="pyenv配置顺序" style="zoom:50%;" />

参考：

- [pyenv/pyenv: Simple Python version management (github.com)](https://github.com/pyenv/pyenv#installation)

- [Managing Multiple Python Versions With pyenv – Real Python](https://realpython.com/intro-to-pyenv/)



### Miniconda 包安装

1. configure miniconda

   ```
   conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
   conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
   conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
   conda config --set show_channel_urls yes
   ```

   

2. Install Scipy

   ```
   conda install -y scipy
   ```

   

### 其它Python Package

Install IPython, Pytest etc.

```
pip install ipython pytest scipy
```

