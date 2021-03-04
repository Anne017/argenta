import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components 1.3 as UT
import "components/settingspage"

Dialog {
    id: settingsDialog

    title: i18n.tr("Argenta Mobile settings")

            SpinRange{
                title: i18n.tr("Zoom factor") + ":"
                valueRatio: 100
                value: appSettings.argentaZoomFactor
                onValueModified: {
                appSettings.argentaZoomFactor = newValue
             }
         }


            Button {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                text: i18n.tr('Close')
                onClicked: PopupUtils.close(settingsDialog)
            }
        }  
