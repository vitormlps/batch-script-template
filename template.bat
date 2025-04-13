:: -------------------------------
:: Developed by Vitor Lopes
:: https://www.linkedin.com/in/vitormlps/
:: https://github.com/vitormlps
:: -------------------------------

:: DON'T FORGET TO REMOVE COMMENTS BEFORE USING IT IN A PRODUCTION ENVIRONMENT

@echo off

goto :main

:end
    endlocal
    exit /B


:_header
    echo.
    echo \\--------------------------------------------\\
    echo.  %__NAME% v%__VERSION%
    echo.
    echo.  This is a batch script template,
    echo.  providing command-line arguments and flags.
    echo \\--------------------------------------------\\

    goto :eof


:_version
    if "%1"=="full" call :_header & goto :eof
    echo Version %__VERSION%

    goto :eof


:_how_to
    if "%1"=="full" (call :_header & echo. & echo HOW TO USE:) else (echo.)

    echo %__BAT_NAME% [-f] [flag value] [required argument] [optional argument]
    echo.
    echo.  -h, --help           shows this help
    echo.  -v, --version        shows the version
    echo.  -f, --flag [value]   specifies a named parameter value

    goto :eof


:_req_args_exception
    echo.
    echo \\------------ ATTENTION ------------\\
    echo.  MISSING [ REQUIRED ARGUMENT ]
    echo \\-----------------------------------\\
    echo.
    echo Enter "%__BAT_NAME% -h" for help on how to use this script.

    goto :eof


:parse_args
    if %1.==. call :_req_args_exception & goto :end

    if /i "%1"=="-h"        call :_how_to       & goto :end
    if /i "%1"=="--help"    call :_how_to full  & goto :end

    if /i "%1"=="-v"        call :_version      & goto :end
    if /i "%1"=="--version" call :_version full & goto :end

    :: EDIT YOUR BATCH ARGS FROM HERE -------------------------------------------------------------
    if /i "%1"=="-f"        (set NamedFlag=%2) & shift & shift & goto :parse_args 
    if /i "%1"=="--flag"    (set NamedFlag=%2) & shift & shift & goto :parse_args

    if not defined UnNamedRequiredArg set UnNamedRequiredArg=%1
    if not defined UnNamedOptionalArg (if not %2.==. set UnNamedOptionalArg=%2)

    goto :parse_args_end

:: REMOVE THIS CHECK IF ADMIN PERMISSION IS NOT NEEDED --------------------------------------------
:check_admin
    net session >nul 2>&1

    if %errorlevel% neq 0 (
        echo.
        echo \\------------ ATTENTION ------------\\
        echo.  Administrator rights are required 
        echo.  to run this script properly.
        echo \\-----------------------------------\\
        goto :eof
    )

    goto :check_admin_end


:set_extensions
    setlocal EnableExtensions DisableDelayedExpansion

    goto :set_ext_end


:set_vars
    setlocal

    set __NAME=%~n0
    set __VERSION=1.0
    set __YEAR=2025

    set __BAT_FILE=%~0
    set __BAT_PATH=%~dp0
    set __BAT_NAME=%~nx0

    :: EDIT YOUR VARIABLES FROM HERE --------------------------------------------------------------
    set UnNamedRequiredArg=
    set UnNamedOptionalArg=
    set NamedFlag=

    goto :set_vars_end


:: FLOW EXAMPLE - REMEMBER TO CHANGE ITS NAME -----------------------------------------------------
:ex_func
    :: ARGS TEST - REMOVE THIS IF NOT USED/WANTED -------------------------------------------------
    echo UnNamedRequiredArg: "%UnNamedRequiredArg%"
    if defined UnNamedOptionalArg (echo UnNamedOptionalArg: "%UnNamedOptionalArg%") else (echo UnNamedOptionalArg: not provided)
    if defined NamedFlag (echo NamedFlag: "%NamedFlag%") else (echo NamedFlag: not provided)

    goto :ex_func_end


:main
    title Batch Script Template

    :: REMOVE THIS CHECK IF ADMIN PERMISSION IS NOT NEEDED ----------------------------------------
    goto :check_admin
    :check_admin_end

    goto :set_extensions
    :set_ext_end

    goto :set_vars
    :set_vars_end

    goto :parse_args
    :parse_args_end

    :: FLOW EXAMPLE - REMEMBER TO CHANGE ITS NAME -------------------------------------------------
    goto :ex_func
    :ex_func_end

    goto :end
