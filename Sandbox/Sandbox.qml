import QtQuick
import QtQuick3D

Item {
    id:sandbox

    //inputs
    required property real value1;
    required property real value2;
    required property real value3;
    required property real value4;
    required property real value5;
    required property real value6;

    required property bool isEnabled1;
    required property bool isEnabled2;
    required property bool isEnabled3;

    //outputs
    property string sessionText: "Qt Quick 3D: The Basics"
    property string debugText: ""


    View3D {
        anchors.fill: parent

        PerspectiveCamera {
            z: 300
        }

        Node
        {
            x: 50

            DirectionalLight {

            }

            Model {
                //source: "#Cube"
                source: "#Sphere"
                eulerRotation.y: 30
                materials: PrincipledMaterial {
                    baseColor: "red"
                    metalness: value1
                    roughness: value2
                }
            }
        }
    }
}
