# Инструкция по установке сборки DrakanHex8
### Дисклеймер
- Тыкайте по синему тексту, чтобы перейти
- Адресс сервера включён в игру по умолчанию
- **Для работы автообновления нужен доступ к github и modrinth**
- Для обхода DPI, если он у вас ещё не стоит, советую установить [`zapret`](<https://github.com/Flowseal/zapret-discord-youtube>)
  - Пожалуйста, следуйте инструкциям по установке на сайте.
  - **если не работает, придётся открывать с VPN, например Cloudflare WARP**
- Затем добавьте в list-general.txt следующий строки:
```
libraries.minecraft.net
files.minecraftforge.net
maven.minecraftforge.net
minecraftforge.net
neoforged.net
maven.neoforged.net
fabricmc.net
curseforge.com
minecraft.curseforge.com
modrinth.com
github.com
```
## Prism Launcher
### Для [Prism Launcher](<https://prismlauncher.org/>) и его **[пиратского аналога](<https://github.com/ElyPrismLauncher/ElyPrismLauncher/releases/download/10.0.2/ElyPrismLauncher-Windows-MSVC-Setup-10.0.2.exe>)** с авто обновлениями:
- Скачиваем [**DrakanHex8.prism.zip**](<https://github.com/alexyzer/DrakanHex8/releases/download/1.0.0/DrakanHex8.prism.zip>), перетаскиваем в окно лаунчера и запускаем.


## Modrinth
### Для [Modrinth](<https://modrinth.com/app>) и его [пиратского аналога](<https://git.astralium.su/didirus/AstralRinth/releases/download/AR-0.10.2701/AstralRinth%20App_0.10.2701_x64-setup.exe>) с авто обновлениями:
- Скачиваем [**DrakanHex8.mrpack**](<https://github.com/alexyzer/DrakanHex8/releases/download/1.0.0/DrakanHex8.mrpack>).
- Заходим в настройки сборки Launch hooks и в Pre-launch вставляем ```cmd /C УСТАНОВИТЬ.bat```

## Остальные
### Для другого любого нормального лаунчера:
- **Проверьте, чтобы в папке не оставались моды от других сборок!**
- Скачиваем Майнкрафт 1.20.1 с загрузчиком Forge 47.4.20.
- Скачиваем [**DrakanHex8.zip**](<https://github.com/alexyzer/DrakanHex8/releases/download/1.0.0/DrakanHex8.zip>) (тыкните по ссылке) и переносим  содержимое в папку .minecraft
- Если папки нет, можете создать её сами, либо запустить версию хотя бы один раз.
- **Нужно** использовать файл `УСТАНОВИТЬ.bat` из папки майнкрафта для **скачивания/обновления** сборки!!!
## Для Tlauncher:
- То же что и выше, но нужно создать отдельный профиль, и **ВЫКЛЮЧИТЬ** систему скинов Tlauncher и Sodium, чтобы он не докачивал лишние моды.
