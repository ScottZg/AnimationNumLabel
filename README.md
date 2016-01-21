# AnimationNumberLabel
动态数字   

 * 将工程里面的AnimationNumberLabelExtension拖入自己的工程即可。
 * 效果如下：   
 	![animationLabel.gif](https://ooo.0o0.ooo/2016/01/14/5697652014bc2.gif)
	
* 使用方法
	* 导入类库   
	<code>
	#import "UILabel+AnimationNumberLabel.h
	</code>
	* 然后直接使用UILabel的实例去调用：<code>- (void)animationFromNum:(CGFloat)fromNum toNum:(CGFloat)toNum andWithDuration:(CGFloat)time;</code>方法即可。

* 详情可查看Demo。 

------------------------------------------------------	
* 更新记录1.0   
	* 更新时间：2016年1月21日。
	* 更新内容：添加了暂停的功能，只需要调用
	<code>stopRunning</code>方法即可。