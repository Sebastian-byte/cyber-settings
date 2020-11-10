import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import org.cyber.Settings 1.0
import MeuiKit 1.0 as Meui

ItemPage {
    headerTitle: qsTr("Appearance")

    FontsModel {
        id: fontsModel
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick
        clip: true

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10

            Label {
                text: qsTr("Theme")
                color: Meui.Theme.disabledTextColor
                topPadding: Meui.Units.largeSpacing
                bottomPadding: Meui.Units.smallSpacing
            }

            RadioButton {
                checked: !Meui.Theme.darkMode
                text: qsTr("Light")
                onClicked: Appearance.switchDarkMode(false)
            }

            RadioButton {
                checked: Meui.Theme.darkMode
                text: qsTr("Dark")
                onClicked: Appearance.switchDarkMode(true)
            }

            // Dock
            Label {
                text: qsTr("Dock Direction")
                color: Meui.Theme.disabledTextColor
                topPadding: Meui.Units.largeSpacing
                bottomPadding: Meui.Units.smallSpacing
            }

            ColumnLayout {
                RadioButton {
                    checked: Appearance.dockDirection === 0
                    text: qsTr("Left")
                    onClicked: Appearance.setDockDirection(0)
                }

                RadioButton {
                    checked: Appearance.dockDirection === 1
                    text: qsTr("Bottom")
                    onClicked: Appearance.setDockDirection(1)
                }
            }

            Label {
                text: qsTr("Dock Icon Size")
                color: Meui.Theme.disabledTextColor
                topPadding: Meui.Units.largeSpacing
                bottomPadding: Meui.Units.smallSpacing
            }

            TabBar {
                id: dockSizeTabbar
                Layout.fillWidth: true

                TabButton {
                    text: qsTr("Small")
                }

                TabButton {
                    text: qsTr("Medium")
                }

                TabButton {
                    text: qsTr("Large")
                }

                TabButton {
                    text: qsTr("Huge")
                }

                currentIndex: {
                    var index = 0

                    if (Appearance.dockIconSize <= 48)
                        index = 0
                    else if (Appearance.dockIconSize <= 64)
                        index = 1
                    else if (Appearance.dockIconSize <= 88)
                        index = 2
                    else if (Appearance.dockIconSize <= 128)
                        index = 3

                    return index
                }

                onCurrentIndexChanged: {
                    var iconSize = 0

                    switch (currentIndex) {
                    case 0:
                        iconSize = 48
                        break;
                    case 1:
                        iconSize = 64
                        break;
                    case 2:
                        iconSize = 88
                        break;
                    case 3:
                        iconSize = 128
                        break;
                    }

                    Appearance.setDockIconSize(iconSize)
                }

            }

            // Font
            Label {
                text: qsTr("Font")
                color: Meui.Theme.disabledTextColor
                topPadding: Meui.Units.largeSpacing
                bottomPadding: Meui.Units.smallSpacing
            }

            GridLayout {
                rows: 3
                columns: 2

                columnSpacing: Meui.Units.largeSpacing * 2

                Label {
                    text: qsTr("General Font")
                    color: Meui.Theme.disabledTextColor
                    topPadding: Meui.Units.largeSpacing
                    bottomPadding: Meui.Units.smallSpacing
                }

                ComboBox {
                    id: generalFontBox
                    model: fontsModel.generalFonts
                    currentIndex: fontsModel.generalFontIndex
                    Layout.alignment: Qt.AlignRight
                    Layout.fillWidth: true
                    onActivated: Appearance.setGenericFontFamily(currentText)
                }

                Label {
                    text: qsTr("Fixed Font")
                    color: Meui.Theme.disabledTextColor
                    topPadding: Meui.Units.largeSpacing
                    bottomPadding: Meui.Units.smallSpacing
                }

                ComboBox {
                    id: fixedFont
                    model: fontsModel.fixedFonts
                    currentIndex: fontsModel.fixedFontIndex
                    Layout.alignment: Qt.AlignRight
                    Layout.fillWidth: true
                    onActivated: Appearance.setFixedFontFamily(currentText)
                }

                Label {
                    text: qsTr("Size")
                    color: Meui.Theme.disabledTextColor
                    topPadding: Meui.Units.largeSpacing
                    bottomPadding: Meui.Units.smallSpacing
                }

                Slider {
                    snapMode: Slider.SnapAlways
                    Layout.alignment: Qt.AlignRight
                    Layout.fillWidth: true
                    from: 11
                    to: 20
                    stepSize: 1
                    value: Appearance.fontPointSize
                    onValueChanged: Appearance.setFontPointSize(value)
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
