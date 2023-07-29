import 'package:blcharger/features/charger/charger_model.dart';
import 'package:blcharger/core/utils/id_generator.dart';

class ChargersData {
  static List<ChargerModel> chargers = [
    ChargerModel(
      id: generateUniqueId(),
      chargerImagePath: 'assets/chargingstation1.jpeg',
      chargerDescription: '''TIPO 2 (IEC 62196)

      Endereço: Av. Sen. Filinto Müler, 1555 - Vila Ipiranga, Campo Grande - MS, 79074-460

      Horário de Funcionamento: 
      Segunda-feira: 08:00–17:00
      Terça-feira: 08:00–17:00
      Quarta-feira: 08:00–17:00
      Quinta-feira: 08:00–17:00
      Sexta-feira: 08:00–17:00
      Sábado: 08:00–11:00
      Domingo: Fechado

      Telefone: (67) 3345-7543''',
      pricePerKwh: 12.34,
      isAvailable: true,
    ),
    ChargerModel(
      id: generateUniqueId(),
      chargerImagePath: 'assets/chargingstation2.jpeg',
      chargerDescription: '''TIPO 3 (SuperCharge)

      Endereço: Rua Padre João Manuel, 222 - Jardins, São Paulo - SP, 01411-000

      Horário de Funcionamento:
      Segunda-feira: 08:00–18:00
      Terça-feira: 08:00–18:00
      Quarta-feira: 08:00–18:00
      Quinta-feira: 08:00–18:00
      Sexta-feira: 08:00–18:00
      Sábado: 10:00–15:00
      Domingo: Fechado

      Telefone: (11) 3079-3019
''',
      pricePerKwh: 12.34,
      isAvailable: false,
    ),
    ChargerModel(
      id: generateUniqueId(),
      chargerImagePath: 'assets/chargingstation3.jpeg',
      chargerDescription: '''TIPO 1 (QuickCharge)

    Endereço: Av. Engenheiro Luís Carlos Berrini, 105 - Brooklin, São Paulo - SP, 04571-010

    Horário de Funcionamento:
    Segunda-feira: 07:00–19:00
    Terça-feira: 07:00–19:00
    Quarta-feira: 07:00–19:00
    Quinta-feira: 07:00–19:00
    Sexta-feira: 07:00–19:00
    Sábado: 08:00–12:00
    Domingo: Fechado

    Telefone: (11) 5503-6682
    ''',
      pricePerKwh: 12.34,
      isAvailable: true,
    ),
    ChargerModel(
      id: generateUniqueId(),
      chargerImagePath: 'assets/chargingstation4.jpeg',
      chargerDescription: '''TIPO 1 (MaxCharge)

    Endereço: Rua Des. Westphalen, 15 - Centro, Curitiba - PR, 80010-110

    Horário de Funcionamento:
    Segunda-feira: 07:30–17:30
    Terça-feira: 07:30–17:30
    Quarta-feira: 07:30–17:30
    Quinta-feira: 07:30–17:30
    Sexta-feira: 07:30–17:30
    Sábado: 08:00–12:00
    Domingo: Fechado

    Telefone: (41) 3013-6000
    ''',
      pricePerKwh: 12.34,
      isAvailable: false,
    ),
    ChargerModel(
      id: generateUniqueId(),
      chargerImagePath: 'assets/chargingstation5.jpeg',
      chargerDescription: '''TIPO 2 (PowerCharge)
    TIPO 1 (MaxCharge)

    Endereço: Rua Des. Westphalen, 15 - Centro, Curitiba - PR, 80010-110

    Horário de Funcionamento:
    Segunda-feira: 07:30–17:30
    Terça-feira: 07:30–17:30
    Quarta-feira: 07:30–17:30
    Quinta-feira: 07:30–17:30
    Sexta-feira: 07:30–17:30
    Sábado: 08:00–12:00
    Domingo: Fechado

    Telefone: (41) 3013-6000

    ''',
      pricePerKwh: 12.34,
      isAvailable: true,
    ),
    ChargerModel(
      id: generateUniqueId(),
      chargerImagePath: 'assets/chargingstation6.jpeg',
      chargerDescription: '''TIPO 3 (TurboCharge)

      Endereço: Av. Gov. Ivo Silveira, 3581 - Capoeiras, Florianópolis - SC, 88085-002

      Horário de Funcionamento:
      Segunda-feira: 08:00–18:00
      Terça-feira: 08:00–18:00
      Quarta-feira: 08:00–18:00
      Quinta-feira: 08:00–18:00
      Sexta-feira: 08:00–18:00
      Sábado: 09:00–14:00
      Domingo: Fechado

      Telefone: (48) 3037-4004

    ''',
      pricePerKwh: 12.34,
      isAvailable: true,
    ),
  ];
}
