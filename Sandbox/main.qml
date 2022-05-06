import QtQuick
import QtQuick3D
import QtQuick.Controls
import QtQuick.Layouts


Window {
    id:window
    width: 640
    height: 480
    visible: true
    color: "#000000"
    title: "QML Sandbox"

    //https://doc.qt.io/qt-5/qtqml-javascript-dynamicobjectcreation.html
    property Item dynamicallyCreatedItem

    Component.onCompleted: {
        dynamicallyCreatedItem = Qt.createComponent('qrc:/Sandbox.qml').createObject(window.contentItem, {value1: 0.5, value2:0.5,
                                                                                         value3:0.5, value4:0.5, value5:0.5, value6:0.5,
                                                                                         isEnabled1: false, isEnabled2: false, isEnabled3: false})
        //dynamicallyCreatedItem.id = "item"
        //for (var prop in dynamicallyCreatedItem) {
        //    print(prop += " (" + typeof(dynamicallyCreatedItem[prop]) + ") = " + dynamicallyCreatedItem[prop]);
        //}
        var view = dynamicallyCreatedItem.children[0]
        view.parent = window.contentItem
        view.renderMode = View3D.Underlay

        toptitle.text = dynamicallyCreatedItem.sessionText
    }

    Label {
        id: toptitle
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Hello"
        anchors.top: parent.top

        color: "#ffffff"
        font.pointSize: 16
    }

    Drawer {
        id: drawer
        edge: Qt.RightEdge
        width: 0.25 * window.width
        height: window.height

        ColumnLayout {
            anchors.fill: parent
            spacing: 2


            RowLayout {
                Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 1")
                }

                Slider {
                    from: 0.0
                    value: 0.5
                    to: 1.0
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 2")
                }
                Slider {
                    from: 0.0
                    value: 0.5
                    to: 1.0
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 3")
                }
                Slider {
                    from: 0.0
                    value: 0.5
                    to: 1.0
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 4")
                }
                Slider {
                    from: 0.0
                    value: 0.5
                    to: 1.0
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 5")
                }
                Slider {
                    from: 0.0
                    value: 0.5
                    to: 1.0
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 6")
                }
                Slider {
                    from: 0.0
                    value: 0.5
                    to: 1.0
                }
            }


            CheckBox {
                Layout.alignment: Qt.AlignCenter
                checked: true
                text: qsTr("isEnabled 1")

            }
            CheckBox {
                text: qsTr("isEnabled 2")
                Layout.alignment: Qt.AlignCenter
            }
            CheckBox {
                checked: true
                text: qsTr("isEnabled 3")
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
