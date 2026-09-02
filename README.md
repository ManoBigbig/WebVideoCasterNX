# WebVideoCasterNX v0.1

Primeira build experimental do projeto WebVideoCasterNX.

## Objetivo desta versão

Esta versão é propositalmente mínima. Ela:

- inicia como homebrew `.nro`;
- inicializa a interface de console;
- inicializa o serviço de rede do Switch;
- informa na tela se a inicialização de rede foi bem-sucedida;
- fica aguardando enquanto preparamos a implementação do protocolo do Web Video Caster.

**Importante:** esta versão ainda NÃO implementa o protocolo do Web Video Caster e, portanto,
não deve ser esperada como um receiver funcional do WVC ainda. O teste serve para validar
que o ambiente de compilação e a execução do homebrew no Switch estão funcionando.

## Compilação

Requer um ambiente com devkitPro/devkitA64/libnx.

Na pasta do projeto:

    make

O resultado esperado é:

    WebVideoCasterNX.nro

## Instalação no Switch

Copie o `.nro` para:

    /switch/WebVideoCasterNX/WebVideoCasterNX.nro

e abra pelo seu menu de homebrew.

## Próxima etapa

Depois de confirmar que esta build abre no Switch, a próxima etapa é implementar
descoberta, pareamento/handshake e transporte usados pelo Web Video Caster.
