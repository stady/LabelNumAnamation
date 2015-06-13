# LabelNumAnamation
LabelNumAnamation

### 1. 说明
这是一个文字增长动画的工具类，支持AttributedText和Text。

### 2. 用法
* 实例化
<pre> PDLableAnimaUtil *util = [[PDLableAnimaUtil alloc]initWithLabel:label dataSource:self];
    util.textType = PDLablAttribuitedText;
   
    
</pre>

* 代理方法
<pre><code>
//文字为 普通文本
-(NSString *)currentText:(PDLableAnimaUtil *)animalUtil index:(NSInteger)index;</br>
//文字为Attributed Text
-(NSAttributedString *)currentAttributedText:(PDLableAnimaUtil *)animalUtil index:(NSInteger)index
</code></pre>

* 执行动画
<pre>[util startAnimation];</pre>

* 如果需要停止动画
<pre>[util stopAnimation];</pre>

### 3.具体实现请看Demo



