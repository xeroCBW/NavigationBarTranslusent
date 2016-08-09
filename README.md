# NavigationBarTranslusent
NavigationBarTranslusent设置 navigationBar为透明

用Reveal观察了几个常用App,发现了这种效果的实现大致分3种:

第一种是使用自定义navigationBar.淘宝,网易新闻,达令等使用的是这种.
第二种是用截图的办法,在push到下一个页面时,截取屏幕,在使用edgePan来pop时看到的就是背后的截图,也能实现这种效果.京东,天猫等使用的是这种.
第三种是使用了一种比较特别,比较巧妙的办法实现的,也就是网易云音乐的实现方法,后面会分析一下这种实现.

使用干掉系统的 navigationBar 需要使用 customView
```
    //设置一张空的图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //清除边框，设置一张空的图片
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    self.navigationItem.rightBarButtonItem = right;
```
