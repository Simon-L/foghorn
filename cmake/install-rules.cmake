install(
    TARGETS foghorn_exe
    RUNTIME COMPONENT foghorn_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
