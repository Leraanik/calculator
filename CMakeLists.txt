cmake_minimum_required(VERSION 3.16)

project(calc VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appcalc
    main.cpp
)

qt_add_qml_module(appcalc
    URI calc
    VERSION 1.0
    QML_FILES
        Main.qml
        CalcButton.qml
        CalculatorLogic.js
)

target_sources(appcalc PRIVATE
    main.cpp
)

qt_add_resources(appcalc_resources fonts.qrc)
target_sources(appcalc PRIVATE ${appcalc_resources})


set_target_properties(appcalc PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcalc
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcalc
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
