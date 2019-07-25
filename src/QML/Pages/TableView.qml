import QtQuick 2.12
import QtQuick.Controls 2.12

import IzLibrary 1.0
import IzSQLTableView 1.0

IzSQLTableView {
	id: sqlTV
	objectName: "IzTableView"

	Component.onCompleted: {
		sqlTV.model.source.sqlQuery = "SELECT * FROM customers;";
	}
}
