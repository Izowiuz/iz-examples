import QtQuick 2.12
import QtQuick.Controls 2.12

import IzLibrary 1.0
import IzSQLTableView 1.0

ApplicationWindow {
	id: window
	visible: true
	width: 940
	height: 680
	title: qsTr("Hello :]")

	IzSQLTableView {
		id: sqlTV

		anchors {
			fill: parent
			margins: 10
		}

		// avaiable types are: "SQLITE", "MSSQL", "PSQL"
		databaseType: "SQLITE"

		connectionParameters: {
			"path": "path/to/db/location",
			// example: "C:/Users/jakubn/Documents/projekty/qt-projects/iz-examples/db",
			"database": "database_file_name"
			// example: "localdb.sqlite"
		}

		Component.onCompleted: {
			sqlTV.model.source.sqlQuery = "SELECT * FROM customers;";
		}
	}
}
