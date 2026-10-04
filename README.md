`Reserva de Salas`

Um aplicativo desenvolvido em Flutter utilizando o Visual Studio Code para compilação do código, feito para realizar o agendamento de salas de reunião de uma empresa

O aplicativo permite que o usuário faça login, visualize as salas disponíveis para agendamento, consulte as características de cada sala, escolha uma data e horário e realize uma reserva

`Funcionalidades`

Login de usuário
Visualização das salas disponíveis com descrição e equipamentos de cada sala
Seleção de data e horário para a reserva
Validação do horário para confirmar o agendamento
Confirmação de reserva
Visualização dos próprios agendamentos e possível cancelar o mesmos
Sair da conta e realizar novo login

`Tecnologias utilizadas`

Flutter
Programação em Dart
Android Studio

`Requisitos`

Para executar o aplicativo no computador, é necessário instalar os seguintes programas:

Flutter SDK
Android Studio
Configurar o android SDK dentro do Android Studio, instalando as seguintes configurações em SDK TOOLS:
    Android SDK Build-Tools
    NDK (side by side)
    Android SDK Command-line Tools (latest)
    CMake
    Android Emulator
    Android Emulator Hypervisor driver
    Android SDK Platform-Tools
Utilizar celular Android físico via cabo USB ou emular um Android pelo próprio Android Studio

`Como executar o aplicativo`

Abra a pasta `reserva_salas` no Android Studio ou no VS Code.

`Verificar o Flutter`

Dentro da pasta `lib` em `main.dart` abrir o terminal executar:

`flutter doctor`

`dependencias do aplicativo`

Executar no terminal:

`flutter pub get`

Conectar um celular Android por cabo USB no computador ou iniciar um Emulador (De preferencia com o Android 15)

`Executar o aplicativo`

No terminal executar o comando:

`flutter run`

Na tela de Login do Aplicativo utilizar o seguinte login:

`Usuário: Samuel`
`Senha: 12345`
