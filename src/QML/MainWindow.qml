import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import IzLibrary 1.0

import "Pages" as Pages

ApplicationWindow {
	id: window

	visible: true
	width: 940
	height: 680
	title: qsTr("Hello :]")

	ColumnLayout {
		anchors {
			fill: parent
			margins: 10
		}

		StackView {
			id: mainStack

			Layout.fillHeight: true
			Layout.fillWidth: true

			initialItem: exampleSelector

			Component {
				id: exampleSelector

				RowLayout {
					Item {
						Layout.fillHeight: true
						Layout.fillWidth: true
					}

					Button {
						Layout.preferredHeight: 50
						Layout.preferredWidth: 200

						flat: true
						text: "IzTableSQLView"

						onReleased: {
							mainStack.push(tableView);
						}
					}

					Button {
						Layout.preferredHeight: 50
						Layout.preferredWidth: 200

						flat: true
						text: "IzListView"

						onReleased: {
							mainStack.push(listView);
						}
					}

					Item {
						Layout.fillHeight: true
						Layout.fillWidth: true
					}
				}
			}

			Component {
				id: tableView

				Pages.TableView {}
			}

			Component {
				id: listView

				Pages.ListView {}
			}
		}

		RowLayout {
			Layout.preferredHeight: 45
			Layout.fillHeight: false
			Layout.fillWidth: true

			ToolSeparator {}

			IzButton {
				fontIcon: "\uf30d"
				text: qsTr("Go back")
				enabled: mainStack.depth !== 1

				onReleased: {
					mainStack.pop();
				}
			}

			Item {
				Layout.fillHeight: true
				Layout.fillWidth: true
			}

			ToolSeparator {}
		}
	}
}
