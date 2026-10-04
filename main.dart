import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

List<Reserva> reservas = [];

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reserva de Salas',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool mostrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(height: 120),

                Image.asset(
                  'assets/grupo_supplement_labs.png',
                  width: 260,
                ),
              
                const SizedBox(height: 40),

                const Text(
                  'Reserva de Salas',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: senhaController,
                  obscureText: !mostrarSenha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        mostrarSenha 
                          ? Icons.visibility 
                          : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          mostrarSenha = !mostrarSenha;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (usuarioController.text == 'Samuel' &&
                          senhaController.text == '12345') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuário ou senha incorretos.'),
                          ),
                        ); 
                    }
                  },
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva de Salas'),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 36,
            ),

              onSelected: (opcao) {
                if (opcao == 'agendamentos') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MeusAgendamentosPage(),
                    ),
                  );
                }

                if (opcao == 'sair') {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Sair da conta'),
                        content: const Text(
                          'Tem certeza que deseja sair da sua conta?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('CANCELAR'),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text('SAIR'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },

            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'agendamentos',
                child: Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 10),
                    Text('Meus agendamentos'),
                  ],
                ),
              ),

              const PopupMenuItem(
                value: 'sair',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text('Sair da conta'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

    body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Olá, Samuel!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Escolha uma sala para fazer sua reserva:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            SalaCard(
              nome: 'Body Nutry',
              capacidade: 'Até 12 pessoas',
              descricao: 'Sala de reunião grande para até 12 pessoas.',
              equipamentos: 'TV • Ar-condicionado • Frigobar • PC Desktop',
            ),

            const SizedBox(height: 15),

            SalaCard(
              nome: 'Snake Dragon',
              capacidade: 'Até 4 pessoas',
              descricao: 'Sala de reunião para até 4 pessoas.',
              equipamentos: 'TV • Climatizador • Quadro branco',
            ),

            const SizedBox(height: 15),

            SalaCard(
              nome: 'Speedz',
              capacidade: 'Até 2 pessoas',
              descricao: 'Sala de reunião para até 2 pessoas, ideal para reuniões ou treinamentos online.',
              equipamentos: 'PC Desktop • Climatizador',
            ),

            const SizedBox(height: 15),

            SalaCard(
              nome: 'Vit',
              capacidade: 'Até 2 pessoas',
              descricao: 'Sala de reunião para até 2 pessoas, ideal para reuniões ou treinamentos online.',
              equipamentos: 'PC Desktop • Climatizador',
            ),

            const SizedBox(height: 15),

            SalaCard(
              nome: 'Sala de Jogos',
              capacidade: 'Até 10 pessoas',
              descricao: 'Sala de jogos para descanso e diversão, para até 10 pessoas.',
              equipamentos: 'Sofá • Jogos de mesa • Sinuca • Ping-pong • Pebolim • Ar-condicionado',
            ),
          ],
        ),
      ),
    );
  }
}

class MeusAgendamentosPage extends StatefulWidget {
  const MeusAgendamentosPage({super.key});

  @override
  State<MeusAgendamentosPage> createState() =>
      _MeusAgendamentosPageState();
}

class _MeusAgendamentosPageState extends State<MeusAgendamentosPage> {

  String formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/'
        '${data.month.toString().padLeft(2, '0')}/'
        '${data.year}';
  }

  String formatarHorario(TimeOfDay horario) {
    return '${horario.hour.toString().padLeft(2, '0')}:'
        '${horario.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus agendamentos'),
      ),
      body: reservas.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não possui agendamentos.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: reservas.length,
              itemBuilder: (context, index) {
                Reserva reserva = reservas[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          reserva.sala,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Data: ${formatarData(reserva.data)}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Horário: ${formatarHorario(reserva.inicio)} - ${formatarHorario(reserva.fim)}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 15),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Cancelar reserva',
                                    ),
                                    content: const Text(
                                      'Tem certeza que deseja cancelar esta reserva?',
                                    ),

                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('NÃO'),
                                      ),

                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            reservas.removeAt(index);
                                          });

                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Reserva cancelada com sucesso!',
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text('SIM'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'CANCELAR RESERVA',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class SalaCard extends StatelessWidget {
  final String nome;
  final String capacidade;
  final String equipamentos;
  final String descricao;

  const SalaCard({
    super.key,
    required this.nome,
    required this.capacidade,
    required this.equipamentos,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

      
        leading: const Icon(
          Icons.meeting_room,
          size: 38,
          color: Colors.blue,
        ),

        title: Text(
          nome,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),

        subtitle: Text(
          '$capacidade\n$equipamentos',
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.green,
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SalaDetailsPage(
                nome: nome,
                descricao: descricao,
                equipamentos: equipamentos,
              
              ),
            ),
          );
        },
      ),
    );
  }
}

