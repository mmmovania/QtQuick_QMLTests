import QtQuick 2.0
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

        environment: SceneEnvironment {
            clearColor: "black"
            backgroundMode: SceneEnvironment.Color
        }

        PerspectiveCamera {
            z: 300
        }

        DirectionalLight {

        }

        Model {
            source: "#Cube"
            materials: PrincipledMaterial {
                baseColor: "red"
                metalness: 0.0
                roughness: 0.0
            }
        }
    }
}
