#include "all_headers.hpp"

// clang-format off

// -Wall	        Включает все основные предупреждения (не включает -Wextra)
// -Wextra	      Добавляет дополнительные предупреждения (логические ошибки, неиспользуемые параметры)
// -Wpedantic	    Строгое соответствие стандарту C++ (отлавливает GNU-расширения)
// -Werror	      Превращает предупреждения в ошибки (обязателен для CI/CD)

// g++ -std=c++20 main.cpp && ./a.out && rm a.out

//clang-format on


int main(int argc, char** argv) {
  std::cout << "Hello world!" << std::endl;
  return 0;
}