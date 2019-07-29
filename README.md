# CJW的个人博客

![1564385455322.png](https://github.com/cjwami/myblog/blob/master/img/1564385455322.png?raw=true)

![1564385474299.png](https://github.com/cjwami/myblog/blob/master/img/1564385474299.png?raw=true)

![1564385490152.png](https://github.com/cjwami/myblog/blob/master/img/1564385490152.png?raw=true)

![1564385534140.png](https://github.com/cjwami/myblog/blob/master/img/1564385534140.png?raw=true)

![1564385560315.png](https://github.com/cjwami/myblog/blob/master/img/1564385560315.png?raw=true)

![1564386063040.png](https://github.com/cjwami/myblog/blob/master/img/1564386063040.png?raw=true)

### SSM 框架

用 SSM 框架搭建了一个博客项目，这里简单回顾下 SSM 框架。

> SSM = SpringMVC + Spring + Mybatis

#### SpringMVC

关于 SpringMVC 要掌握它的工作流程，面试的时候有可能会问到。

springMVC 工作流程见下说明：

1. 用户发送请求至前端控制器 DispatcherServlet。
2. DispatcherServlet 收到请求后调用 HandlerMapping 处理器映射器。
3. HandlerMapping 找到具体的处理器返回给 DispatcherServlet。
4. DispatcherServlet 通过 HandlerAdapter 处理器适配器调用具体的 Controller 控制器。
5. Controller 控制器将处理结果封装到 ModelAndView 中并返回。
6. ModelAndView 经过视图解析器 ViewReslover 解析后返回具体的视图 View。
7. DispatcherServlet 将 View 渲染之后响应给用户。

#### Spring

关于 Spring 不得不说它的三个特性：IOC、DI 和 AOP。

- IOC：将对象创建的权利交给 Spring 来管理，由 Spring 框架来完成对象的实例化。
- DI：依赖注入，注入方式包括：构造方法注入、setter 方法注入、接口注入、配置文件注入、注解注入等。
- AOP：面向切面编程，传统的编程方式都是纵向编程，即从上到下依次执行。如果想在代码中间加上日志，只能修改别人的代码，这样就违背了开闭原则。而使用切面编程的方式，可以在不改变原代码的情况下，在某个方法执行前后执行我们想执行的代码，比如添加 log 日志等。

开闭原则（Open-Closed Principle, OCP），即一个软件实体应当对扩展开放，对修改关闭。即软件实体应尽量在不修改原有代码的情况下进行扩展。

#### Mybatis

Mybatis 是 ORM（对象关系映射）型持久层框架，用于操作数据库的框架，支持定制化 SQL、存储过程以及高级映射等。

Mapper 和 Mybatis 相结合使得操作数据库更加方便、简单。通用 Mapper 是国内某技术大牛基于 Mybatis 开发的一个插件，封装了大部分常用的增删改查方法。使用方法很简单，只要继承 `Mapper<T>` 接口即可拥有其所有的通用方法。省去手写 XML 的烦恼，简化开发。但对于比较复杂的查询语句，我们还是要手写 XML 的。在项目中也有体现。

面试官有可能会问 Mybatis 和 Hibernate 的区别？主要从以下三点来回答：

1. 难易程度：Mybatis 简单易用，上手快，而 Hibernate 掌握起来难度较大。
2. 对象管理：Hibernate 是完整的对象/关系映射解决方案，它提供了对象状态管理的功能，使开发者不需要关心底层数据库系统的细节。而 Mybatis 在这一块没有文档说明，用户需要自己对对象进行详细的管理。
3. 优势对比：Mybatis 可以进行更为细致的 SQL 优化，可以减少查询字段。Hibernate 数据库移植性很好，Mybatis 的数据库移植性不好，不同的数据库需要写不同的 SQL。

### Maven 项目管理工具

Maven 是一个项目管理工具，通过 pom.xml 文件中的配置可以引入相关依赖 Jar 包。通过 Maven 相关命令可进行项目的清理、测试、编译、打包、安装等操作。Maven 常用命令如下：

```
mvn archetype:generate 创建Maven项目
mvn compile 编译源代码
mvn deploy 发布项目
mvn test-compile 编译测试源代码
mvn test 运行应用程序中的单元测试
mvn site 生成项目相关信息的网站
mvn clean 清除项目目录中的生成结果
mvn package 根据项目生成的 Jar
mvn install 在本地 Repository 中安装 Jar
mvn eclipse:eclipse 生成 Eclipse 项目文件
mvn jetty:run 启动 Jetty 服务
mvn tomcat:run 启动 Tomcat 服务
mvn clean package 
-Dmaven.test.skip=true  清除以前的包后重新打包，跳过测试类
```

### Redis 非关系型数据库

Redis 是一种非关系型数据库（NoSQL），以 `key-value` 的形式存储数据。Redis 目前主要用于缓存数据库，以减轻 MySQL 数据库的访问压力。例如，某大型电商网站，网页加载数据时首先会去 Redis 缓存数据库中查找（不考虑其他缓存技术的情况下）。找到返回，如果未找到则去 MySQL 数据库查询，将查询结果返回并保存 一份到 Redis 数据库中，下次查询的时候直接从 Redis 中获取。提高访问速度，减轻 MySQL 数据库压力。

一般 Redis 数据库存储数据主要有两种：

1. 热点数据，就是经常被查询的数据，出现频率高。
2. 查询耗时高的数据，可能某条数据不是经常需要，但是一旦查询就耗时很长，这样会影响系统性能，所以也会放到 Redis 数据库中。

#### Redis 优点

Redis 的优点主要包括以下几点：

1. 性能极高：Redis 能支持超过 100k+ 每秒的读写频率。
2. 丰富的数据类型：Redis 支持 String（字符串）、List（列表）、Hash（字典）、Set（集合）和 Sorted Set（有序集合）数据类型操作。
3. 原子性：Redis 的所有操作都是原子性的。

#### Redis 缺点

Redis数据库容量受到物理内存的限制，不能用作海量数据的高性能读写，因此 Redis 适合的场景主要局限在较小数据量的高性能操作和运算上。

### AJAX 请求

AJAX 请求分同步和异步请求，默认都是异步请求，同步请求需要设置 `async:false`。

- AJAX 同步请求：浏览器必须等到 AJAX 请求返回后才会向下执行代码。如果一直不返回，此时可能会出现浏览器卡死现象。
- AJAX 异步请求：AJAX 异步请求不会影响浏览器页面的加载以及用户的其他操作。

大部分情况下都是使用 AJAX 异步请求，只有当下一个步骤的参数需要的是 AJAX 同步请求的结果时才会使用 AJAX 同步请求。

AJAX异步请求格式如下：

```
    $.ajax({
            type:'post',
            url:'/queryList',
            data: {"id":id,"username":username},
            dataType:'json',
            success:function(data){

            }
        });
```

- type：请求方式（Post）；
- url：请求路径；
- data：请求携带的 JSON 数据；
- dataType：请求返回的数据类型（JSON）；
- success：成功回调函数，返回的数据封装在 Data 中。

上面是经过简化后的 AJAX 请求，最原始的 AJAX 请求如下：

```
    //1.获取ajax核心对象
    var XHR = getXHR();
    //2.设置请求方式
    XHR.open("get","${pageContext.request.contextPath}/queryList?username="+username);
    //4.监听服务器返回状态
    XHR.onreadystatechange=function(){
         if (XHR.readyState==4 && XHR.status==200)
            {
            // 5.获取服务器端响应数据  
            var jsonStr = XHR.responseText;          
         }
    }
    //3.发送请求
    XHR.send();
```

### 问题总结

**1.** Spring Security整合时 如果报“Unable to create a Configuration, because no Bean Validation provider could be found. Add a provider like Hibernate Validator (RI) to your classpath”异常，采取的解决方法是：加入 `hibernate-validator` 依赖：

```
<dependency>
  <groupId>org.hibernate</groupId>
  <artifactId>hibernate-validator</artifactId>
  <version>5.2.4.Final</version>
</dependency>
```

**2.** 如果报“Access is denied (user is anonymous); redirecting to authentication entry point org.springframework.security.access.AccessDeniedException: Access is denied”异常，我们采取的解决办法是：检查不需要拦截的 URL 是否都已配置，比如验证码、CSS、JS、Images 等。

**3.** 如果图片上传时一直处于等待状态，查看 `spring-security.xml` 中是否进行了下面的配置：

```
<security:headers>
    <security:frame-options disabled="true"></security:frame-options>
</security:headers>
```

**4.** 如果遇到数据库插入不了的情况，检查表的字段是否含有非空（not null）的字段（除了主键），如果有，将其修改为 default null，否则此字段没有数据时则插入不了。

**5.** 如果使用的是阿里云服务器部署项目，发送邮件的25端口被禁用了，可以申请解封或者使用465端口，还有激活链接之前使用的是 `localhost:8080` 开头，如果你使用自己的域名的话记得更换。