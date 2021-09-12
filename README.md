# flutter demoapp


## SetUp

### flutter install Linux

  https://flutter.dev/docs/get-started/install/linux

> $ git clone https://github.com/flutter/flutter.git -b stable

> $ export PATH="$PATH:`pwd`/flutter/bin"

> $ flutter --version
> Flutter 2.5.0 • channel stable • https://github.com/flutter/flutter.git
> Framework • revision 4cc385b4b8 (4日前) • 2021-09-07 23:01:49 -0700
> Engine • revision f0826da7ef
> Tools • Dart 2.14.0

### enable web

> $ flutter config --enable-web

### create new project

> $ flutter create demoapp

### LOCAL run

> $ flutter run -d chrome --web-port=8080 --web-hostname=127.0.0.1

### brduction build

> $ flutter build web


## Firebase Hosting

### fierbase install

> $ npm install -g firebase-tools

### fierbase logon

> $ firebase login

### fierbase project create

> $ fierbase init

>>  projext-ID :  appname
>>  project-dir:  build/web

### fierbase project deploy

> $ fierbase deploy

>> +  Deploy complete!
>> Hosting URL:  https://flutterdemo20210912.web.app/#/




