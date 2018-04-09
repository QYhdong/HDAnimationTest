# HDAnimationTest
Some daily exercises of animation

![img](https://github.com/QYhdong/HDAnimationTest/blob/master/HDRadarWave.gif)

UIView与CALayer的关系:
	首先CALayer继承自NSObject,不具备响应,而UIView继承自UIResponder,可以对事件做出响应,UIView主要是对现实内容的管理,而CALayer主要是对现实显示内容的绘制,当我们创建一个UIView对象时,系统自动为我们创建一个CALayer对象,也就是UIView的layer属性,layer用来绘制和渲染图形,UIView本身不具备显示的功能,我们实际所能看到的内容是由layer所呈现.通过layer对象可以很方便地调整UIView的一些界面属性，比如：阴影、圆角大小、边框宽度和颜色等

CAAnimation核心动画基础类,相关属性:

        //  动画的节奏
    open var timingFunction: CAMediaTimingFunction?
        (
        //匀速
        public let kCAMediaTimingFunctionLinear: String

        //慢进快出
        public let kCAMediaTimingFunctionEaseIn: String

        //快进慢出
        public let kCAMediaTimingFunctionEaseOut: String

        //慢进慢出,中间加速
        public let kCAMediaTimingFunctionEaseInEaseOut: String

        //默认
        public let kCAMediaTimingFunctionDefault: String

        )
        //代理
    open var delegate: CAAnimationDelegate?
        //是否在完成后移除(默认为true 动画完毕后从图层移除,恢复之前状态)
    open var isRemovedOnCompletion: Bool


![img](https://github.com/QYhdong/HDAnimationTest/blob/master/AnimationTimingFunction.gif)
