### This file is automatically generated by Qt Design Studio.
### Do not change

add_subdirectory(Pkjviz)
add_subdirectory(PkjvizContent)
add_subdirectory(App)
add_subdirectory(Dependencies)

target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE
    Pkjvizplugin
    PkjvizContentplugin)