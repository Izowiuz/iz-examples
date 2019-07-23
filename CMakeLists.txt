# cmake minumum version
cmake_minimum_required(VERSION 3.10)

# project name and version
project(IzExamples VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# project architecture
if(${CMAKE_SIZEOF_VOID_P} EQUAL 8)
	set(PLATFORM_TARGET "x64")
else()
	set(PLATFORM_TARGET "x86")
endif()

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

find_package(IzModels CONFIG REQUIRED)

add_executable(
		${PROJECT_NAME}
		"main.cpp"
		"qml.qrc"
	)

target_compile_definitions(
	${PROJECT_NAME}
	PRIVATE
		$<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
		QT_USE_QSTRINGBUILDER
		DEV_PLUGINS_PATH=\"../deploy/plugins/${CMAKE_BUILD_TYPE}/${Qt5Core_VERSION}/${CMAKE_CXX_COMPILER_ID}/${PLATFORM_TARGET}\"
)

target_link_libraries(
		${PROJECT_NAME}
		PRIVATE
			Qt5::Core
			Qt5::Quick
)

add_custom_target(finish_build ALL)

add_dependencies(finish_build ${PROJECT_NAME})

if (WIN32)
	add_custom_command(
		TARGET finish_build
		POST_BUILD

		COMMAND ${CMAKE_COMMAND} -E copy_if_different
		$<TARGET_FILE:IzSQLUtilities::IzSQLUtilities>
		$<TARGET_FILE_DIR:${PROJECT_NAME}>
		COMMENT "Copying IzSQLUtilities dll..."

		COMMAND ${CMAKE_COMMAND} -E copy_if_different
		$<TARGET_FILE:IzModels::IzModels>
		$<TARGET_FILE_DIR:${PROJECT_NAME}>
		COMMENT "Copying IzModels dll..."
	)
endif()
