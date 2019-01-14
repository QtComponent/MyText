与系统Text一样的做法，但在这基础上添加自动滚动文本的功能
<p align="center">
  <img src="https://github.com/QtComponent/MyText/blob/master/Resource/demo.gif?raw=true" alt="Text滚动效果">
  <p align="center"><em>Text滚动效果</em></p>
</p>

## 使用示例
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
## 源码
```
import QtQuick 2.6

Text {
    id: root

    onXChanged: _xChanged()
    onTextChanged: _textChanged()

    Component.onCompleted: _init()

    /* animation */
    SequentialAnimation {
        id: leftMovement

        PropertyAnimation {
            target: root
            property: "x"
            from: 0
            to: (root.width - _text.width - 5)
            duration: 5000
        }
    }

    SequentialAnimation {
        id: rightMovement

        PropertyAnimation {
            target: root
            property: "x"
            from: (root.width - _text.width - 5)
            to: 0
            duration: 5000
        }
    }

    // To get the 'width' fo 'text'
    Text {
        id: _text
        visible: false
        text: parent.text
        font.pixelSize: parent.font.pixelSize
    }

    /* private function */
    function _xChanged() {
        if (x == (root.width -_text.width - 5)) {
            rightMovement.start()
        }
        else if (x == 0){
            leftMovement.start()
        }
    }

    function _textChanged() {
        if (_text.width <= root.width) {
            rightMovement.stop()
            leftMovement.stop()
        }
        else {
            anchors.centerIn = null
            leftMovement.start()
        }
    }

    function _init() {
        if (_text.width > root.width) {
            anchors.centerIn = null
            leftMovement.start()
        }
    }
}
```
## 注意
* 使用MyText控件需要设置width;
* 一般需要使用Rectangle或Item包含并使用clip: true属性。

