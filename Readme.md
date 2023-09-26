Este repositório contém uma POC para ilustrar a viabilidade de utilizar Flutter no desenvolvimento de SDKs.
O ponto crítico abordado é a complexidade de utilizar tais SDKs em mobile nativo.

A solução tem os seguintes componentes:
1. Biblioteca implementada em Flutter, onde são implementadas as funcionalidades
2. SDKs nativas (iOS e Android), que importam a biblioteca (1) e abstraem a complexidade de setup e comunicação com o Flutter

Com esta abordagem, temos as seguintes vantagens:
1. 