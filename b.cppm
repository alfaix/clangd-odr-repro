module;
#include <iostream>
export module b;

export template <class T>
concept C = requires() {
  { T::foo } -> std::convertible_to<int>;
};
