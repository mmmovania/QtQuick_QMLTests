import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

Item {
    id:sandbox
    anchors.fill: parent

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

    Node {
        id: sceneRoot

        PerspectiveCamera {
            id: mainCamera
            z: 300
        }

        Node
        {
            DirectionalLight {
                eulerRotation.x : -30
               // visible: isEnabled1
                castsShadow: true
            }

         /*   PointLight {
                position: Qt.vector3d(0, 100, 0)
                //visible: isEnabled2
                castsShadow: true
            }

            SpotLight {
                z: 300
               // visible: isEnabled3
                castsShadow: true
                shadowFactor: 50
            }*/

            //our Lightbox model
            Node {
                x: 285
                eulerRotation.y: 45

                //floor
                Model {
                    source: "#Rectangle"
                    y: -200
                    scale: Qt.vector3d(15, 15, 15)
                    eulerRotation.x: -90
                    materials: PrincipledMaterial {
                        baseColorMap: Texture {
                            source: "qrc:/textures/ConcreteWall01_MR_2K/BaseColor.png"
                        }
                        //baseColor: "red"
                        metalness: value1
                        roughness: value2
                    }
                }
                //back wall
                Model {
                    source: "#Rectangle"
                    z: -400
                    scale: Qt.vector3d(15, 5, 15)
                    materials: PrincipledMaterial {
                        baseColorMap: Texture {
                            source: "qrc:/textures/decorative_wall/basecolor.png"
                            scaleU: 4
                            scaleV: 4
                        }
                        //baseColor: "blue"
                        metalness: value1
                        roughness: value2
                    }
                }

                //side wall
                Model {
                    source: "#Rectangle"
                    z: -400
                    eulerRotation.y: -90
                    scale: Qt.vector3d(15, 5, 15)
                    materials: PrincipledMaterial {
                       baseColorMap: Texture {
                            source: "qrc:/textures/decorative_wall/basecolor.png"
                            scaleU: 4
                            scaleV: 4
                        }
                        //baseColor: "blue"
                        metalness: value1
                        roughness: value2
                    }
                }
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

    View3D
    {
       // anchors.fill: parent
        anchors.top:  parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width*0.5
        renderMode: View3D.Underlay

        environment: SceneEnvironment {
            lightProbe: Texture {
                source: "qrc:/textures/hdr/monte_scherbelino_2k.hdr"
            }
            backgroundMode: SceneEnvironment.SkyBox
        }

        importScene: sceneRoot

        WasdController {
            controlledObject: mainCamera
        }

    }


    View3D
    {
        anchors.top:  parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width*0.5
        renderMode: View3D.Underlay

        importScene: sceneRoot
    }
}
