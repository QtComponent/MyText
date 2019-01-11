/**
 * @author: www.qtbig.com
 * @brief: 与系统Text一样的做法，只是在这基础上添加自动滚动文本的功能
 * @description: d
 *       demo:
 *       Rectangle {
 *          width: 150; height: 30
 *
 *          color: "red"
 *           clip: true
 *
 *           MyText {
 *               anchors.verticalCenter: parent.verticalCenter
 *               width: 150
 *               anchors.centerIn: parent
 *               text: "123456789abcdefghijklmnopqrstuvwxyz"
 *               font.pixelSize: 20
 *          }
 *       }
 */
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
