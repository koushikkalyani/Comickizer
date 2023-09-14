@ECHO OFF

mkdir shaded
magick mogrify -path ".\shaded" -resize 30%% -dither None -colors 10 -format png "*.jpg"

@REM magick mogrify -canny 0x1+7%%+10%% -negate -transparent white -format gif "*.png"

for %%p in (.\shaded\*.png) do (
	magick  %%p -canny 0x1+7%%+10%% -negate -transparent white "%%~np.gif"
	magick composite "%%~np.gif" "%%p" "%%~np_shaded.png"
)
mkdir outlined
move "*_shaded.png" ".\outlined\"
mkdir lines
move "*.gif" ".\lines\"