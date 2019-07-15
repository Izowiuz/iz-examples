#include <QDebug>
#include <QDir>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	app.setProperty("SQLdbc_server", "this");
	app.setProperty("SQLdbc_database", "should");
	app.setProperty("SQLdbc_dbUserLogin", "noy");
	app.setProperty("SQLdbc_dbUserPassword", "be");
	app.setProperty("SQLdbc_appUserLogin", "needed");
	app.setProperty("SQLdbc_appName", ":[");
	app.setProperty("SQLdbc_sqlitePath", QDir::currentPath());

	QQmlApplicationEngine engine;
	engine.addImportPath("./imports");

	const QUrl url(QStringLiteral("qrc:/main.qml"));

	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject* obj, const QUrl& objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	},
					 Qt::QueuedConnection);

	engine.load(url);

	return app.exec();
}
