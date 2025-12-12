# Post-Install Checklist

## 1. System Setup
- Run customized `post_install.sh` (inside the `install` folder) after installing the Arch-base distro.
- Add **chaotic-aur** to pacman.
- Set up **Persian** keyboard layout with **Persian keyboard**.
- Change **layout switch** option to **Caps Lock**.
- Verify:
  - Super key behavior
  - Zsh backspace
  - `Ctrl + Alt + T`
  - Screenshot keybinding
  - `Alt + F4`
- Change default applications.
- Set up **Shecan**.
- Check **Bluetooth** and **Sound**.
- **Restart system** when all steps are done.

## 2. Accounts & Sync
- Set up **Firefox Sync**.
- Log in sites in Firefox:
  - Gmail
  - GitHub
  - Wakatime (API key: https://wakatime.com/settings/account)
- Log in to **Telegram** and adjust settings:
  - Auto-download settings
  - Scaling
  - Launch on system start
  - Notifications
  - Send message with **Ctrl + Enter**

## 3. Development Environment
- Bring SSH keys into `~/.ssh`.
- Clone projects to `~/proj` if needed.
- Check Docker installation:
  - Run `dockerd`
  - In another terminal: `docker run hello-world`

## 4. Desktop Environment (XFCE)
- Customize taskbar.
- Set `Super + Space` → `xfce4-popup-whiskermenu`.
- Set `F12` → `xfce4-terminal --drop-down` or `guake`.
