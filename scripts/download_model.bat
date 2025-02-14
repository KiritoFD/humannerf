REM filepath: /e:/Documents/GitHub/humannerf/scripts/download_model.bat
@echo off
setlocal enabledelayedexpansion

:: Google drive links for pretrained models
set "gdrive_links[377]=1kOZAdI5Qz9mTIfoM5MutZ23fzm_6_ZCr"
set "gdrive_links[386]=1ecc7co8xRZsuUBELjaMSSdE50EB3iKsw"
set "gdrive_links[387]=1WQoGgKxG2_wSMe0oPPWvSqQiNby0_uVH"
set "gdrive_links[392]=1keEyz-tcr8ICHyRQ-WA42S_NzBvAvXVs"
set "gdrive_links[393]=1m-No-69WBBsmCwsU2EQJr5x6AeIp_vUY"
set "gdrive_links[394]=10S0iCr3KP2L6DGpqMjZ72sLp4H15FLGF"

:: Download the model
set "SUBJECT=%1"
call set "LINK=%%gdrive_links[%SUBJECT%]%%"

if defined LINK (
    set "EXP_DIR=experiments\human_nerf\zju_mocap\p%SUBJECT%\adventure"
    if not exist "%EXP_DIR%" mkdir "%EXP_DIR%"

    :: Prompt user to set proxy settings
    set /p USE_PROXY="Do you need to set proxy settings? (yes/no): "
    if /I "%USE_PROXY%"=="yes" (
        set /p HTTPS_PROXY="Enter HTTPS proxy (e.g., http://proxy-server:port): "
        set /p HTTP_PROXY="Enter HTTP proxy (e.g., http://proxy-server:port): "
        set HTTPS_PROXY=%HTTPS_PROXY%
        set HTTP_PROXY=%HTTP_PROXY%
    )

    gdown "https://drive.google.com/uc?id=%LINK%" -O "%EXP_DIR%\latest.tar"
    if exist "%EXP_DIR%\latest.tar" (
        echo The downloaded model is at "%EXP_DIR%\latest.tar"
    ) else (
        echo Failed to download the model.
    )
) else (
    echo Subject %SUBJECT%'s pretrained model does not exist.
)

endlocal