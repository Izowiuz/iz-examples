import QtQuick 2.12
import QtQuick.Layouts 1.12

import IzLibrary 1.0

RowLayout {
	IzText {
		Layout.fillHeight: true
		Layout.preferredWidth: parent.width / 2

		text: LastName
	}

	IzText {
		Layout.fillHeight: true
		Layout.preferredWidth: parent.width / 2

		text: Company
	}
}
