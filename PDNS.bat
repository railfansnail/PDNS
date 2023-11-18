@echo off

:start
setlocal enabledelayedexpansion

for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| findstr /c:"SSID"') do (
  set network=%%a
  set network=!network:~1!
)

set DNS_ipv4_1=8.8.8.8
set DNS_ipv6_1=2001:4860:4860::8888
set DNS_ipv4_2=1.1.1.1
set DNS_ipv6_2=2606:4700:4700::1111
set DNS_ipv4_3=94.140.14.14
set DNS_ipv6_3=2a10:50c0::ad1:ff
set DNS_ipv4_4=208.67.222.222
set DNS_ipv6_4=2620:119:35::35

set DNS_ipv4_1_b=8.8.4.4
set DNS_ipv6_1_b=2001:4860:4860::8844
set DNS_ipv4_2_b=1.0.0.1
set DNS_ipv6_2_b=2606:4700:4700::1001
set DNS_ipv4_3_b=94.140.15.15
set DNS_ipv6_3_b=2a10:50c0::ad2:ff
set DNS_ipv4_4_b=208.67.220.220
set DNS_ipv6_4_b=2620:119:53::53

echo □□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■□□□□■■□□■■■■■■■■□■□□□□■■□□□□□■
echo □■■■■■■□■■■■■■□□□■■□□□□■□□■■■■■■■□□□□■■■■■■□□□□□□□□□□□□□□□□□■■■■■■■□■■□□□■□■■□■■□■□□■■■■■■□□□■
echo □■□□□■■□■□□□■■■□□■■■□□□■□□■■□□□■■□□□□■□□□□□□□□□□□□□□□□□□□□□□□□□■□□□□■■□□□■□■■□■■■■□□■■□□■■□□□■
echo □■□□□□■□■□□□□■■□□■■■□□□■□□■□□□□□□□□□□■□□□□□□■■■■■■□■■■■□□□□□□□■■■□■■■■□□□■□■■□■■□■□□■□□□□■□□□■
echo □■□□□■■□■□□□□□■□□■□■■□□■□□■■■□□□□□□□□■□□□□□□■■□□■■□■■□□□□□□□■■■■■■□□■■□□□■□■■□■■□■□□■□□□□■□□□■
echo □■■■■■■□■□□□□□■□□■□■■■□■□□□■■■■■□□□□□■■■■■■□■□□□□■□■□□□□□□□■■■□□□■■□□■□■■■■■■■■■□■□□■□□□□■□□□■
echo □■□□□□□□■□□□□□■□□■□□■■□■□□□□□□□■■□□□□■□□□□□□■□□□□■□■□□□□□□□□□□■■■■■■■■□■■■■□□□■■□■□□■■□□□■□□□■
echo □■□□□□□□■□□□□■■□□■□□□■■■□□□□□□□□■□□□□■□□□□□□■□□□□■□■□□□□□□□□□□□□□□□□□■□□□□□■■■■■■■□□■■□□■■□□□■
echo □■□□□□□□■□□□■■■□□■□□□■■■□□■□□□□■■□□□□■□□□□□□■■□□■■□■□□□□□□□□□□□□□□□□□■□□□□■■■□□■■■□□□■■■■■□□□■
echo □■□□□□□□■■■■■■□□□■□□□□■■□□■■■■■■■□□□□■□□□□□□■■■■■■□■□□□□□□□□□□■■■■■■■■□□□□■■□□□□□■■□□□□□□□□□□■
echo □□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■□□□□□□□□□□□■■■□□□■■□□□□□□□□□□□■
echo □□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□■■■■■■■■□□□□□■■■■■■■□□□□□□□□□□□■
echo.
echo.
echo.
echo PDNS가 정상적으로 실행되었습니다.
echo.
echo 아래에서 변경할 DNS 주소를 선택하세요.
echo DNS over HTTPS
echo DNS over TLS
echo 이 둘을 사용하려면 수동으로 설정을 바꿔주셔야 합니다.
echo.
echo 변경 도중 오류 메시지가 나오는 것은 정상입니다. DNS 주소는 모두 정상적으로 변경되오니 착오 없으십시오.
echo.
echo.
echo [1] Google Public DNS (기본으로 쓰기에 추천)
echo [2] Cloudflare DNS (보조용으로 쓰기에 추천)
echo [3] AdGuard DNS (광고, 추적 및 피싱 차단)
echo [4] Cisco OpenDNS (보조용으로 쓰기에 추천)
set /p choice=:

if "!choice!"=="1" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_1! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_1_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_1! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_1_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_1!과 !DNS_ipv6_1!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_1_b!과 !DNS_ipv6_1_b!입니다.
) else if "!choice!"=="2" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_2! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_2_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_2! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_2_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_2!과 !DNS_ipv6_2!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_2_b!과 !DNS_ipv6_2_b!입니다.
) else if "!choice!"=="3" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_3! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_3_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_3! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_3_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_3!과 !DNS_ipv6_3!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_3_b!과 !DNS_ipv6_3_b!입니다.
) else if "!choice!"=="4" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_4! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_4_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_4! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_4_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_4!과 !DNS_ipv6_4!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_4_b!과 !DNS_ipv6_4_b!입니다.
) else (
  echo 잘못 입력하셨습니다.
   goto start
)

echo 성공적으로 변경되었습니다. HTTPS / TLS 설정을 하려면 수동으로 설정해주세요.
echo DNS 적용을 위해 인터넷 브라우저가 모두 닫힙니다. 닫히지 않게 하려면 10초 내로 프로그램을 종료하세요
timeout /t 10 >NUL
echo.
taskkill /F /IM chrome.exe
taskkill /F /IM msedge.exe
taskkill /F /IM firefox.exe
taskkill /F /IM iexplore.exe
taskkill /F /IM whale.exe
taskkill /F /IM opera.exe
cls

echo 모든 작업이 끝났으므로 PDNS를 종료합니다.
pause
