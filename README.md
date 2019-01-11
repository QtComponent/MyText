# MyText控件

与系统Text一样的做法，只是在这基础上添加自动滚动文本的功能

## Demo:
```
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
### More info: [qtbig](http://www.qtbig.com)
