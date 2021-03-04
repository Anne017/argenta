import QtQuick 2.9
import Qt.labs.settings 1.0

Item{
    id: settingsComponent
    
    //Settings page
    property alias zoomFactor: settings.zoomFactor
    property alias argentaZoomFactor: settings.argentaZoomFactor
    
    //User data
    property alias firstRun: settings.firstRun
    
    Settings {
        id: settings
    
        //Settings page
        property real zoomFactor: 2.50
        property real argentaZoomFactor: 2.50
        
        //User data
        property bool firstRun: true
    }
}
