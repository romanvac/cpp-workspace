#include "all_headers.hpp"

// clang-format off

// ----------------------------------------------------
// отключение проверок clang-tidy:

// error_here // NOLINT(error_name1, error_name2, ...)

// NOLINTNEXTLINE(error_name1, error_name2, ...)
// error_here

// NOLINTBEGIN(error_name1, error_name2, ...)
// error_here
// ...
// error_here
// NOLINTBEGIN(error_name1, error_name2, ...)

// ----------------------------------------------------

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