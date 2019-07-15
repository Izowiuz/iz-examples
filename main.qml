import QtQuick 2.12
import QtQuick.Controls 2.12

import IzLibrary 1.0
import IzSQLTableView 1.0

ApplicationWindow {
	id: window
	visible: true
	width: 640
	height: 480
	title: qsTr("Hello :]")

	IzSQLTableView {
		anchors {
			fill: parent
			margins: 10
		}
	}
}
