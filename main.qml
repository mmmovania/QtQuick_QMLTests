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
        dynamicallyCreatedItem = Qt.createComponent('qrc:/Sandbox.qml').createObject(window, {value1: 0.5, value2:0.5,
                                                                                         value3:0.5, value4:0.5, value5:0.5, value6:0.5,
                                                                                         isEnabled1: false, isEnabled2: false, isEnabled3: false})
        //dynamicallyCreatedItem.id = "item"
        //for (var prop in dynamicallyCreatedItem) {
        //    print(prop += " (" + typeof(dynamicallyCreatedItem[prop]) + ") = " + dynamicallyCreatedItem[prop]);
        //}

        var view = dynamicallyCreatedItem.children[0]
        view.parent = window.contentItem
        view.renderMode = View3D.Underlay



       /* for(var child in dynamicallyCreatedItem.children)
        {
            //print(dynamicallyCreatedItem.children[child])
            dynamicallyCreatedItem.children[child].parent = window.contentItem
            dynamicallyCreatedItem.children[child].renderMode = View3D.Underlay
        }*/

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
                //Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 1")
                }

                Slider {
                    id: s1
                    from: 0.0
                    value: 0.5
                    to: 1.0
                    onValueChanged: dynamicallyCreatedItem.value1 = s1.value
                }
                Label
                {
                    text: s1.value
                    width:10
                }
            }

            RowLayout {
               // Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 2")
                }
                Slider {
                    id: s2
                    from: 0.0
                    value: 0.5
                    to: 1.0

                    onValueChanged: dynamicallyCreatedItem.value2 = s2.value
                }
                Label
                {
                    text: s2.value
                    width:10
                }
            }

            RowLayout {
               // Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 3")
                }
                Slider {
                    id:s3
                    from: 0.0
                    value: 0.5
                    to: 1.0
                    onValueChanged: dynamicallyCreatedItem.value3 = s3.value
                }
                Label
                {
                    text: s3.value
                    width:10
                }
            }

            RowLayout {
                //Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 4")
                }
                Slider {
                    id:s4
                    from: 0.0
                    value: 0.5
                    to: 1.0
                    onValueChanged: dynamicallyCreatedItem.value4 = s4.value
                }
                Label
                {
                    text: s4.value
                    width:10
                }
            }

            RowLayout {
               // Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 5")
                }
                Slider {
                    id:s5
                    from: 0.0
                    value: 0.5
                    to: 1.0
                    onValueChanged: dynamicallyCreatedItem.value5 = s5.value
                }
                Label
                {
                    text: s5.value
                    width:10
                }
            }

            RowLayout {
               // Layout.alignment: Qt.AlignCenter
                Label {
                    text: qsTr("Value 6")
                }
                Slider {
                    id:s6
                    from: 0.0
                    value: 0.5
                    to: 1.0
                    onValueChanged: dynamicallyCreatedItem.value6 = s6.value
                }
                Label
                {
                    text: s6.value
                    width:10
                }
            }


            CheckBox {
               // Layout.alignment: Qt.AlignCenter
                id: ch1
                text: qsTr("isEnabled 1")
                checked:  dynamicallyCreatedItem.isEnabled1
                onToggled: {
                    print("clicked")
                    dynamicallyCreatedItem.isEnabled1 = ch1.checked
                }

            }
            CheckBox {
                id: ch2
                text: qsTr("isEnabled 2")
                checked:  dynamicallyCreatedItem.isEnabled2
                onToggled: {
                    print("clicked")
                    dynamicallyCreatedItem.isEnabled2 = ch2.checked
                }
            }
            CheckBox {
                id: ch3
                text: qsTr("isEnabled 3")
                checked:  dynamicallyCreatedItem.isEnabled3
                onToggled: {
                    dynamicallyCreatedItem.isEnabled3 = ch3.checked
                }
            }
        }
    }
}
