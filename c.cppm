module;

#include <iostream>

export module c;
import b;
class B {
public:
  static constexpr int foo = 1;
};

export template <class T>
  requires C<T>
class D {};

int main() { D<B> s; }
