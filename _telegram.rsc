# dont-require-permissions=yes

:local apiUrl "https://api.telegram.org"

:local token "NNN:XXXXX"
:local chatId "NNNN"

:local text "$message"

/tool fetch url="$apiUrl/bot$token/sendMessage?chat_id=$chatId&text=$text" keep-result=no