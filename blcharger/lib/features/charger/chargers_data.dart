import 'package:blcharger/features/charger/charger_model.dart';
import 'package:blcharger/core/utils/id_generator.dart';

class ChargersData {
  static Map<String, ChargerModel> chargers = {};
  static List<String> chargerIds = [];

  static void populateChargers() {
    String charger1Id = generateUniqueId();
    chargerIds.add(charger1Id);
    chargers[charger1Id] = ChargerModel(
      name: "Carregador 1",
      id: charger1Id,
      imagePath: 'assets/chargingstation1.jpeg',
      pricePerKwh: 1.9,
      isAvailable: true,
      description: '''TIPO 2 (IEC 62196)

      Endereço: Av. Sen. Filinto Müler, 1555 - Vila Ipiranga, Campo Grande - MS, 79074-460

      Horário de Funcionamento: 
      Segunda-feira: 08:00–17:00
      Terça-feira: 08:00–17:00
      Quarta-feira: 08:00–17:00
      Quinta-feira: 08:00–17:00
      Sexta-feira: 08:00–17:00
      Sábado: 08:00–11:00
      Domingo: Fechado

      Telefone: (67) 3345-7543
      ''',
    );
    String charger2Id = generateUniqueId();
    chargerIds.add(charger2Id);
    chargers[charger2Id] = ChargerModel(
      name: "Carregador 2",
      id: charger1Id,
      imagePath: 'assets/chargingstation2.jpeg',
      pricePerKwh: 1.9,
      isAvailable: false,
      description: '''TIPO 3 

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
    );
    String charger3Id = generateUniqueId();
    chargerIds.add(charger3Id);
    chargers[charger3Id] = ChargerModel(
      name: "Carregador 3",
      id: charger3Id,
      imagePath: 'assets/chargingstation3.jpeg',
      pricePerKwh: 1.9,
      isAvailable: true,
      description: '''TIPO 1 

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
    );
    String charger4Id = generateUniqueId();
    chargerIds.add(charger4Id);
    chargers[charger4Id] = ChargerModel(
      name: "Carregador 4",
      id: charger4Id,
      imagePath: 'assets/chargingstation4.jpeg',
      pricePerKwh: 1.9,
      isAvailable: false,
      description: '''TIPO 1 

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
    );
    String charger5Id = generateUniqueId();
    chargerIds.add(charger5Id);
    chargers[charger5Id] = ChargerModel(
      name: "Carregador 5",
      id: charger5Id,
      imagePath: 'assets/chargingstation5.jpeg',
      pricePerKwh: 1.9,
      isAvailable: true,
      description: '''TIPO 2 
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
    );
    String charger6Id = generateUniqueId();
    chargerIds.add(charger6Id);
    chargers[charger6Id] = ChargerModel(
      name: "Carregador 6",
      id: charger6Id,
      imagePath: 'assets/chargingstation6.jpeg',
      pricePerKwh: 1.9,
      isAvailable: true,
      description: '''TIPO 3 

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
    );
  }
}
