add_rules("mode.debug", "mode.release")
add_rules("mode.debug", "mode.release")

target("qt_test")
    set_kind("binary")
    add_files("src/*.cpp")
    
    -- 设置语言标准为 C++17
    set_languages("cxx17")
    
    -- 在 Windows 平台上为 MSVC 编译器添加 /Zc:__cplusplus 选项
    if is_plat("windows") then
        add_cxxflags("/Zc:__cplusplus","/permissive-")
        set_toolchains("msvc")
        set_arch("x64") -- 或者 "arm64" 根据你的目标架构
    end
    
    -- 添加 Qt 框架
    add_frameworks("QtCore", "QtGui", "QtWidgets")

    -- 设置包含目录和库目录
    add_includedirs("C:/Qt/6.5.3/msvc2019_64/include")
    add_includedirs("C:/Qt/6.5.3/msvc2019_64/include/QtCore")
    add_includedirs("C:/Qt/6.5.3/msvc2019_64/include/QtGui")
    add_includedirs("C:/Qt/6.5.3/msvc2019_64/include/QtWidgets")
    add_linkdirs("C:/Qt/6.5.3/msvc2019_64/lib")

    -- 手动链接库
    add_links("Qt6Core", "Qt6Gui", "Qt6Widgets")


--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro definition
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

