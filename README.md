# Bypass-403
- A simple script for bypassing 403
- It can also be used to compare responses on verious conditions as shown in the below snap
![responsesNew.png](https://github.com/fhAnso/bypass-403/blob/main/responsesNew.png)

## Usage
```txt
Usage: bypass-403.sh [options]

-h, --help    Display this help banner
-u, --url     Target URL
-p, --path    Target path
-c, --cookie  Session cookie

Example: ./bypass-403.sh -u http://targetsite.xyz -p secret
```

## Features
- Use 25 known Bypasses for 403 with the help of curl

## Installation
- Clone the repository
```bash
git clone https://github.com/fhAnso/bypass-403.git
```
- Make this script `executable` 
```bash
chmod +x bypass-403.sh
```
`Optional`: Install the external tools `jq` and `figlet` with the package manager of your operating system
- APT:
```bash
sudo apt install figlet
```
```bash
sudo apt install jq
```
- DNF:
```bash
sudo dnf install figlet
```
```bash
sudo dnf install jq
```
- Pacman
```bash
sudo pacman -S figlet
```
```bash
sudo pacman -S jq
```
   
## Contributors
  [remonsec](https://github.com/remonsec),
  [manpreet](https://github.com/manpreet406),
  [MayankPandey01](https://github.com/MayankPandey01),
  [saadibabar](https://github.com/saadibabar),
