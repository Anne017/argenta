import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import QtQuick.Layouts 1.1

Dialog {
            id: aboutDialog
            visible: false
            title: i18n.tr("About Argenta Mobile "+root.appVersion)
            text: i18n.tr("This is a Belgium Argenta Bank Webapp for Ubuntu Touch.")

            Image {
                anchors.horizontalCenter: parent     
                source: '../img/icon.png'
                fillMode: Image.PreserveAspectFit 
            }

            Text {
                wrapMode: Text.WordWrap
                text: i18n.tr('Copyright (c) 2018-2020 <br> by Rudi Timmermans  <br><br> E-Mail: <a href=\"mailto://rudi.timmer@mail.ch\">rudi.timmer@mail.ch</a>')
            }

            Text {
                wrapMode: Text.WordWrap
                text: i18n.tr('Special thanks to tester, Tomas Öqvist')
            }

            Text {
                wrapMode: Text.WordWrap
                text: i18n.tr('<b>The Argenta Mobile app is not affiliated with Argenta Bank Belgium.</b>')
            }

            Button {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                color: UbuntuColors.orange
                text: i18n.tr('Donate')
                onClicked: Qt.openUrlExternally('https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=29THE9VFMZ4PS')
            }

            Button {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                color: UbuntuColors.green 
                text: i18n.tr('OK')
                onClicked: PopupUtils.close(aboutDialog)
            }
        }
