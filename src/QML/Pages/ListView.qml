import QtQuick 2.12
import QtQuick.Controls.Material 2.12

import IzListView 1.0
import Custom.Models 1.0

IzListView {
	id: root
	objectName: "IzListView"

	rowDelegateProvider: function (row, model) {
		if (row % 2 === 0) {
			return "qrc:/src/QML/Widgets/ExampleListViewDelegateA.qml";
		}

		return "qrc:/src/QML/Widgets/ExampleListViewDelegateB.qml";
	}

	rowColorProvider: function (row, model) {
		if (row % 2 === 0) {
			return Material.color(Material.Amber);
		}

		return Material.color(Material.BlueGrey);
	}

	rowHeightProvider: function (row, model) {
		if (row % 2 === 0) {
			return 30
		}

		return 15;
	}

	filters: [
		IzListViewFilter {
			role: "Company"
			placeholder: qsTr("Company")
		},

		IzListViewFilter {
			role: "LastName"
			placeholder: qsTr("LastName")
		}
	]

	model: SQLListModel {
		// avaiable types are: "SQLITE", "MSSQL", "PSQL"
		databaseName: "SQLITE"

		connectionParameters: {
//			"path": "path/to/db/location",
			"path": "F:/git/iz-examples/db",
//			"database": "database_file_name"
			"database": "localdb.sqlite"
		}

		Component.onCompleted: {
			sqlQuery = "SELECT * FROM customers;";
			refreshData();
		}
	}
}
