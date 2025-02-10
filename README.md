# Shorebird Example

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Shorebird](https://img.shields.io/badge/Shorebird-%2300C4CC.svg?style=for-the-badge&logo=shorebird&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue)

Este projeto é um exemplo de como integrar o [Shorebird](https://shorebird.dev/) em um aplicativo Flutter. O Shorebird é uma ferramenta poderosa que permite atualizações de código em tempo real para aplicativos Flutter, sem a necessidade de passar pelo processo de revisão das lojas de aplicativos.

Com este exemplo, você aprenderá como configurar o Shorebird, criar releases e patches, e gerenciar atualizações de código de forma eficiente.

---

## 🚀 Recursos

- **Integração com Shorebird:** Aprenda a configurar e usar o Shorebird para atualizações de código em tempo real.
- **Exemplo Prático:** Um aplicativo Flutter simples que demonstra a funcionalidade do Shorebird.
- **Fácil de Configurar:** Passo a passo detalhado para configurar o ambiente e executar o projeto.
- **Atualizações Sem Esforço:** Veja como criar patches e atualizar seu aplicativo sem precisar de novas publicações nas lojas.

---

## 📋 Pré-requisitos

Antes de começar, certifique-se de que você tem o seguinte instalado:

- [Flutter](https://flutter.dev/docs/get-started/install) (versão estável mais recente)
- [Dart](https://dart.dev/get-dart)
- [Shorebird CLI](https://shorebird.dev/docs/getting-started) (instalado globalmente)

---

## 🛠️ Como Configurar e Executar o Projeto

Siga os passos abaixo para configurar e executar o projeto localmente.

### 1. Clone o Repositório

```bash
git clone https://github.com/luisgustavoo/shorebird_example.git
cd shorebird_example
```

#### 2. Instale as Dependências
```bash
flutter pub get
```
#### 3. Execute o Aplicativo
```bash
flutter run
```
#### 4. Integração com Shorebird
```bash
shorebird init
```
#### 5. Crie uma Nova Release
```bash
shorebird release
```

### 🗂️ Estrutura do Projeto
```bash
shorebird_example/
├── lib/
│   └── main.dart          # Ponto de entrada do aplicativo
├── assets/                # Arquivos estáticos (imagens, fonts, etc.)
├── test/                  # Testes unitários e de integração
├── pubspec.yaml           # Dependências do projeto
├── README.md              # Este arquivo
└── shorebird.yaml         # Configuração do Shorebird
```
### 📚 Documentação Adicional

#### Shorebird
Para mais informações sobre como o Shorebird funciona e como utilizá-lo em seus projetos, consulte a [documentação oficial](https://docs.shorebird.dev/).

#### Flutter
Se você é novo no Flutter, confira a [documentação oficial do Flutter](https://docs.flutter.dev/) para começar.

### 🤝 Contribuição
Contribuições são bem-vindas! Se você quiser contribuir para este projeto, siga os passos abaixo:

1. Faça um fork do projeto.

2. Crie uma nova branch (`git checkout -b feature/nova-feature`).

3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`).

4. Faça push para a branch (`git push origin feature/nova-feature`).

5. Abra um Pull Request.

Por favor, certifique-se de que suas contribuições estejam alinhadas com as diretrizes do projeto.

### ✉️ Contato
Se você tiver alguma dúvida, sugestão ou quiser contribuir, sinta-se à vontade para entrar em contato:

Luis Gustavo

GitHub: [luisgustavoo](https://github.com/luisgustavoo)

Email: [luisgustavodeevbr@gmail.com]()