import QtQuick 2.12
import QtQuick.Controls 2.12

import IzLibrary 1.0
import IzSQLTableView 1.0

IzSQLTableView {
	id: sqlTV
	objectName: "IzTableView"

	// avaiable names are: "SQLITE", "MSSQL", "PSQL"
	databaseName: "SQLITE"

	connectionParameters: {
//		"path": "path/to/db/location",
		"path": "F:/git/iz-examples/db",
//		"database": "database_file_name"
		"database": "localdb.sqlite"
	}

	Component.onCompleted: {
		sqlTV.model.source.sqlQuery = "SELECT * FROM customers;";
	}
}