class SalaDetailsPage extends StatefulWidget {
  final String nome;
  final String descricao;
  final String equipamentos;

  const SalaDetailsPage({
    super.key,
    required this.nome,
    required this.descricao,
    required this.equipamentos,
  });

   @override
  State<SalaDetailsPage> createState() => _SalaDetailsPageState();
}

class _SalaDetailsPageState extends State<SalaDetailsPage> {
  DateTime? dataSelecionada;
  TimeOfDay? horarioInicio;
  TimeOfDay? horarioFim;

  Future<void> selecionarData() async {
    final DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (data != null) {
      setState(() {
        dataSelecionada = data;
      });
    }
  }

  Future<void> selecionarHorarioInicio() async {
  final TimeOfDay? horario = await showTimePicker(
    context: context,
    initialTime: const TimeOfDay(hour: 8, minute: 0),
  );

  if (horario != null) {
    setState(() {
      horarioInicio = horario;
    });
  }
}

Future<void> selecionarHorarioFim() async {
  final TimeOfDay? horario = await showTimePicker(
    context: context,
    initialTime: const TimeOfDay(hour: 18, minute: 0),
  );

  if (horario != null) {
    setState(() {
      horarioFim = horario;
    });
  }
}

bool horariosValidos() {
  if (horarioInicio == null || horarioFim == null) {
    return false;
  }

  final inicio = horarioInicio!.hour * 60 + horarioInicio!.minute;
  final fim = horarioFim!.hour * 60 + horarioFim!.minute;

  const inicioExpediente = 8 * 60;
  const fimExpediente = 18 * 60;

  if (inicio < inicioExpediente || inicio > fimExpediente) {
    return false;
  }

  if (fim < inicioExpediente || fim > fimExpediente) {
    return false;
  }

  if (fim <= inicio) {
    return false;
  }

  return true;
}

void confirmarReserva() {
  if (dataSelecionada == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Escolha uma data para a reserva.'),
      ),
    );
    return;
  }

  if (horarioInicio == null || horarioFim == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Escolha o horário de início e término.'),
      ),
    );
    return;
  }

  if (!horariosValidos()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'O horário deve estar entre 08:00 e 18:00, '
          'e o término deve ser depois do início.',
        ),
      ),
    );
    return;
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirmar reserva?'),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sala: ${widget.nome}'),

            const SizedBox(height: 8),

            Text(
              'Data: '
              '${dataSelecionada!.day.toString().padLeft(2, '0')}/'
              '${dataSelecionada!.month.toString().padLeft(2, '0')}/'
              '${dataSelecionada!.year}',
            ),

            const SizedBox(height: 8),

            Text(
              'Horário: '
              '${horarioInicio!.format(context)} - '
              '${horarioFim!.format(context)}',
            ),
          ],
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('CANCELAR'),
          ),

          ElevatedButton(
            onPressed: () {
               reservas.add(
                Reserva(
                  sala: widget.nome,
                  data: dataSelecionada!,
                  inicio: horarioInicio!,
                  fim: horarioFim!,
                ),
              );

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Reserva realizada com sucesso!',
                  ),
                ),
              );
            },
            child: const Text('CONFIRMAR'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.descricao,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Equipamentos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.equipamentos,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Data da reserva',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: selecionarData,
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  dataSelecionada == null
                      ? 'Escolher data'
                      : '${dataSelecionada!.day.toString().padLeft(2, '0')}/'
                        '${dataSelecionada!.month.toString().padLeft(2, '0')}/'
                        '${dataSelecionada!.year}',
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Horário de início',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: selecionarHorarioInicio,
                icon: const Icon(Icons.access_time),
                label: Text(
                  horarioInicio == null
                      ? 'Escolher horário'
                      : horarioInicio!.format(context),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Horário de término',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: selecionarHorarioFim,
                icon: const Icon(Icons.access_time),
                label: Text(
                  horarioFim == null
                      ? 'Escolher horário'
                      : horarioFim!.format(context),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: confirmarReserva,
                child: const Text(
                  'CONFIRMAR RESERVA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reserva {
  String sala;
  DateTime data;
  TimeOfDay inicio;
  TimeOfDay fim;

  Reserva({
    required this.sala,
    required this.data,
    required this.inicio,
    required this.fim,
  });
}