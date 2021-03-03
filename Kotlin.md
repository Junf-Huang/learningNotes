# Kotlin学习笔记

``` 函数
fun sum(a: Int, b: Int): Int {   // Int 参数，返回值 Int
    return a + b
}
```

* public 方法则必须明确写出返回类型

``` 函数的变长参数可以用 vararg 关键字进行标识
fun vars(vararg v:Int){
    for(vt in v){
        print(vt)
    }
}

// 测试
fun main(args: Array<String>) {
    vars(1,2,3,4,5)  // 输出12345
}
```

* var是一个可变变量

* val是一个只读变量，不能被改变

* $varName 表示变量值

* ${varName.fun()} 表示变量的方法返回值:

[null安全](http://blog.csdn.net/hp910315/article/details/50790681)

如果将不可空类型赋值为null将会编译不通过。

因为String为可空类型，编译器不让它直接调用成员变量或者函数，对于可能类型，如果希望调用它的成员变量或者函数就必须进行判断才行，否则编译器是不会通过的

``` b为空引用返回null，反之返b.length
var b: String? = "abc"
b?.length  // ok
```

``` null返回-1，反之b.length
val l = b?.length ?: -1
```

``` 安全类型转换
var a: Long = 1
val aInt: Int? = a as? Int
```

1 <= i && i <= 10:

if (i in 1..10) println(i)
for(i in 1..10) println(i) // 输出“1234”
for (i in 1..4 step 2) print(i) // 输出“13”
for (i in 4 downTo 1) print(i) // 输出“4321”
for (i in 1 until 10) println(i) // [1, 10) 排除了 10
