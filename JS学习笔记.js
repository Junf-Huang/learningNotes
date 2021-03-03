

//如何在网页中插入数据
/*
设置一个标签<blog>
用innerHTML += 循环插入需要的数组内容
*/

//处理请求
function handleRequest(){
    if(AjaxRequest.getReadyState() == 4 && AjaxRequest.getStatus() == 200){
        //把数据插入数组中;
    }
}

//提取XML的元素内容,如<author>
function getText(elem){
    var text = "";
    if(elem){
        if(elem.childNodes){
            for(var i = 0; i < elem.childNodes.length; i++){
                var child = elem.childNodes[i];
                if(child.nodeValue)
                    text += child.nodeValue;
                else{
                    if(child.childNodes)
                        if(child.childNodes[0].nodeValue)
                            text += child.childNodes[0].nodeValue;
                }
            }
        }
    }
    return text;
}

//创建XMLHttpRequest对象
function AjaxRequest(){
    var request = null;
    if(window.XMLHttpRequest){
       try{
          request = new XMLHttpRequest();
      }catch(e){
         request = null;
     }
        }
    else if(window.ActiveXObject){
         try{
            request = new ActiveXObject("Msxm12.XMLHTTP");
        }catch(e){
            try{
               request = new ActiveXObject("Microsoft.XMLHTTP");
          }catch(e){
              request = null;
          }
        }
    }
//自定义send()函数
AjaxRequest.prototype.send = function(type, url, handler, postDataType, postData){
    if(this.request != null){
        this.request.abort();
        url += "?dummy=" + new Date().getTime();
        try{
            this.request.onreadystatechange = handler;
            this.request.open(type, url, true);
            if(type.toLowerCase() == "get")
                this.request.send(null);
            else{
                this.request.setRequestHeader("Content-Type", postDataType);
                this.request.send(postData);
            }
        }
        catch(e){
            alert("Ajax error communicating with the server.\n" + "Details:" + e);
        }
    }
}

    request.onreadystatechange = handler;
    //GET获取数据
    request.open("GET", "Regular Expression.xml", true); 
    request.send(null); 
    //POST传送数据
    request.open("POST", "服务器.php", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");//传送数据给服务器需指定数据类型
    request.send("被传送的数据如，date=MM/DD/YY&body=''&image=''"); //以&隔开
}
//处理Ajax的XMLHttpRequest
readyState(); //请求的状态码，0（未初始）1（开启）2（已传送）3（接收中）4（已载入）
status();     //HTTP的请求状态码，404（找不到文件）200（OK）
abort();      //取消请求
open();       //准备请求，指定请求的类型、URL等
//send();       //传送请求，给服务器处理   
onreadystatechange(); //请求状态改变时会被调用的函数引用  
responseText();       //由服务器返回的响应数据，格式为纯文本字符串
responseXML();        //由服务器返回的响应函数，格式为XML节点树构成的对象  

//局部变量会掩盖全局变量

//网页先载入<head>部分，其次是<body>,所以在<head>中无法访问<body>HTML元素
//<head>中的函数被调用时，才运行代码; 但在函数外的代码则于标头载入时直接运行，会容易造成错误
//所以标头不能存在操作HTML元素的代码，即使在创建对象实例也是一样，先初始化，不对元素做处理
//或者在<head>中var console,再在<body onload="console = new DebugConsole();">创建对象

//类方法为类所拥有，只能访问类的特性；前面学到的类特性方法是类拥有的实例特性与方法
//类名.特性/方法

//Math对象包含数学方法与数学常量
//不用创建，直接引用
Math.PI //常量3.14
Math.round();//浮点数四舍五入为整数
Math.random();//产生介于0~之间的随机数
var i = Math.random()*num.length //数组随机索引值
Math.floor();//浮点数无条件舍去为整数
Math.ceil();//浮点数无条件进位为整数

//字符串成员函数
var str = "strbcdefg";
str.length; //字符数量
str.indexOf(); //寻找特定子字符串，返回子字符串的索引值，反之-1
str.charAt(); //寻找字符串中特定单一字符的位置
str.toLowerCase(); //转换字符串为小写
str.toUpperCase(); //转换字符串为大写

//数组内部排序
var num = [23, 6, 9, 2, 54];
num.length; //数组长度
num.sort();
//自定义排序方式
function compare(x, y){ //只提供给sort使用，
    return x-y; //从小到大
    //return y-x; 从大到小
}
num.sort(compare); //将自定义的比较函数传给sort
//因为compare只供sort()使用，所以不需要函数名
num.sort(function(a, b){ return b.date-a.date; }); //从大到小

//同时创建两个对象
var blog = [new object("x", new Date("MM/DD/YY")), new cbject("x", new Date("MM/DD/YY"))];
var searchText = "被查找的文本";
if(blog[i].value1.toLowerCase.indexOf(searchText.toLowerCase()) != -1){ //value1是blog对像的一个特性，值等于x
                           //都转为小写，是为了无差别的大小写查找

}

//创建初始化Date对象(能四则运算)，直接加减date1-date2/(1000*60*60*24)能得出日数差
var date1= new Date("MM/DD/YY");
//取得年月日
//date1.getFullYear();date1.getMonth();date1.getDate();

//创建对象数组
var b = [new object("x1", "y1"), new object("x2", "y2"), 
         new object("x3", "y3"), new object("x4", "y4")];
//插入数组
b.push(new object("x5", "y5"));
//创建对象
function object(value1, value2){
    //初始化特性
    this.value1 = value1;  //this设定隶属于实例化的特性和方法
    this.value2 = value2;
    /*建立成员函数
    //this.函数名 = function(){ 用函数字面量给方法引用
        //this.什么内部特性处理
        return 什么;
    };
    */
    object.prototype.toHTML = function(){  //prototype设定隶属于类层的特性和方法
                                           //存储在类中，让所有实例共享一份方法代码

    };
}
object.prototype.value3 = "字符串";        //类特性必须建立在对象之外,作用共享,内部访问this.value3
var a = new object("自变量1", "自变量2"); 

/*在JS中创建HTML元素
var decisionElem = document.createElement("p"); //创建元素<p>
decisionElem.appendChild(document.createTextNode("文本内容")); //创建文本节点，做为<p>的子节点
document.getElementById("元素Id名").appendChild(decisionElem); //decisionElem作为某元素的子节点
*/

function change(){
    document.getElementById("button1").className = "CLbutton";
    document.getElementById("button2").style.visibility = "hidden"; //CSS里style的visibility能隐藏元素
    //CSS的style能单一地改变节点样式
}

/*
document.getElementsById("").firstChild.nodeValue = "";
//只能替换纯文本，无法处理标签及其后面的内容,解决方法：
var node = document.getElementById("");
while(node.firstChild)
    node.removeChild(node.firstChild);        //移除节点
node.appendChild(document.createTextNode(""));//创造节点并附加到节点树上
建立文本替换函数
    function replaceNodeText("被替换的Id", 替换的内容){

    }
*/

//document.getElementById("").innerHTML = "";
//覆盖指定Id的全部内容，HTMl标签也可以；附加用 +=

//document.getElementsByTagName("body")[0].childNodes[1].lastChild //firstChild
//第一个body的第二个子节点的最后一个子节点，如body->div->img
//body里面的第二个标签里面的最后一个标签

//document.getElementsByTagName("div");
//抓取特定类型的元素，如img, dic, h1等标签，存储于数组中
//document.getElementsByTagName("div")[3]
//抓取的第四个div

function Is(theForm){
    var regex = /^\d{5}$/;
    if(!regex.test(theForm.value))
        alert("匹配失败");
}

function isEmpty(theForm, helpText){
    if(theForm.value.length == 0 || theForm.value.length >32)
    {
        if(helpText != null)
            helpText.innerHTML = "Please enter a value 1 to 32 characters in length.";
        return false;
    }
    else{
        if(helpText != null)
            helpText.innerHTML = "";
        return true;
    }
}

function showIt(theForm){ //利用表单的name访问域值
    alert(theForm["zipcode"].value);
}

function Change()　//适应不同屏幕的大小比例
    {
        eraseCookie("User_Test"); 
        document.getElementById("A"+1).style.height=document.body.clientHeight*0.6+"px";
        //alert(document.getElementById("A").style.height);
        //document.getElementById("A").style.height的类型是字符串，图片style高度
        //document.body.clientHeight的类型是数字，需+"px"，客户端body高度
        document.getElementById("A"+1).onclick = function(evt)  //该Id的onclik事件需放到onload才有效,引用传参需evt对象
 {
        if(navigator.cookieEnabled) //判断浏览器是否支持Cookie
            var UserName = readCookie("User_Test");
        //用户名输入保存
        if(UserName)
        {
            alert("Hello " + UserName + ", I miss you.");
            document.getElementById("A"+1).src="1.jpg";
            setTimeout("document.getElementById('A'+1).src='2.jpg'; alert('Hello, I\\'m coming again!');",2*1000);
            //1.jpg替换为2.jpg                                              \\嵌套两层加2个\\
        }
        else{
            var UserName = prompt("What's your name?","Enter your name here.");
            alert("It's good to meet you " + UserName);
            if(navigator.cookieEnabled)
                writeCookie("User_Test", UserName, 1*365);
            else
                alert("Your browser can't support Cookie!");
            document.getElementById("A"+1).src="1.jpg";
            setTimeout("document.getElementById('A'+1).src='2.jpg';",2*1000);
        }
    };
    }

/*函数引用*/ 
window.onload = Change; //onload对Change的引用，当网页加载时调用Change
/*函数字面量,没有函数名称，用于函数只被调用一次或者传递自变量*/ 
//window.onload = function(parameter){}; //注意加分号


function writeCookie(name, value, days)　//变量名，变量，日期（天）
    {
        var expires = "";
        if (days)
        {
            var date = new Date();
            date.setTime(date.getTime() + (days*24*60*60*1000));　//24小时
            expires = "; expires=" + date.toGMTString();
        }
        document.cookie = name + "=" + value + expires + "; path=/";
        //谷歌不支持本地客户端的cookie操作，但服务端可以;
    }
    function readCookie(name)
    {
        var searchName = name + "=";
        var cookies = document.cookie.split(';');
        for(var i=0; i < cookies.length; i++){
            var c　=　cookies[i];
            //alert(c.charAt(0));
            while(c.charAt(0)==' ')
            c = c.substring(1, c.length);
            if(c.indexOf(searchName) == 0){ 
                return c.substring(searchName.length, c.length);
            }
        }
        return null;
    }
    function eraseCookie(name){   //擦除cookie
        writeCookie(name, "", -1);
    }