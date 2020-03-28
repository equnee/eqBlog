# eqBlog

基于JSP的个人博客系统，大二学年的JSP课程设计。

### 自我反省 

写得非常垃圾，真的非常垃圾。自从交完课程作业后就没有再动过，已经不想再打开看了（；´д｀）ゞ，也没有再优化。

- 没有实现MVC、servlet之类的，虽然课程设计有要求，但是我真的太菜了搞不懂，写了几乎是纯jsp代码，打开源码，放眼望去是满满的jsp文件(/▽＼)。

- 冗余问题。在实现功能的过程中，大量尝试功能时的代码、网上下载的库、都没有删掉，界面模板也是网上的模板整个复制过来，引用自己需要的样式而已，冗余文件占了非常大部分。（所以也可以看到本仓库主要语言是CSS~(╹ڡ╹ )（丢死人了

- 功能不完善，很多功能都没做好，基本的增删改查也有小毛病，现在打开一堆报错。当初做编辑文章的时候，引入了好几种编辑器(其他引入的代码应该也还在里面)，最后的好像用的是bootstrap的markdown编辑器，也有一些功能问题。上传图片就更不用说了，我连文件上传都搞不懂，不知道怎么学的。

- 气死了，写的什么垃圾代码，可恶！╰（‵□′）╯

  

  

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

- 用户登录注册
- 用户个人信息修改、更换头像
- 发布文章、编辑文章、设置文章权限
- 评论功能

#### 2.2 后台管理系统

- 文章发表、编辑
- 用户管理



## 3. 数据结构设计

#### 3.1 局部E-R图

<img src="D:\Application\JavaWeb\eqBlog\readme_assets\ER.png" style="zoom:67%;" />

#### 3.2 数据表结构设计

![数据表设计](D:\Application\JavaWeb\eqBlog\readme_assets\1.png)



## 4. 运行界面截图

#### 4.1 登录注册

##### 4.1.1 登录

![](D:\Application\JavaWeb\eqBlog\readme_assets\登录.png)

##### 4.1.2 注册：

![](D:\Application\JavaWeb\eqBlog\readme_assets\注册.png)



#### 4.2 用户端

##### 4.2.1文章列表

![](D:\Application\JavaWeb\eqBlog\readme_assets\文章列表.png)

##### 4.2.2 文章详情

![](D:\Application\JavaWeb\eqBlog\readme_assets\文章详情.png)

##### 4.2.3 发布文章

![](D:\Application\JavaWeb\eqBlog\readme_assets\发布文章.png)

##### 4.2.4 评论文章

![](D:\Application\JavaWeb\eqBlog\readme_assets\评论.png)

##### 4.2.5 他人主页 

![](D:\Application\JavaWeb\eqBlog\readme_assets\他人主页.png)

##### 4.2.6 个人主页

![](D:\Application\JavaWeb\eqBlog\readme_assets\个人主页.png)

##### 4.2.7 修改资料

![](D:\Application\JavaWeb\eqBlog\readme_assets\修改资料.png)

#### 4.3 管理端

##### 4.3.1 管理员管理端

![](D:\Application\JavaWeb\eqBlog\readme_assets\管理.png)





---



# 总结

除了可爱一无是处。