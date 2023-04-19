# visiology-install.sh
Скрипты установки [аналитической платформы Visiology](https://ru.visiology.su)

Для использования клонируйте репозиторий на сервер, где планируется утановка аналитической платформы Visiology.

```
git clone https://github.com/nmmkn/visiology-install.sh.git
```
Сделайте исполняемыми все скрипты исполняемыми.

```
sudo chmod +x -R visiology-install.sh/
```
 Запустите скрипт установки.
 ```
 cd visiology-install.sh/ && sudo ./visiology-install.sh
 ```
 Скрипт установит последние версии аналитической платформы Visiology и Docker.
 
 Для установки необходимых версий, отредактируйте параметры конфигурации в файле `config.sh`
 ```
 ./resourses/conf/config.sh
 ```
 

Набор скриптов установки подготовлен для сервера с минимальным набором установленных компонентов.
