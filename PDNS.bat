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

echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo �����������������������������������������������������������������������������������������������
echo.
echo.
echo.
echo PDNS�� ���������� ����Ǿ����ϴ�.
echo.
echo �Ʒ����� ������ DNS �ּҸ� �����ϼ���.
echo DNS over HTTPS
echo DNS over TLS
echo �� ���� ����Ϸ��� �������� ������ �ٲ��ּž� �մϴ�.
echo.
echo ���� ���� ���� �޽����� ������ ���� �����Դϴ�. DNS �ּҴ� ��� ���������� ����ǿ��� ���� �����ʽÿ�.
echo.
echo.
echo [1] Google Public DNS (�⺻���� ���⿡ ��õ)
echo [2] Cloudflare DNS (���������� ���⿡ ��õ)
echo [3] AdGuard DNS (����, ���� �� �ǽ� ����)
echo [4] Cisco OpenDNS (���������� ���⿡ ��õ)
set /p choice=:

if "!choice!"=="1" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_1! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_1_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_1! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_1_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_1!�� !DNS_ipv6_1!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_1_b!�� !DNS_ipv6_1_b!�Դϴ�.
) else if "!choice!"=="2" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_2! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_2_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_2! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_2_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_2!�� !DNS_ipv6_2!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_2_b!�� !DNS_ipv6_2_b!�Դϴ�.
) else if "!choice!"=="3" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_3! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_3_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_3! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_3_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_3!�� !DNS_ipv6_3!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_3_b!�� !DNS_ipv6_3_b!�Դϴ�.
) else if "!choice!"=="4" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_4! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_4_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_4! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_4_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_4!�� !DNS_ipv6_4!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_4_b!�� !DNS_ipv6_4_b!�Դϴ�.
) else (
  echo �߸� �Է��ϼ̽��ϴ�.
   goto start
)

echo ���������� ����Ǿ����ϴ�. HTTPS / TLS ������ �Ϸ��� �������� �������ּ���.
echo DNS ������ ���� ���ͳ� �������� ��� �����ϴ�. ������ �ʰ� �Ϸ��� 10�� ���� ���α׷��� �����ϼ���
timeout /t 10 >NUL
echo.
taskkill /F /IM chrome.exe
taskkill /F /IM msedge.exe
taskkill /F /IM firefox.exe
taskkill /F /IM iexplore.exe
taskkill /F /IM whale.exe
taskkill /F /IM opera.exe
cls

echo ��� �۾��� �������Ƿ� PDNS�� �����մϴ�.
pause
