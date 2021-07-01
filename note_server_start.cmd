@REM 首先全局安装 docsify-cli：
@REM npm i docsify-cli -g

@REM 假设我们要在 ./docs 子目录中编写文档，将该目录初始化：
@REM docsify init ./note

@REM 初始化后系统帮我们生成了一个 ./docs 目录，目录中包含以下文件：
@REM index.html：入口文件
@REM README.md：将作为主页渲染
@REM .nojekyll：阻止 Github Pages 忽略以下划线开头的文件

@REM 使用以下命令启动本地服务器：
@REM docsify serve ./note 
docsify serve docs
