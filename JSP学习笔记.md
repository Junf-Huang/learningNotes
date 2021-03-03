## JSP 生命周期
编译->初始化->执行->销毁

<script type="text/javascript" src="Javascript/maiba.js"></script>
JSP的页面元素：
编译指令、操作指令、JSP代码
编译指令：由“<%@”和“%>”

@include：
    变量共享
jsp:include：
    各自转化为servlet，再各自编译为class
    jsp(java)不变量共享，javascript变量共享

session和cookie的区别和联系：
cookie数据存放在客户的浏览器上，session数据放在服务器上
session和cookie之间是通过$_COOKIE['PHPSESSID']来联系的，通过$_COOKIE['PHPSESSID']可以知道session的id，从而获取到其他的信息。

request:请求/响应模型, 一问一答
在多个request请求之间创建一些联系，这就是会话session


共享数据：
Request.setAttribute(“name”, )
< jsp:forward page=”.jsp” >可以

Response.sendRedirect(“) 跳转不可以;

<%@ page contentType="application/x-msword; charset=utf-8" %>
存储为word文件

Application:服务器关闭前，数据都存在，放在内存中，将数据库中经常访问到的数据放在application中

http是无状态协议，不会记住来访者

不可以把**可能不存在返回值**放前面

## Servlet

* Servlet是一个标准的Java类，和一般Java类不同之处就在于Servlet可以处理HTTP请求；JSP只能处理浏览器的请求，而Servlet则可以处理一个客户端的应用程序请求。

* 必须继承自HttpServlet

* 使用“request”读取和请求有关的信息（比如Cookies）和表单数据

* 使用“response”指定HTTP应答状态代码和应答头

## 跳转

input type="submit"跳转jsp: onclick="javascript:this.form.action='a.jsp';"
input type="button"跳转jsp: onclick="javascript:window.location.href='a.jsp';"
 <!-- <%=%>嵌套两层无法使用，如"'<%=%>'" -->

## Filter

[@WebFilter](http://blog.csdn.net/u012334071/article/details/42131943)
[Filter限制页面访问](http://ykko2009.blog.163.com/blog/static/18319912420119198858279/)