# bloc_count_batman

Aplicativo Flutter que demonstra o uso do padrão BLoC (Business Logic Component) para gerenciamento de estado, com tema do Batman.

## O que a aplicação faz

O app exibe um contador interativo onde cada incremento adiciona uma imagem do logotipo do Batman em uma posição aleatória na tela. As imagens permanecem estáveis (não mudam de posição) a cada interação.

### Funcionalidades

- **Incrementar (+1)**: Adiciona uma nova imagem do Batman em posição aleatória
- **Dobrar (x2)**: Dobra o número atual de imagens exibidas
- **Decrementar (-1)**: Remove a última imagem adicionada
- **Resetar (0)**: Limpa todas as imagens da tela

## Arquitetura

O projeto utiliza o padrão BLoC com a seguinte estrutura:

```
lib/
├── counter/
│   └── bloc/
│       ├── counter_bloc.dart    # Lógica de negócio do contador
│       ├── counter_event.dart   # Eventos (increment, decrement, reset, double)
│       └── counter_state.dart   # Estado do contador
├── pages/
│   └── counter_page.dart        # Página principal com UI
└── main.dart                    # Ponto de entrada da aplicação
```

## Dependências

- `flutter_bloc: ^8.1.3` - Gerenciamento de estado BLoC
- Flutter SDK 3.13.0+

## Como executar

```bash
flutter pub get
flutter run
```
