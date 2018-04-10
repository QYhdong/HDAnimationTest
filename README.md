# HDAnimationTest
Some daily exercises of animation

![img](https://github.com/QYhdong/HDAnimationTest/blob/master/HDRadarWave.gif)

UIView与CALayer的关系:
	首先CALayer继承自NSObject,不具备响应,而UIView继承自UIResponder,可以对事件做出响应,UIView主要是对现实内容的管理,而CALayer主要是对现实显示内容的绘制,当我们创建一个UIView对象时,系统自动为我们创建一个CALayer对象,也就是UIView的layer属性,layer用来绘制和渲染图形,UIView本身不具备显示的功能,我们实际所能看到的内容是由layer所呈现.通过layer对象可以很方便地调整UIView的一些界面属性，比如：阴影、圆角大小、边框宽度和颜色等

CoreAnimation和UIView动画
	
	
CAAnimation类及其子类:
	CAAnimation是QuartzCore框架下的遵循CAMediaTiming协议和CAAction协议的抽象类,平时动画所使用的是它的的一些子类,结构关系如下:
![img](https://github.com/QYhdong/HDAnimationTest/blob/master/pngCAAnimationTRee.png)

CAMediaTiming协议中定义了速度,时间,重复次数等,属性如下:

	//    //对象的开始时间，相对于其父对象
	//    public var beginTime: CFTimeInterval { get set }

	//    //对象的基本持续时间
	//    public var duration: CFTimeInterval { get set }

	//    //速度 (默认为1)
	//    public var speed: Float { get set }

	//    //让动画快进到某一点,例如时长2,timeOffset设为1,将从一半的地方开始
	//    public var timeOffset: CFTimeInterval { get set }

	//    //对象重复次数
	//    public var repeatCount: Float { get set }

	//    //对象的重复持续时间
	//    public var repeatDuration: CFTimeInterval { get set }

	//    //自动反向执行
	//    public var autoreverses: Bool { get set }

	//    //对象在非动画时间段的行为
	//    public var fillMode: String { get set }


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
