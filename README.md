**屏幕适配的发展历史**
- iPhone3GS\iPhone4
  - 没有屏幕适配可言
  -  全部用frame、bounds、center进行布局
  - 很多这样的现象：坐标值、宽度高度值全部写死 objc UIButton *btn1 = [[UIButton alloc] init]; btn1.frame = CGRectMake(0, 0, 320 - b, 480 - c);
- iPad出现、iPhone横屏
 - 出现Autoresizing技术
  - 让横竖屏适配相对简单
  - 让子控件可以跟随父控件的行为自动发生相应的变化
  - 前提是：关闭Autolayout功能
  - 局限性
    - 只能解决子控件跟父控件的相对关系问题
    - 不能解决兄弟控件的相对关系问题

- iOS 6.0（Xcode4）开始
 - 出现了Autolayout技术
 - 从Xcode5.0(iOS 7.0)开始，开始流行Autolayout
- Xib预览可以查看所有设备下的当前控件的位置
![Xib预览可以查看所有设备下的当前控件的位置](http://upload-images.jianshu.io/upload_images/1514503-3cc048d27b3e1d8e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- Autoresizing
 	- 在Autolayout之前，有Autoresizing可以作屏幕适配，但局限性较大，有些任务根本无法完成
 	- 相比之下，Autolayout的功能比Autoresizing强大很多

 - Autolayout的2个核心概念
	- 参照
	- 约束
![Autolayout常用面板01-约束处理.png](http://upload-images.jianshu.io/upload_images/1514503-8e3452d9352979f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![Autolayout常用面板03-对齐.png](http://upload-images.jianshu.io/upload_images/1514503-fe04f9b1a547de34.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![Autolayout常用面板02-相对.png](http://upload-images.jianshu.io/upload_images/1514503-3d59818f273a31d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- Autolayout的警告和错误 
	- 警告  ![](http://upload-images.jianshu.io/upload_images/1514503-22058ad29e35e95a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		-	控件的frame不匹配所添加的约束, 比如
		-	比如约束控件的宽度为100, 而控件现在的宽度是110

	- 错误 ![](http://upload-images.jianshu.io/upload_images/1514503-1b35410b4d4441ce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
		- 缺乏必要的约束, 比如
		- 只约束了宽度和高度, 没有约束具体的位置

	- 两个约束冲突, 比如
		- 1个约束控件的宽度为100, 1个约束控件的宽度为110
- 关于Autolayout的动画
	- Autolayout的动画 用普通的方法改变约束的值
	```
	UIView animateWithDuration:2.0 animations:^{
        //[改变约束的值] 这种做法是没有动画效果
    }];
    [UIView animateWithDuration:2.0 animations:^{
        /**
         * 想要AutoLayout的约束有动画，需要调用控件的[控件名字 layoutIfNeeded]方法
         */
        [self.blueView layoutIfNeeded];
    }];
    ```
- 代码实现AutoLayout
  - 代码实现Autolayout的步骤
  - 利用NSLayoutConstraint类创建具体的约束对象
  - 添加约束对象到相应的view上
  - 代码实现Autolayout的注意点
  - 要先禁止autoresizing功能，设置view的下面属性为NO
  - view.translatesAutoresizingMaskIntoConstraints = NO;
  - 添加约束之前，一定要保证相关控件都已经在各自的父控件上
  - 不用再给view设置frame


```
/**
        - view1 ：要约束的控件
        - attr1 ：约束的类型（做怎样的约束）距离左右上下
        - relation ：与参照控件之间的关系
            - NSLayoutRelationLessThanOrEqual小于等于
            - NSLayoutRelationEqual  等于
            - NSLayoutRelationGreaterThanOrEqual 大于等于
        - toItem: 和其他控件做比较
        - view2 ：参照的控件
        - attr2 ：约束的类型（做怎样的约束）
        - multiplier ：乘数
        - c ：常量
     */
+(instancetype)constraintWithItem:(id)view1 
attribute:(NSLayoutAttribute)attr1 
relatedBy:(NSLayoutRelation)relation 
toItem:(nullable id)view2 
attribute:(NSLayoutAttribute)attr2 
multiplier:(CGFloat)multiplier 
constant:(CGFloat)c;
```
- Masonry简介
	- 目前最流行的Autolayout第三方框架
	- 用优雅的代码方式编写Autolayout
	- 省去了苹果官方恶心的Autolayout代码
	- 大大提高了开发效率
	- 框架地址 https://github.com/SnapKit/Masonry
- Masonry的基本使用
	- 默认情况下
		- mas_equalTo有自动包装功能，比如自动将20包装为@20
		- equalTo没有自动包装功能
	- mas_equalTo和equalTo
		- 如果添加了下面的宏，那么mas_equalTo和equalTo就没有区别
		- (#)define MAS_SHORTHAND_GLOBALS  
		- 注意：这个宏一定要添加到#import "Masonry.h"前面
	- 默认情况下
		- width是make对象的一个属性，用来添加宽度约束用的，表示对宽度进行约束
		- mas_width是一个属性值，用来当做equalTo的参数，表示某个控件的宽度属性
	- mas_width和width
		
		- 如果添加了下面的宏，mas_width也可以写成width 
		- (#)define MAS_SHORTHAND
		- mas_height、mas_centerX以此类推
