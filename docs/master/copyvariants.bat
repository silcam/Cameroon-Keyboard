copy kb.css variants\kb.css
copy welcome.htm variants\welcome.htm


rmdir ..\..\src\km\sil_cameroon_azerty\source\welcome
mkdir ..\..\src\km\sil_cameroon_azerty\source\welcome
copy variants\welcome-az-km.htm ..\..\src\km\sil_cameroon_azerty\source\welcome\welcome.htm /y
xcopy /s images ..\..\src\km\sil_cameroon_azerty\source\welcome
copy kb.css ..\..\src\km\sil_cameroon_azerty\source\welcome\kb.css


rmdir ..\..\src\km\sil_cameroon_qwerty\source\welcome
mkdir ..\..\src\km\sil_cameroon_qwerty\source\welcome
copy variants\welcome-qw-km.htm ..\..\src\km\sil_cameroon_qwerty\source\welcome\welcome.htm /y
xcopy /s images ..\..\src\km\sil_cameroon_qwerty\source\welcome
copy kb.css ..\..\src\km\sil_cameroon_qwerty\source\welcome\kb.css