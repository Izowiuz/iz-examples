#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "IzModels/VariantListModel.h"
#include "IzSQLUtilities/SQLListModel.h"
#include "IzSQLUtilities/SQLTableModel.h"

int main(int argc, char* argv[])
{
	qmlRegisterType<IzModels::VariantListModel>("Custom.Models", 1, 0, "VariantListModel");
	qmlRegisterType<IzSQLUtilities::SQLListModel>("Custom.Models", 1, 0, "SQLListModel");
	qmlRegisterType<IzSQLUtilities::SQLTableModel>("Custom.Models", 1, 0, "SQLTableModel");

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;
	engine.addImportPath("./imports");
	engine.addImportPath(DEV_PLUGINS_PATH);

	const QUrl url(QStringLiteral("qrc:/src/QML/MainWindow.qml"));

	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject* obj, const QUrl& objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	},
					 Qt::QueuedConnection);

	engine.load(url);

	return app.exec();
}
