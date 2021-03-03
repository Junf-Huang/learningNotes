# java 学习笔记

**实例/静态变量**有默认值（0，null,false），**局部变量**没有
接口不能用new直接产生对象，必须实现接口的所有方法
继承：确定子类是父类一种更特定的类型
    覆盖：
        覆盖的方法必须参数一样，返回类型必须兼容，不能降低权限
    重载：
        方法名一样，参数不同，返回类型可以不同
多态：父类的引用变量，可指向**不同**类型的子类
应用：

* 创建父类引用变量数组，分别指向不同类型的子类()[/图片/java_多态.png]

* 设置父类类型的参数，可传入不同类型的子类

## java中equal与==的区别

１．==比较的是内存中的存放地址（堆内存地址），每一次的new会重新开辟堆内存空间

２．equal比较的是对象里的内容

## 多态

### 继承

子类只会继承父类的public,方法可以被覆盖，但实例变量不可以
继承的意义：避免重复的代码，定义出共同的协议

### 抽象类　abstract

```　抽象类
abstract public class class_name　｛
｝
```

抽象类可以带有抽象和非抽象方法

接口是100%纯抽象类

有些父类是没有必要实例化的，比如所有动物的父类 animal

拥有抽象方法的类一定是抽象类，抽象的类一定要被extend, 抽象的方法一定要被覆盖

```　抽象方法没有方法体
public abstract　void eat();
```

抽象的意义：定义一组子型共同的协议，多态

在继承里，第一个具体类必须实现抽象类的所有抽象方法

### object的多态引用后果

``` 示例
Dog a = new Dog();
Object object = a; //被转化为Oject类型
Dog b = object; //无法通过编译，编译器无法确认是Dog,解决方法是类型强制转换
if(o instanceof Dog) { //类型判断
    Dog d = (Dog) o;
}
```

编译器是根据**引用的类型**来判断有哪些method可以用

* 多继承可能会出现二义性错误

java解决的方法：接口

### 接口

``` 定义
public interface pet {
}
```

``` 继承
public class Dog extends canine implemnts pet, saveable {
}
```

## 构造器与内存回收

* 被调用的方法会被放在stack的最上方
* A对象里带有B对象，则jvm会在对象A的空间里只留下对象B的引用量
* 新对象的产生：声明 -> 创建　-> 赋值
* 构造函数不是方法，没有返回类型，不会被继承
* 被标记为private的构造函数无法被初始化、实例化

``` 带默认参数的构造函数
public class duck {
    int size;
    public duck() {
        size = 27;
    }
    public duck(int ducksize)　{
        size = ducksize;
    }
}
```

* 顺序不同：Mushroom(boolean isMagic, int size) != Mushroom(int size, boolean isMagic)
* 构造函数链：子类的父类的父类构造
* 编译器会自己添加没有参数的父类构造函数super();

``` 无参调用含参构造函数
class Mini extends Car {
    Color color;
    public Mini() {
        this(Color.Red);
    }
    public Mini(Color c) {
        super("Mini");
        color = c;
    }
}
```

###　释放对象的引用

1. 方法结束时消失 `void go() {Life z = new Life();}`
2. 连接到其他对象时消失 `Life z = new Life(); z = new Life();`
3. 引用为null时消失 `Life z = new Life(); z = null;`

## 数字与静态

* 静态方法：不依靠实例变量，不需要对象,**共享**

`public static int min(int a, int b){}`

* 静态的方法不能调用非静态的变量和非静态的方法，原因：静态无法看到实例的状态
* 一类一个，被所有实例共享 `private static int sum = 0;`
* 静态变量会在该类的任何对象创建之前就被初始化，静态变量会在该类的任何静态方法执行之前就被初始化
* 用类的名称来调用

* final修饰的变量不能改变，方法不能覆盖，类不能继承
* 静态的final变量(大写)是常数 `public static final double PI =　3.1415;`

### API of math

* random
* ads
* round 四舍五入
* min与max　x与y的比较

* generic　类型的规则只能指定类和接口类，如ArrayList<Integer>,而不是ArrayList<int>

### 格式化输出

* String.format()
* 日期的固定格式输出
* "<"重复利用参数　`format("%tA %tB %td", today,today,today)==format("%tA %<tB %<td", today)；`

### 操作日期

* 取当前时间（Date）,其余操作在Calendar
* 通过getInstance()取得实例

`Calendar cal =Calendar.getInstance();`

* 通过Calendar的API，日期和时间可以运算
* 如果多次用某静态类的方法，可　import static 包，注意名称冲突

## 异常处理

315