# NS-3 설치 스크립트
## 사전 준비 사항
- debian 계열 운영체제(또는 WSL 환경)
- visual studio code가 설치되어 있으며 [C/C++ Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack)이 설치되어 있음

## 설치
```bash
git clone https://github.com/GmelaN/install_ns3
```
- `install.sh` 파일을 ns3 설치를 원하는 폴더로 이동(예: `home`)
```bash
mv install_ns3/install.sh $HOME
```

- 실행 가능하도록 수정
```bash
chmod +x $HOME/install.sh
```

- 실행
```bash
cd
./install.sh
```

## 설치 후
1. visual studio code에서 `ns-allinone-3.42` 폴더를 연 다음 Run 메뉴 - Run build task(ctrl+shift+b) - configure 실행
2. Run 메뉴 - Run build task(ctrl+shift+b) - build 실행
3. ./ns-3.42/scratch 폴더에 예제 소스 코드를 넣고 실행
