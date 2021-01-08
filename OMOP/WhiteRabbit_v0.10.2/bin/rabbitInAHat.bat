@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\ohdsi\rabbit-core\0.10.2\rabbit-core-0.10.2.jar;"%REPO%"\com\oracle\jdbc\ojdbc14\10.2.0.1.0\ojdbc14-10.2.0.1.0.jar;"%REPO%"\com\microsoft\sqlserver\sqljdbc4\4.0\sqljdbc4-4.0.jar;"%REPO%"\mysql\mysql-connector-java\8.0.16\mysql-connector-java-8.0.16.jar;"%REPO%"\com\google\protobuf\protobuf-java\3.6.1\protobuf-java-3.6.1.jar;"%REPO%"\dom4j\dom4j\1.6.1\dom4j-1.6.1.jar;"%REPO%"\xml-apis\xml-apis\1.0.b2\xml-apis-1.0.b2.jar;"%REPO%"\org\apache\poi\poi\3.17\poi-3.17.jar;"%REPO%"\commons-codec\commons-codec\1.10\commons-codec-1.10.jar;"%REPO%"\org\apache\commons\commons-collections4\4.1\commons-collections4-4.1.jar;"%REPO%"\org\apache\poi\poi-ooxml\3.17\poi-ooxml-3.17.jar;"%REPO%"\com\github\virtuald\curvesapi\1.04\curvesapi-1.04.jar;"%REPO%"\org\apache\poi\poi-excelant\3.17\poi-excelant-3.17.jar;"%REPO%"\org\apache\ant\ant\1.8.2\ant-1.8.2.jar;"%REPO%"\org\apache\ant\ant-launcher\1.8.2\ant-launcher-1.8.2.jar;"%REPO%"\org\apache\poi\poi-ooxml-schemas\3.9\poi-ooxml-schemas-3.9.jar;"%REPO%"\stax\stax-api\1.0.1\stax-api-1.0.1.jar;"%REPO%"\org\apache\xmlbeans\xmlbeans\2.3.0\xmlbeans-2.3.0.jar;"%REPO%"\org\postgresql\postgresql\42.2.5\postgresql-42.2.5.jar;"%REPO%"\com\cedarsoftware\json-io\3.0.1\json-io-3.0.1.jar;"%REPO%"\org\apache\commons\commons-csv\1.1\commons-csv-1.1.jar;"%REPO%"\commons-lang\commons-lang\2.0\commons-lang-2.0.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\org\hsqldb\hsqldb\2.2.6\hsqldb-2.2.6.jar;"%REPO%"\com\healthmarketscience\jackcess\jackcess\2.1.3\jackcess-2.1.3.jar;"%REPO%"\net\sf\ucanaccess\ucanaccess\3.0.3.1\ucanaccess-3.0.3.1.jar;"%REPO%"\com\amazon\redshift\redshift-jdbc41\1.1.10.1010\redshift-jdbc41-1.1.10.1010.jar;"%REPO%"\com\teradata\jdbc\terajdbc4\16.0.0.32\terajdbc4-16.0.0.32.jar;"%REPO%"\com\teradata\tdgss\tdgssconfig\16.0.0.0\tdgssconfig-16.0.0.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\GoogleBigQueryJDBC\42\GoogleBigQueryJDBC-42.jar;"%REPO%"\com\simba\googlebigquery\jdbc\google-api-client\1.28.0\google-api-client-1.28.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\google-http-client\1.29.0\google-http-client-1.29.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\gax\1.42.0\gax-1.42.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\google-http-client-jackson2\1.28.0\google-http-client-jackson2-1.28.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\google-oauth-client\1.28.0\google-oauth-client-1.28.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\google-auth-library-oauth2-http\0.13.0\google-auth-library-oauth2-http-0.13.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\google-auth-library-credentials\0.15.0\google-auth-library-credentials-0.15.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\jackson-core\2.9.6\jackson-core-2.9.6.jar;"%REPO%"\com\simba\googlebigquery\jdbc\guava\26.0\guava-26.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\google-api-service-bigquery\V2-rev426-1.25.0\google-api-service-bigquery-V2-rev426-1.25.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\opencensus-api\0.18.0\opencensus-api-0.18.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\opencensus-contrib-http-util\0.18.0\opencensus-contrib-http-util-0.18.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\grpc-context\1.18.0\grpc-context-1.18.0.jar;"%REPO%"\com\simba\googlebigquery\jdbc\joda-time\2.10.1\joda-time-2.10.1.jar;"%REPO%"\com\simba\googlebigquery\jdbc\avro\1.8.2\avro-1.8.2.jar;"%REPO%"\com\epam\parso\2.0\parso-2.0.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.5\slf4j-api-1.7.5.jar;"%REPO%"\org\ohdsi\rabbitinahat\0.10.2\rabbitinahat-0.10.2.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% -Xmx1200m -classpath %CLASSPATH% -Dapp.name="rabbitInAHat" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" org.ohdsi.rabbitInAHat.RabbitInAHatMain %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
