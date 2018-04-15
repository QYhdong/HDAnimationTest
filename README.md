# HDAnimationTest
Some daily exercises of animation

//雷达波纹动画demo

![img](https://github.com/QYhdong/HDAnimationTest/blob/master/HDRadarWave.gif)

iOS动画

UIView与CALayer的关系:
	首先CALayer继承自NSObject,不具备响应,而UIView继承自UIResponder,可以对事件做出响应,UIView主要是对现实内容的管理,而CALayer主要是对现实显示内容的绘制,当我们创建一个UIView对象时,系统自动为我们创建一个CALayer对象,也就是UIView的layer属性,layer用来绘制和渲染图形,UIView本身不具备显示的功能,我们实际所能看到的内容是由layer所呈现.通过layer对象可以很方便地调整UIView的一些界面属性，比如：阴影、圆角大小、边框宽度和颜色等
	
核心动画:

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


子类CAPropertyAnimation属性动画也属于是抽象类。它的两个子类才能直接对layer层进行动画操作，其中CABasicAnimation负责基础动画，CAKeyframeAnimation负责关键帧动画。

其中CAPropertyAnimation中的相关属性:


 	//CALayer的属性名,根据相应属性名达到相应动画效果
	 open var keyPath: String?
	//是否以当前动画效果为基础(默认为false)    
	 open var isAdditive: Bool
	//动画是否为累加效果,默认为false
	 open var isCumulative: Bool
	//动画值,配合transform属性使用
	 open var valueFunction: CAValueFunction?


CABasicAnimation基础动画:

	//keyPath属性的初始值
 	 open var fromValue: Any?
	//keyPath属性的结束值
 	 open var toValue: Any?
	//过渡值(在当前的位置上增加多少,不设置toValue时，toValue = fromValue + byValue)
 	 open var byValue: Any?

![img](https://github.com/QYhdong/HDAnimationTest/blob/master/BaseAnimation.gif)

CASpringAnimation弹簧动画是CABasicAnimation的子类,是苹果专门解决开发者关于弹簧动画的这个需求而封装的类,相关属性:

	//质量 直接影响弹簧惯性, 质量越大则压缩和拉伸的程度越大
    open var mass: CGFloat
	//劲度系数,形变越大 劲度系数越大
    open var stiffness: CGFloat
	//阻尼系数,阻尼越大 停止越快
    open var damping: CGFloat
	// 初始速度,正值与运动方向一致,负值与运动方向相反
    open var initialVelocity: CGFloat
	// 预估时间,根据以上参数计算出的预估时间
    open var settlingDuration: CFTimeInterval { get }


CAKeyframeAnimation关键帧动画:

    //由关键帧组成的数组,动画依次显示每一帧
    open var values: [Any]?
    //关键帧路径,优先级比values高,如果设置了path将忽略values,只对CALayer的anchorPonit和position起作用
    open var path: CGPath?
    //每一帧对应的时间,不设置的话,各关键帧平分设定时间
    open var keyTimes: [NSNumber]?
    //每一帧对应的动画节奏
    open var timingFunctions: [CAMediaTimingFunction]?
    //动画计算模式
    open var calculationMode: String
    //动画张力
    open var tensionValues: [NSNumber]?
    //动画连续性
    open var continuityValues: [NSNumber]?
    //动画偏差率
    open var biasValues: [NSNumber]?
    //动画沿路径旋转方式
    open var rotationMode: String?

CAAnimationGroup动画组,多动画统一管理

    //包含所有动画的数组 
    open var animations: [CAAnimation]?
   
![img](https://github.com/QYhdong/HDAnimationTest/blob/master/groupAnimation.gif)
    
CATransition转场动画,属性如下:

    //转场动画类型
    open var type: String
    //动画方向
    open var subtype: String?
    //动画起点进度 百分比
    open var startProgress: Float
    //动画终点进度 百分比
    open var endProgress: Float

![img](https://github.com/QYhdong/HDAnimationTest/blob/master/transitionAnimation.gif)


