﻿import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import FluentUI
import "qrc:///example/qml/global/"

FluWindow {

    id:window
    title: "FluentUI"
    windowIcon: "qrc:/example/res/image/favicon.ico"
    width: 1000
    height: 640
    closeDestory:false
    minimumWidth: 520
    minimumHeight: 460
    launchMode: FluWindow.SingleTask

    closeFunc:function(event){
        window.show()
        window.raise()
        window.requestActivate()
        close_app.open()
        event.accepted = false
    }

    Connections{
        target: appInfo
        function onActiveWindow(){
            window.show()
            window.raise()
            window.requestActivate()
        }
    }

    SystemTrayIcon {
        id:system_tray
        visible: true
        icon.source: "qrc:/example/res/image/favicon.ico"
        tooltip: "FluentUI"
        menu: Menu {
            MenuItem {
                text: "退出"
                onTriggered: {
                    window.deleteWindow()
                    FluApp.closeApp()
                }
            }
        }
        onActivated:
            (reason)=>{
                if(reason === SystemTrayIcon.Trigger){
                    window.show()
                    window.raise()
                    window.requestActivate()
                }
            }
    }

    FluContentDialog{
        id:close_app
        title:"退出"
        message:"确定要退出程序吗？"
        negativeText:"最小化"
        buttonFlags: FluContentDialog.NeutralButton | FluContentDialog.NegativeButton | FluContentDialog.PositiveButton
        onNegativeClicked:{
            system_tray.showMessage("友情提示","FluentUI已隐藏至托盘,点击托盘可再次激活窗口");
            window.hide()
        }
        positiveText:"退出"
        neutralText:"取消"
        onPositiveClicked:{
            window.deleteWindow()
            FluApp.closeApp()
        }

    }

    FluNavigationView{
        id:nav_view
        anchors.fill: parent
        items: ItemsOriginal
        footerItems:ItemsFooter
        z:11
        displayMode:MainEvent.displayMode
        logo: "qrc:/example/res/image/favicon.ico"
        title:"FluentUI"
        autoSuggestBox:FluAutoSuggestBox{
            width: 280
            anchors.centerIn: parent
            iconSource: FluentIcons.Search
            items: ItemsOriginal.getSearchData()
            placeholderText: lang.search
            onItemClicked:
                (data)=>{
                    ItemsOriginal.startPageByItem(data)
                }
        }
        actionItem:Item{
            height: 40
            width: 148
            RowLayout{
                anchors.centerIn: parent
                spacing: 5
                FluText{
                    text:lang.dark_mode
                }
                FluToggleSwitch{
                    selected: FluTheme.dark
                    clickFunc:function(){
                        if(FluTheme.dark){
                            FluTheme.darkMode = FluDarkMode.Light
                        }else{
                            FluTheme.darkMode = FluDarkMode.Dark
                        }
                    }
                }
            }
        }
        Component.onCompleted: {
            ItemsOriginal.navigationView = nav_view
            ItemsFooter.navigationView = nav_view
            nav_view.setCurrentIndex(0)
        }
    }

}
