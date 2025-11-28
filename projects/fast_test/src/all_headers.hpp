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
#include <forward_list>
#include <list>
#include <map>
#include <queue>
#include <set>
#include <stack>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <ranges>
#include <numeric>
#include <execution>

// =============================================
// 3. Ввод/Вывод и Файловая система (I/O & Filesystem)
// =============================================
#include <fstream>
#include <iomanip>
#include <ios>
#include <iostream>
#include <sstream>
#include <filesystem>
#include <syncstream>

// =============================================
// 4. Многопоточность и Асинхронность (Concurrency)
// =============================================
#include <atomic>
#include <condition_variable>
#include <future>
#include <mutex>
#include <shared_mutex>
#include <thread>
#include <semaphore>
#include <latch>
#include <barrier>

// =============================================
// 5. Строки и Регулярные выражения (Strings & Regex)
// =============================================
#include <string>
#include <string_view>
#include <charconv>
#include <cstring>
#include <regex>
#include <format>

// =============================================
// 6. Математика и Время (Math & Time)
// =============================================
#include <numbers>
#include <cmath>
#include <complex>
#include <random>
#include <ratio>
#include <chrono>
#include <ctime>

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