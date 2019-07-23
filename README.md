# MyText
与系统Text一样的做法，但在这基础上添加自动滚动文本的功能。  
<p align="center">
  <img src="https://github.com/QtComponent/MyText/blob/master/Resource/demo.gif?raw=true" alt="Text滚动效果">
  <p align="center"><em>Text滚动效果</em></p>
</p>

# 使用示例
```qml
Rectangle {
  width: 150; height: 30

  color: "red"
  clip: true

  MyText {
      anchors.verticalCenter: parent.verticalCenter
      width: 150
      anchors.centerIn: parent
      text: "123456789abcdefghijklmnopqrstuvwxyz"
      font.pixelSize: 20
  }
}
```

# 注意
* 使用MyText控件需要设置width;
* 一般需要使用Rectangle或Item包含并使用clip: true属性。

# 关于作者
|Qt君公众号(每天更新)|Qt君|
|---|---|
|Qt君个人网站|[www.qtbig.com](http://www.qtbig.com)|
|QQ交流群|732271126|

<p align="center">
  <img src="http://www.qtbig.com/about/index/my_qrcode.jpg" alt="微信公众号:你才小学生">
  <p align="center"><em>微信扫一扫关注公众号</em></p>
</p>
