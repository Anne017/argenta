import QtQuick 2.9
import Morph.Web 0.1
import QtWebEngine 1.7
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.UnityWebApps 0.1 as UnityWebApps
import Ubuntu.Content 1.1
import QtMultimedia 5.8
import QtSystemInfo 5.0
import QtQml.Models 2.1
import "actions" as Actions
import "."

MainView {
    id: root
    objectName: "mainView"
    theme.name: "Ubuntu.Components.Themes.Ambiance"

    focus: true

    anchors {
        fill: parent
    }

    applicationName: "argenta.bank"
    anchorToKeyboard: true
    automaticOrientation: true
    property bool blockOpenExternalUrls: false
    property bool runningLocalApplication: false
    property bool openExternalUrlInOverlay: true
    property bool popupBlockerEnabled: true
    
    property string appVersion : "v1.5"

    Page {
    header: PageHeader {
        id: header
        title: i18n.tr("Argenta Mobile")

        trailingActionBar.actions: [   
            Action {
                iconName: 'info'
                text: i18n.tr('About')
                onTriggered: PopupUtils.open(Qt.resolvedUrl('AboutPage.qml'))
            }
        ]
    }


        WebEngineView {
            id: webview

            WebEngineProfile {
            id: webContext 

            property alias userAgent: webContext.httpUserAgent
            property alias dataPath: webContext.persistentStoragePath

            dataPath: dataLocation

            userAgent: "Mozilla/5.0 (Linux; U; Android 4.1.1; es-; AVA-V470 Build/GRK39F) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"

            persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies

            }

        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            }

                userScripts: [
                    WebEngineScript {
                       injectionPoint: WebEngineScript.DocumentCreation
                       sourceUrl: Qt.resolvedUrl('js/inject.js')
                       worldId: WebEngineScript.MainWorld
           }
        ]

                zoomFactor: 2.5
                url: "https://homebank.argenta.be"

            onFileDialogRequested: function(request) {

            switch (request.mode)
        {
            case FileDialogRequest.FileModeOpen:
                request.accepted = true;
                var fileDialogSingle = PopupUtils.open(Qt.resolvedUrl("ContentPickerDialog.qml"));
                fileDialogSingle.allowMultipleFiles = false;
                fileDialogSingle.accept.connect(request.dialogAccept);
                fileDialogSingle.reject.connect(request.dialogReject);
                break;

            case FileDialogRequest.FileModeOpenMultiple:
                request.accepted = true;
                var fileDialogMultiple = PopupUtils.open(Qt.resolvedUrl("ContentPickerDialog.qml"));
                fileDialogMultiple.allowMultipleFiles = true;
                fileDialogMultiple.accept.connect(request.dialogAccept);
                fileDialogMultiple.reject.connect(request.dialogReject);
                break;

            case FilealogRequest.FileModeUploadFolder:
            case FileDialogRequest.FileModeSave:
                request.accepted = false;
                break;
            }

        }

        onNewViewRequested: function(request) {
                Qt.openUrlExternally(request.requestedUrl);
            }

        Loader {
            anchors {
                fill: popupWebview
            }
            active: webProcessMonitor.crashed || (webProcessMonitor.killed && !popupWebview.currentWebview.loading)
            sourceComponent: SadPage {
                webview: popupWebview
                objectName: "overlaySadPage"
            }
            WebProcessMonitor {
                id: webProcessMonitor
                webview: popupWebview
            }
            asynchronous: true
          }
       }

            Loader {
                id: contentHandlerLoader
                source: "ContentHandler.qml"
                asynchronous: true
            }
         
            Loader {
                id: downloadLoader
                source: "Downloader.qml"
                asynchronous: true
            }
            
            Loader {
                id: filePickerLoader
                source: "ContentPickerDialog.qml"
                asynchronous: true
            }

            Loader {
                id: downloadDialogLoader
                source: "ContentDownloadDialog.qml"
                asynchronous: true
            }
         }
       }       
