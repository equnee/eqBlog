# eqBlog

基于JSP的个人博客系统，大二学年的JSP课程设计。

### 自我反省 

这是我第一次自己从0开始写的项目，写得非常垃圾，真的非常垃圾。自从交完课程作业后就没有再动过，已经不想再打开看了（；´д｀）ゞ，也没有再优化。

- 没有实现MVC、servlet之类的，虽然课程设计有要求，但是我真的太菜了搞不懂，写了几乎是纯jsp代码，打开源码，放眼望去是满满的jsp文件(/▽＼)。
- 代码冗余问题。在实现功能的过程中，许多尝试功能时的代码和网上下载的库还在，界面使用的模板只引用了自己需要的样式，冗余文件占了非常大部分。（所以也可以看到本仓库主要语言是CSS~(╹ڡ╹ )（丢死人了
- 代码可读性问题。文件命名不够合理，使用u和a加下划线开头区分user用户端和admin管理端，且代码居然全部放在同一个目录下。。
- 功能不完善，基本的增删改查也有小毛病、上传图片功能也有问题。

气死了，写的什么垃圾代码，可恶！╰（‵□′）╯



---

# 说明书

## 1. 运行环境及应用软件

开发技术：JSP 

服务器：Apache Tomcat 9.0

数据库：Mysql 8.0

开发工具：eclipse

界面制作：CSS



## 2. 主要功能

#### 2.1 前台博客系统

- 用户登录注册（登录格式验证）
- 用户个人信息修改、更换头像
- 发布文章、编辑文章、设置文章权限（
- 评论功能

#### 2.2 后台管理系统

- 文章管理
- 用户管理



## 3. 数据结构设计

#### 3.1 局部E-R图

<img src=".\readme_assets\ER.png" style="zoom:50%;" />

#### 3.2 数据表结构设计

<img src=".\readme_assets\1.png"/>

## 4. 运行界面截图

#### 4.1 登录注册

##### 4.1.1 登录

- 邮箱格式验证

- 用户名验证：用户名只能包含数字、字母和下划线

- 密码必须与用户名不同、6-24位，必须包含数字和大小写字母。

<img src=".\readme_assets\登录.png"/>

##### 4.1.2 注册：

<img src=".\readme_assets\注册.png"/>



#### 4.2 用户端

##### 4.2.1文章列表

<img src=".\readme_assets\文章列表.png"/>

##### 4.2.2 文章详情

<img src=".\readme_assets\文章详情.png"/>

##### 4.2.3 发布文章

编辑器：[bootstrap-markdown](https://link.jianshu.com/?t=http://www.codingdrama.com/bootstrap-markdown/)

<img src=".\readme_assets\发布文章.png"/>

##### 4.2.4 评论文章

<img src=".\readme_assets\评论.png"/>

##### 4.2.5 他人主页 

<img src=".\readme_assets\他人主页.png"/>

##### 4.2.6 个人主页

<img src=".\readme_assets\个人主页.png"/>

##### 4.2.7 修改资料

<img src=".\readme_assets\修改资料.png"/>

#### 4.3 管理端

##### 4.3.1 管理员管理端

<img src=".\readme_assets\管理.png"/>





---



# 总结

除了可爱一无是处。