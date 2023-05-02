# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(foghornTests LANGUAGES CXX)

# ---- Tests ----

add_executable(foghorn_test source/foghorn_test.cpp)
target_link_libraries(foghorn_test PRIVATE foghorn_lib)
target_compile_features(foghorn_test PRIVATE cxx_std_17)

add_test(NAME foghorn_test COMMAND foghorn_test)

# ---- End-of-file commands ----

add_folders(Test)
