#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "foghorn" ? 0 : 1;
}
