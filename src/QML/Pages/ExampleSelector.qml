import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
	id: root

	property StackView stack

	Item {
		Layout.fillHeight: true
		Layout.fillWidth: true
	}

	Repeater {
		model: stack.resources.length

		Rectangle {
			Layout.preferredHeight: 40
			Layout.preferredWidth: 40
		}

		Component.onCompleted: {
			print(stack.resources[1].objectName)
		}
	}

	Item {
		Layout.fillHeight: true
		Layout.fillWidth: true
	}
}
