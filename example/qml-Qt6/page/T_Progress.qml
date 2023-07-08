import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import "qrc:///example/qml/component"

FluScrollablePage{

    title:"Progress"

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 110
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            FluText{
                text: "indeterminate = true"
            }
            FluProgressBar{
            }
            FluProgressRing{
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'FluProgressBar{

}
FluProgressRing{

}
'
    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 230
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            FluText{
                text: "indeterminate = false"
            }
            FluProgressBar{
                indeterminate: false
                progress: slider.value/100
            }
            FluProgressRing{
                indeterminate: false
                progress: slider.value/100
            }
            FluProgressBar{
                indeterminate: false
                progressVisible: true
                progress: slider.value/100
            }
            FluProgressRing{
                indeterminate: false
                progressVisible: true
                progress: slider.value/100
            }
            FluSlider{
                id:slider
                Component.onCompleted: {
                    value = 50
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'FluProgressBar{
    indeterminate: false
}
FluProgressRing{
    indeterminate: false
    progressVisible: true
}
'
    }


}
