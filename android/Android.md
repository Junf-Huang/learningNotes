# Android 学习笔记

如何将 Toolbar 设置为 Activity 的应用栏：
https://developer.android.com/training/appbar/setting-up.html

https://jitpack.io:载入库
http://hao.jobbole.com/picasso/：强大的图片下载和缓存库
xml错误会引发R无法识别
android:theme="@style/AppTheme.NoActionBar" 程序崩溃闪退
## 日志

Log.v(): verbose

Log.d(): debug

Log.i(): info

Log.w(): warn

Log.e(): error

例子：Log.d("当前的类名", "打印的内容");

## 布局

给当前活动加载 一个布局：</br>
setContentView(R.layout.布局文件名);

## 注册活动

在 application 内注册声明

``` 主活动
<action android:name="android.intent.Main">
<category android:name="android.intent.category.LAUNCHER">
```

## Toast

Toast.makeText(当前活动名.this, "打印的信息", Toast.LENGTH_SHORT).show();

## Menu

res->New->Directory->menu

menu->New->Meun resources file

``` 菜单布局
<item
    android:id="@id+/add_item"
    android:title="Add"/>
<item
    android:id="@id+/remove_item"
    android:title="Remove"/>
```

重写方法：Ctrl + o

![](图片/menu.png)
![](图片/menu_option.png)

## 销毁活动

finish();

## Intent

显示Intent

``` 显示Intent
Intent intent = new Intent(当前活动.this, 切换活动.class);
startActivity(intent);
```

隐式Intent

![](图片/intent_implicit.png)

Intent intent = new Intent("com.example.activitytest.ACTION_START");
//指定 category Intent.addCategory("com.example.activitytest.MY_GATEGORY");
startActivity(intent);

action 和 category 同时匹配才能响应
每个 Intent 只能指定一个 action ，但能指定多个 category

## 更多隐式

```　打开网页
Intent intent = new Intent(Intent.ACTION_VIEW);
intent.setData(Uri.parse("https://www.baidu.com"));
startActivity(intent);
```

Uri.parse():将一个网址字符串解析成一个Uri对象
setData()：接收Uri对象
在　intent-filter　配置　data　精确指定当前的活动应响应什么类型的想数据

* android:scheme 指定数据的协议部分
* android:host 指定数据的主机名部分
* android:port 指定数据的端口部分
* android:path 指定数据的资源路径部分

``` 拨号
Intent intent = new Intent(Intent.ACTION_DIAL);
intent.setData(Uri.parse("tel:10086"));
startActivity(intent);
```

## 向下一个活动传递数据

``` FirstActivity
String data = "Hello SecondActivity";
Intent intent = new Intent(当前活动.this, 切换活动.class);
Intent.putExtra("extra_data", data);
startActivity(intent);
```

``` SecondActivity
Intent intent = getIntent();
String data = intent.getStringExtra("extra_data");
```

## 返回数据给上一个活动 P61

``` FirstActivity
Intent intent = new Intent(当前活动.this, 切换活动.class);
startActivityForResult(intent, 1);
```

``` SecondActivity
Intent intent = new Intent();
Intent.putExtra("extra_return", "Hello FirstActivity");
setResult(RESULT_OK, intent);
finish();
```

``` 重写FirstActivity 的 onActivityResult()
protected void onActivityResult(int requestCode, int resultCode, int resultCode, Intent data) {
    switch(requestCode) {
        case l:
            if (resultCode == RESULT_OK) { //确定数据的来源
                String returnedData = data.getStringExtra("data_return");
                Log.d("FirstActivity", returnedData);
            }
    }
        break;
    default;
}
```

## 活动的生命周期

### 五种状态

启动、运行、暂停、停止、销毁

### ７个回调方法

onCreate(), onStart(), onResume(), onPause(), onStop(), onDestroy(), onRestart()

* 在Activity A中启动Activity B之后：onPause(A) -> onCreate(B) -> onStart(B) -> onResume(B) -> onStop(A)

* 点击返回按钮：onPause(B) -> onRestart(A) -> onStart(A) -> onResume(A) -> onStop(B) -> onDestroy(B)

* 处于Activity B按下锁屏按钮：onPause(B) -> onStop(B)

* 重新唤醒屏幕：onRestart(B) -> onStart(B) -> onResume(B)

#### Activity B的主题风格为dialog：

* Activity A进入Activity B：onPause(A) -> onCreate(B) -> onStart(B) -> onResume(B)

* 点击返回键：onPause(B) -> onResume(A) -> onStop(B) -> onDestroy(B)

* 按下锁屏键：onPause(B) -> onStop(B) -> onStop(A)

* 重新唤醒屏幕:onRestart(B) -> onStart(B) -> onRestart(A) -> onStart(A) -> onResume(B)

![]()

###　临时数据保存

``` onSaveInstanceState()
＠Override
protected void onSaveInstanceState(Bundle outState) {
    super.onSaveInstanceState(outState);
    String tempData = "Somthing you just typed";
    outState.putString("data_key", tempData);
}
```

```　回复数据
if(savedInstanceState != null)　｛
    Sting tempData = savedInstanceState.getString("data_key");
｝
```

Bundle 可以放在Intent里，通过 Intent 传送，从Intent中取出Bundle，再取出数据

## 活动的启动模式

启动模式有四种：standard singleTop singleTask singleInstance
P73


VISIBLE：设置控件可见
INVISIBLE：设置控件不可见
GONE：设置控件隐藏
