# java

一个应用程序需要并行处理多件任务，就在一个进程里建立多个线程，
创建线程比创建进程开销小，线程之间的协作和数据交换容易。

Thread.Sleep(0)的作用，就是“触发操作系统立刻重新进行一次CPU竞争
线程间的共享通过Runnable接口实现
Runnable thread = new Runnable();
new Thread(thread, "Thread1").start();
new Thread(thread, "Thread2").start();
new Thread(thread, "Thread3").start();
or
Tickert t = new Tickert();
new Thread1(t).start;
new Thread2(t).start;

synchronized(对象)｛代码段｝
使得线程之间保持互斥关系，发生这一切的基础应当是所有线程使用的同一个对象实例，才能实现互斥的现象。
多线程编码数据共享,应考虑到线程间的互相乱入影响。
比如，A turn isboolean to false, but before that B turn it to ture.
when A need true, it's no enough.It would be always endless loop.
这三个方法都是Object的方法：wait,sleep,notify
wait()会释放对象锁，sleep()不会
notify(): 唤醒正在等待对象锁旗标的第一个线程
wait()和notify()必须在synchronized代码块中调用
yield()使当前线程让出CPU占有权，让给同等级的其他线程,不会释放锁标志

