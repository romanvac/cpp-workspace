// all_headers.hpp — Универсальный заголовочный файл для тестовых проектов
#pragma once

// =============================================
// 1. Ядро языка и стандартная библиотека (Core)
// =============================================
#include <algorithm>
#include <array>
#include <bit>
#include <concepts>
#include <cstddef>
#include <cstdint>
#include <exception>
#include <functional>
#include <memory>
#include <optional>
#include <stdexcept>
#include <tuple>
#include <type_traits>
#include <utility>
#include <variant>
#include <version>

// =============================================
// 2. Контейнеры и алгоритмы (Algorithms & Data Structures)
// =============================================
#include <deque>
#include <execution>
#include <forward_list>
#include <list>
#include <map>
#include <numeric>
#include <queue>
#include <ranges>
#include <set>
#include <stack>
#include <unordered_map>
#include <unordered_set>
#include <vector>

// =============================================
// 3. Ввод/Вывод и Файловая система (I/O & Filesystem)
// =============================================
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <ios>
#include <iostream>
#include <sstream>
#include <syncstream>

// =============================================
// 4. Многопоточность и Асинхронность (Concurrency)
// =============================================
#include <atomic>
#include <barrier>
#include <condition_variable>
#include <future>
#include <latch>
#include <mutex>
#include <semaphore>
#include <shared_mutex>
#include <thread>

// =============================================
// 5. Строки и Регулярные выражения (Strings & Regex)
// =============================================
#include <charconv>
#include <cstring>
#include <format>
#include <regex>
#include <string>
#include <string_view>

// =============================================
// 6. Математика и Время (Math & Time)
// =============================================
#include <chrono>
#include <cmath>
#include <complex>
#include <ctime>
#include <numbers>
#include <random>
#include <ratio>

// =============================================
// 7. Системные утилиты (System Utilities)
// =============================================
#include <cassert>
#include <cerrno>
#include <cstdlib>
#include <source_location>
#include <system_error>

// =============================================
// 8. Популярные сторонние библиотеки (Third-party)
// =============================================
// #include <fmt/core.h>      // Форматированный вывод
#include <tbb/tbb.h>

#include <Eigen/Dense>    // Линейная алгебра
#include <boost/any.hpp>  // Boost
// #include <nlohmann/json.hpp> // JSON парсер

// =============================================
// 9. Макросы для удобства (Debug Helpers)
// =============================================
#define DBG(x) std::cout << #x << " = " << (x) << std::endl
#define ASSERT(cond, msg) \
  if (!(cond)) throw std::runtime_error(msg)