Este repositório contém uma POC para ilustrar a viabilidade de utilizar Flutter no desenvolvimento de SDKs.
O ponto crítico abordado é a complexidade de utilizar tais SDKs em mobile nativo.

A solução tem os seguintes componentes:
1. Biblioteca implementada em Flutter, onde são implementadas as funcionalidades que deseja-se ofertar
2. SDKs nativas (iOS e Android), que importam a biblioteca (1) e abstraem a complexidade de setup e comunicação com o Flutter

Com esta abordagem, temos as seguintes vantagens:
1. Possibilidade de ofertar SDKs em Flutter, iOS e Android
2. Melhora no XP dos desenvolvedores de apps nativos, pois a utilização do Flutter fica praticamente 100% abstraída

# Detalhamento técnico

A estrutura da POC não é otimizada e pode ser melhorada.

O repositório [flutter-poc-implementation](https://github.com/merci-app/flutter-poc-implementation) contém a implementação da SDK Flutter (1).
O repositório [flutter-poc](https://github.com/merci-app/flutter-poc) contém a implementação da SDK nativa em iOS.

Passo a passo para gerar uma nova versão da SDK Flutter e distribuí-la na SDK iOS:
1) Acessar [este path](https://github.com/merci-app/flutter-poc-implementation/tree/main/dock_flutter_sdk) e executar o comando `flutter build ios-framework --xcframework
`
2) Copiar os folders App.xcframework e Flutter.xcframework para o repositório flutter-poc.
3) Acessar [este path](https://github.com/merci-app/flutter-poc/tree/main/FlutterPOCSDK) e executar o script build.sh
4) Atualizar o podspec do flutter-poc-implementation, incrementando a versão
5) Comitar e subir as changes contidas no flutter-poc-implementation
6) Criar a tag no flutter-poc-implementation, de acordo com o passo (4)

Para instalar a SDK iOS no app cliente, adicionar `pod 'DockFlutterSDK_POC', :git =>'https://github.com/merci-app/flutter-poc', :tag => '1.0.0-alpha.09.debug'` no podfile.

TODOs:
- Melhorar a estrutura dos repositório. Unificar tudo em um só repositório (obs.: num ambiente produtivo talvez seja importante utilizar um repositório para as implementações e outro para os os podspecs, para não deixar a implementação num repo privado)
- Solucionar a limitação no app cliente (iOS): Flutter só funciona em modo debug + xcframewors debug ou em modo release + xcframewords release (ver passo 2 acima). Caso contrário, não ocorre nenhum erro, mas a UI do Flutter não é exibida. Por enquanto, a solução encontrada é gerar versões debug e release.

Obs.: a implementação da POC da SDK nativa em Android não foi realizada até o momento.