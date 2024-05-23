@echo off

REM start icon
echo Running PHP scripts in icon directory...
php .\icon\user\user.php
if errorlevel 1 (
    echo PHP script icon\user\user.php error brother...!
    exit /b 1
)

php .\icon\user_details\user_details.php
if errorlevel 1 (
    echo PHP script icon\user_details\productuser_details.php error brother...!
    exit /b 1
)

php .\icon\product\product.php
if errorlevel 1 (
    echo PHP script icon\product\product.php error brother...!
    exit /b 1
)

REM end icon


REM start web-template
echo Running PHP scripts in web-template directory...

php .\web-template\user\user.php
if errorlevel 1 (
    echo PHP script web-template\user\user.php error brother...!
    exit /b 1
)

php .\web-template\user_details\user_details.php
if errorlevel 1 (
    echo PHP script web-template\user_details\productuser_details.php error brother...!
    exit /b 1
)

php .\web-template\product\product.php
if errorlevel 1 (
    echo PHP script web-template\product\product.php error brother...!
    exit /b 1
)

REM end web-template


REM start uikit
echo Running PHP scripts in uikit directory...

php .\uikit\user\user.php
if errorlevel 1 (
    echo PHP script uikit\user\user.php error brother...!
    exit /b 1
)

php .\uikit\user_details\user_details.php
if errorlevel 1 (
    echo PHP script uikit\user_details\productuser_details.php error brother...!
    exit /b 1
)

php .\uikit\product\product.php
if errorlevel 1 (
    echo PHP script uikit\product\product.php error brother...!
    exit /b 1
)


REM end uikit



echo All scripts executed successfully!
pause
